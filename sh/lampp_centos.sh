#!/bin/sh

################## 引入 base 函数库 ##################

function init() {
  util_base_url=https://raw.githubusercontent.com/huo376230434/daily-utils/master
  util_url_suffix=./common/base.sh
if [ ! -e  $util_url_suffix ]; then
info "要请求远程"

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
################## 正文 ##################


function next_tips() {
    warn "修改数据库密码 mysqladmin -uroot -p password \$password "
    warn "如果mysql 密码修改成功 ;还需要在phpadmin 的config.ini.php 中将密码改成 $1";


}
# 命令提示
# 如果lampp软链接存在，则说明已经安装过 lampp 直接进行下一步 修改密码等
if [  -e /usr/bin/lampp -a ! "$1"  ]
then

#mysqladmin -uroot -p password $1;
next_tips;
exit 0;
fi

#yum update -y
xampp_install_obj=xampp-linux-x64-7.2.21-0-installer.run
if [ ! -e ./$xampp_install_obj ];then
info '拉取xampp installer'
wget https://liquidtelecom.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.2.21/$xampp_install_obj
else
info 'xampp installer 已经存在，直接用'
fi

chmod -R 777 ./xampp-linux-x64-7.2.21-0-installer.run

info '安装xampp';
./xampp-linux-x64-7.2.21-0-installer.run
success '安装xampp完成';

info "开机自启动";

ln -s /opt/lampp/xampp  /etc/rc.d/init.d/xampp

chkconfig --add xampp
chkconfig xampp on

info "添加进环境变量(如果没添加过的话)";
info "把 lampp 加进软链接 "

ln -s /opt/lampp/lampp  /usr/bin/lampp
lampp start &

str="export PATH=\"/opt/lampp/bin:\$PATH\""
file=/etc/profile
append_file_if_not_exists "$str" $file
source /etc/profile;

warn "lampp 安装成功，请 reboot 重启，然后再执行后面的语句"

next_tips;
