#!/usr/bin/expect -f
# auto ssh login
set timeout 30
set sshhost  192.168.1.211

spawn ssh -l username -p 22 $sshhost
expect "password:"
send "123456\r"
interact
