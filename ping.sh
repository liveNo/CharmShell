#!/bin/bash
# filename ping.sh
# 用途：根据你的网络配置对网络地址192.168.0进行修改
# 解析：ping $ip -c 2 &> /dev/null 会在每次循环中ping 对应的ip地址。 -c 2 是将发送的echo 数组数量限制为2。 &> /dev/null用于将stderr 和stdout 重写向到/dev/null，使他们不会在终端打印出来。
# $? 获取退出状态，正常退出状态为0，否则为非0.

for ip in 192.168.0.{1..255};
do
	ping $ip -c 2 &> /dev/null ;
	if [ $? -eq 0 ];
	then
		echo $ip is alive
	fi
done
