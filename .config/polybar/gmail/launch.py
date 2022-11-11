#!/usr/bin/env python3

import time
from pathlib import Path
from googleapiclient import discovery
from google.oauth2.credentials import Credentials

DIR = Path(__file__).resolve().parent
CREDENTIALS_PATH = Path(DIR, 'credentials.json')

def get_unread_msg_count():
	creds = Credentials.from_authorized_user_file(CREDENTIALS_PATH)
	gmail = discovery.build('gmail', 'v1', credentials=creds)
	labels = gmail.users().labels().get(userId='me', id='INBOX').execute()
	count = labels['messagesUnread']
	return count

unread_msg_cnt = 0
cnt_updated_once = False

print('~', flush = True)

while True:

	try:
		if Path(CREDENTIALS_PATH).is_file():
			unread_msg_cnt = get_unread_msg_count()
			print(unread_msg_cnt, flush = True)
			cnt_updated_once = True
		else:
			print('~', flush = True)

		time.sleep(60)
	except:
		if cnt_updated_once:
			print('~ ' + str(unread_msg_cnt), flush = True)
		else:
			print('~', flush = True)

		time.sleep(5)
	
