#!/bin/bash

# 使用tput和sleep从0开始计数到40
# tput 详解 http://www.ibm.com/developerworks/cn/aix/library/au-learningtput/
echo -n Count:
tput sc
# tput sc 保存当前光标位置 
# tput rc 恢复光标位置 
# tput ed 清除从当前光标位置到行末的内容
count=0
while true;
do
	if [ $count -lt 40 ];then
		let count++;
		sleep 1;
		tput rc
		tput ed
		echo -n $count
	else exit 0;
	fi
done
