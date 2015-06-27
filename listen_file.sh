#!/bin/bash

echo "脚本监听情况:"

# 修改为自己的项目路径
BASE=$HOME'Rest'
# 监听目录与日志
REPATH='models'
LOG=$PWD/log
# 原日志md5记录  对比新的md5记录
INIT_MD5='log_1.md5'
NEW_MD5='log_2.md5'

# 搜索的文件
EXT='*.php'

if [ ! -d $LOG ];then
    mkdir -p $LOG
fi

funmd51() {
    find $BASE/$REPATH -iname "$EXT" -type f | xargs md5sum > $LOG/$INIT_MD5
}
funmd52() {
    find $BASE/$REPATH -iname "$EXT" -type f | xargs md5sum > $LOG/$NEW_MD5
}
if [ ! -f $LOG/$INIT_MD5 ];then
    funmd51
fi

while(true)
do  
    sleep 3 
    funmd52
    diff $LOG/$INIT_MD5 $LOG/$NEW_MD5 > $LOG/diff.log
    Status=$?
    echo $Status
    if [ $Status = 0 ];then
        continue 
    else
        DATE=`date '+%Y-%m-%d %H:%M:%S'`
        cp $LOG/$NEW_MD5 $LOG/$INIT_MD5
        echo -e 'Found Change Time 【'$DATE'】'
    fi
done
