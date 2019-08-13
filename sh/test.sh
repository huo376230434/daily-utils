#!/bin/sh

function init() {
  util_base_url=https://raw.githubusercontent.com/huo376230434/daily-utils/master
if [ ! -e ./base.sh ]; then
echo "要请求远程"
wget ${util_base_url}/sh/base.sh
fi
}
init;

source ./base.sh;

#调用字符串不存在方法的demo
str="export PATH=\"/opt/lampp/bin:\$PATH\""
file=$PWD/profile
echo '44'
append_file_if_not_exists "$str" $file

