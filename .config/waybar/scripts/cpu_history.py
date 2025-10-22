#!/usr/bin/env python3
"""CPU Usage Graph Monitor - Displays a unicode graph of CPU usage history using Braille characters."""
import json
import os
import sys
import psutil
import argparse
from pathlib import Path

# Configuration
CACHE_DIR = Path(os.environ.get('XDG_CACHE_HOME', Path.home() / '.cache'))
HISTORY_FILE = CACHE_DIR / 'cpu_usage_history.json'
DEFAULT_HISTORY_DEPTH = 40

# Braille patterns for vertical bar graphs
BRAILLE_PATTERNS = {
    (0, 0): '⠀', (1, 0): '⡀', (2, 0): '⡄', (3, 0): '⡆', (4, 0): '⡇',
    (0, 1): '⢀', (1, 1): '⣀', (2, 1): '⣄', (3, 1): '⣆', (4, 1): '⣇',
    (0, 2): '⢠', (1, 2): '⣠', (2, 2): '⣤', (3, 2): '⣦', (4, 2): '⣧',
    (0, 3): '⢰', (1, 3): '⣰', (2, 3): '⣴', (3, 3): '⣶', (4, 3): '⣷',
    (0, 4): '⢸', (1, 4): '⣸', (2, 4): '⣼', (3, 4): '⣾', (4, 4): '⣿',
}

def get_braille_char(left_val, right_val):
    """Convert two percentage values (0-100) to a single Braille character."""
    # Convert percentages to levels (1-4), minimum 1 to always show at least one dot
    left_level = max(1, min(int(left_val * 4 / 100), 4))
    right_level = max(1, min(int(right_val * 4 / 100), 4))
    return BRAILLE_PATTERNS.get((left_level, right_level), '⣀')

def load_data():
    """Load data from cache file."""
    try:
        with open(HISTORY_FILE, 'r') as f:
            data = json.load(f)
            # Handle legacy format
            if isinstance(data, list):
                return {"history": data, "show_graph": True}
            return data
    except (FileNotFoundError, json.JSONDecodeError):
        return {"history": [], "show_graph": True}

def save_data(data):
    """Save data to cache file."""
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    with open(HISTORY_FILE, 'w') as f:
        json.dump(data, f)

def main():
    parser = argparse.ArgumentParser(description='CPU Usage Graph Monitor with Braille display')
    parser.add_argument('command', nargs='?', help='Command: toggle')
    parser.add_argument('-d', '--depth', type=int, default=DEFAULT_HISTORY_DEPTH,
                        help=f'History depth (default: {DEFAULT_HISTORY_DEPTH})')
    args = parser.parse_args()
    
    # Ensure even depth for Braille pairs
    history_depth = args.depth + (args.depth % 2)
    
    data = load_data()
    
    # Handle toggle command
    if args.command == "toggle":
        data["show_graph"] = not data.get("show_graph", True)
        save_data(data)
        return
    
    # Get CPU usage
    per_core = psutil.cpu_percent(interval=0.1, percpu=True)
    current_usage = sum(per_core) / len(per_core)
    
    # Update history
    history = data["history"]
    history.append(current_usage)
    
    # Keep only needed history
    if len(history) > history_depth:
        history = history[-history_depth:]
    
    # Generate output
    if data.get("show_graph", True):
        # Pad with zeros if needed
        padded = [0.0] * (history_depth - len(history)) + history
        
        # Build graph
        graph = ''.join(
            get_braille_char(
                padded[i],
                padded[i + 1] if i + 1 < history_depth else 0.0
            )
            for i in range(0, history_depth, 2)
        )
        text = f"[{graph}]"
    else:
        text = f"{current_usage:.1f}%"
    
    # Save and output
    data["history"] = history
    save_data(data)
    
    # Build color-coded tooltip
    tooltip_lines = []
    for i, usage in enumerate(per_core):
        if usage >= 80:
            color = "#ff6b6b"  # Red for high load
        elif usage >= 60:
            color = "#feca57"  # Yellow for medium-high load
        elif usage >= 40:
            color = "#48dbfb"  # Cyan for medium load
        else:
            color = "#1dd1a1"  # Green for low load
        
        tooltip_lines.append(f'<span color="{color}">Core {i}: {usage:5.1f}%</span>')
    
    # Output for waybar
    print(json.dumps({
        "text": text,
        "tooltip": '\n'.join(tooltip_lines),
        "class": "cpu-history"
    }))

if __name__ == "__main__":
    main()
