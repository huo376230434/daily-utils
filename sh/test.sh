#!/bin/sh

function init() {
  util_base_url=https://raw.githubusercontent.com/huo376230434/daily-utils/master
  util_url_suffix=./common/base.sh
if [ ! -e  $util_url_suffix ]; then
echo "要请求远程"

    if [ ! -d ./common ] ;then
        mkdir common;
    fi
cd common;
wget ${util_base_url}/sh/${util_url_suffix}
cd ../
fi
}
init;


source common/base.sh;
####################### 正文 ######################



     warn "然后更改 xampp 配置文件
Alias /phpmyadmin \"/opt/lampp/phpmyadmin/\"
<Directory \"/opt/lampp/phpMyAdmin\">
AllowOverride AuthConfig
Require all granted";
#echo $1;
#
#if [  -e ./profile -a ! "$1"  ];
#then
#
#echo "执行mysql"
#exit 0;
#fi
#echo "no"

##调用字符串不存在方法的demo
#str="export PATH=\"/opt/lampp/bin:\$PATH\""
#file=$PWD/profile
#echo '44'
#append_file_if_not_exists "$str" $file
#
