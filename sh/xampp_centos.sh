#!/bin/sh
#yum update -y
if [ ! $1 ]
then 
echo '数据库密码必填 调用格式为 ./xampp_centos.sh 数据库密码 是否已经拉取过xamppintaller(默认为false 已经拉取过可传 1 )'
exit 0;
fi

if [ ! $2 ]
echo '拉取xampp installer'
wget https://liquidtelecom.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.2.21/xampp-linux-x64-7.2.21-0-installer.run
then 
echo 'xampp installer 已经存在，直接用'
fi
chmod -R 777 ./xampp-linux-x64-7.2.21-0-installer.run
echo '安装xampp';
./xampp-linux-x64-7.2.21-0-installer.run
echo '安装xampp完成';
echo "开机自启动";
init_d_soft_link=/etc/rc.d/init.d/xampp

if [ -e $init_d_soft_link ] then
ln -s /opt/lampp/xampp  $init_d_soft_link
fi

chkconfig --add xampp
chkconfig xampp on

echo "添加进环境变量";
echo "export PATH=\"/opt/lampp/bin:$PATH\"" >> /etc/profile;
source /etc/profile;
echo "root 密码为 $1 ";

mysqladmin -uroot password $1;
echo "还需要在phpadmin 的config.ini.php 中将密码改成现在的!";
echo "重启";
