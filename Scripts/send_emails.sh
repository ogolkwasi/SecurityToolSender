#!/bin/bash

FROM="kwasi@web3savannah.io"
SUBJECT="Test"
BODY="Testing Bulk using Gmail" 
SMTP_SERVER="smtp.gmail.com:587"
USERNAME="kwasi@web3savannah.io"
PASSWORD="wwjxfafoicyvzwwj"

BODY_CONTENT="<html><body><h1>Hello, World!</h1><p>This is an HTML email.</p></body></html>"

while IFS= read -r TO; do
    sendemail -f "$FROM" -t "$TO" -u "$SUBJECT" -o message-content-type=html -m "$BODY_CONTENT" -o tls=yes -s "$SMTP_SERVER" -xu "$USERNAME" -xp "$PASSWORD"
done < recipients.txt
