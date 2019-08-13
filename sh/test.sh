#!/bin/sh
util_base_url=https://github.com/huo376230434/daily-utils/blob/master
if [ ! -e ./base.sh ]; then
wget $util_base_url/sh/base.sh
fi
source ./base.sh;

#调用字符串不存在方法的demo
str="export PATH=\"/opt/lampp/bin:\$PATH\""
file=$PWD/profile
append_file_if_not_exists "$str" $file

