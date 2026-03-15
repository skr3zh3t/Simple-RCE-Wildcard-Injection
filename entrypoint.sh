#!/bin/bash
echo "${USER_FLAG}" > /home/user.txt
echo "${ROOT_FLAG}" > /root/root.txt

chmod 600 /root/root.txt
chown www-data:www-data /home/user.txt

unset USER_FLAG
unset ROOT_FLAG

su -s /bin/bash -c "catalina.sh run" www-data