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
    warn "修改数据库密码 mysqladmin -uroot -p password \$password  密码要复杂"
    warn "如果mysql 密码修改成功 ;还需要在phpadmin 的config.ini.php ; auth_type 改成cookie (一定要改成cookie ,否则就不能登录)";

     warn "然后 etc/extra/httpd-xampp.conf 更改
Alias /phpmyadmin \"/opt/lampp/phpmyadmin/\"
<Directory \"/opt/lampp/phpMyAdmin\">
AllowOverride AuthConfig
Require all granted";

warn " lampp restartapache"
    warn "再 yum install git ";
    warn "mkdir /var/www ";
    warn "cd /var/www";

  success "接代码，recycle_huan / recycle_nt "

    warn "git clone https://git.dev.tencent.com/huo376230434/recycle_huan.git";
    warn " chmod -R 777 application/cache";
    warn "chmod -R 777 upload";
    success "etc/httpd.conf  中的："
    warn " Include etc/extra/httpd-vhosts.conf取消注释"
    warn "<Directory />
    AllowOverride none
    Require all granted
</Directory>"
    warn "etc/extra/httpd-vhost.conf 加配置";
    warn "<VirtualHost *:80>
    DocumentRoot \"/var/www/recycle_huan\"
    ServerName huan.heznn.com
    ErrorLog \"/var/log/recycle_huan_log\"
</VirtualHost>";
warn " lampp restartapache"

info "下面是程序修改，将CustomEnv.php.example 复制 ；改数据库配置!"

}
# 命令提示

# 命令提示
# 如果 xampp 软链接存在，则说明已经安装过 xampp 直接进行下一步 修改密码等
if [  -e /etc/rc.d/init.d/xampp -a ! "$1"  ]
then

#mysqladmin -uroot -p password $1;
next_tips;
exit 0;
fi


yum update -y
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

info "开机自启动";
ln -s /opt/lampp/lampp  /usr/bin/lampp
ln -s /opt/lampp/xampp  /etc/rc.d/init.d/xampp
chkconfig --add xampp
chkconfig xampp on

info "添加进环境变量(如果没添加过的话)";

str="export PATH=\"/opt/lampp/bin:\$PATH\""
file=/etc/profile
append_file_if_not_exists "$str" $file
source /etc/profile;
#service xampp start;

#echo "root 密码为 $1 ";
#mysqladmin -uroot password $1;
#warn "如果mysql 更改密码成功的话，还需要在phpadmin 的config.ini.php 中将密码改成现在的!";
#warn "访问 ";
next_tips;