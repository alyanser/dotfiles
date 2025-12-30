function fish_prompt
    # Save last command status
    set -l last_status $status

    # Colors using fish’s set_color
    set -l red (set_color red)
    set -l green (set_color green)
    set -l blue (set_color blue)
    set -l purple (set_color magenta)
    set -l normal (set_color normal)

    # Prompt start: username and hostname
    # $USER and $hostname are built-in variables in fish
    echo -n -s $purple "(" $USER " "

    # Status indicator: red if failure (except 130), green otherwise
    if test $last_status -ne 0 -a $last_status -ne 130
        echo -n -s $red "@"
    else
        echo -n -s $green "@"
    end

    # Working directory in blue
    echo -n -s " " $blue (prompt_pwd) $purple ")"

    # Dollar sign colored by status
    if test $last_status -ne 0 -a $last_status -ne 130
        echo -n -s " " $red "\$ "
    else
        echo -n -s " " $green "\$ "
    end

    # Reset colors
    echo -n -s $normal
end
