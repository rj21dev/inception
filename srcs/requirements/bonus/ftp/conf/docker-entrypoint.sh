#!/bin/bash

useradd -m -s /bin/bash $FTP_USER > /dev/null
echo "${FTP_USER}:${FTP_PASS}" | chpasswd > /dev/null
echo ${FTP_USER} >> /etc/vsftpd.userlist

exec $@