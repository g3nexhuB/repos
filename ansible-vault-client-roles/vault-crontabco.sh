#!/bin/sh

crontab -l > crontab.lst
cat crontab.lst
# 2. Edit/append the created file
echo "@reboot (sleep 20; sh /usr/local/bin/unseal.sh)" > crontab.lst
echo "#* * * * * sh /opt/cent-test-pw.sh" >> crontab.lst
# 3. Install edited crontab file:
crontab crontab.lst
sleep 2
crontab -l
rm -rf crontab.lst

