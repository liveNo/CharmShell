#!/bin/sh
#
# @var 备份目录  .tar.gz 后缀   name+date.tar.gz
# ./backup.sh /home/uname/test -print
# -print 将压缩过程打印到屏幕
# 压缩到当前目录

if [ ! -n "$1" ];then
    echo "file path not null!";
    echo "Usage: $0 {DIR_PATH} {[-print]}";
    exit 1;
fi

if [ ! -d "$1" ];then
    echo "Usage: $1 is not exists!";
    exit 1;
fi

TAR_DIR=$1
# 压缩的文件名称与时间(精确到分)
TAR_FILE=`basename $TAR_DIR`
TODAY=`date '+%Y%m%d%H%M'`
SUFFIX='.tar.gz'

if [ "-print"="$2" ];then
    tar zcvf $TAR_FILE'-'$TODAY$SUFFIX $TAR_DIR
else
    tar zcf $TAR_FILE'-'$TODAY$SUFFIX $TAR_DIR
fi

if [ $? = 0 ];then
    echo "压缩完成!";
    exit 0;
fi

