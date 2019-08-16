#!/bin/sh



current_dir="$( cd "$( dirname "$0"  )" && pwd  )"

function init() {
  util_base_url=https://raw.githubusercontent.com/huo376230434/daily-utils/master
  util_url_suffix=common/base.sh
  base_path=$current_dir/$util_url_suffix;
if [ ! -e  $base_path ]; then
echo "要请求远程"

    if [ ! -d $current_dir/common ] ;then
        mkdir common;
    fi
cd common;
wget ${util_base_url}/sh/${util_url_suffix}
cd ../
fi
}
init;

exit 2;
source $current_dir/common/base.sh;
####################### 正文 ######################
echo $PWD;

must_be_root;
#
#     warn "然后更改 xampp 配置文件
#Alias /phpmyadmin \"/opt/lampp/phpmyadmin/\"
#<Directory \"/opt/lampp/phpMyAdmin\">
#AllowOverride AuthConfig
#Require all granted";
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
