#!/bin/sh
yum update -y
wget https://liquidtelecom.dl.sourceforge.net/project/xampp/XAMPP%20Linux/7.2.21/xampp-linux-x64-7.2.21-0-installer.run
chmod -R 777 ./xampp-linux-x64-7.2.21-0-installer.run
echo '安装xampp';
./xampp-linux-x64-7.2.21-0-installer.run
echo '安装xampp完成';
echo "开机自启动";
ln -s /opt/lampp/xampp /etc/rc.d/init.d/xampp
chkconfig --add xampp
chkconfig xampp on

echo "添加进环境变量";
echo "\n export PATH=\"/opt/lampp/bin:$PATH\"" >> /etc/profile;
source /etc/profile;
echo "root 密码为 $1 ";

mysqladmin -uroot password $1;
echo "还需要在phpadmin 的config.ini.php 中将密码改成现在的!";
echo "重启";
