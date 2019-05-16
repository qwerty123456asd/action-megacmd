#!/bin/bash

set -e

bash -c  "nohup tail -f /root/.megaCmd/megacmdserver.log >&0 2>1" &
if [[ "$USERNAME" != "NOBODY" ]] && [[ "$PASSWORD" != "CHANGEME" ]]; then
    mega-login $USERNAME $PASSWORD
fi

if [[ "$*" == "" ]]; then
	echo "Please specify a valid megacli command"
    	exit 1
fi

sh -c "mega-$*"
