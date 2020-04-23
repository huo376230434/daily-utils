#!/bin/sh



current_dir="$( cd "$( dirname "$0"  )" && pwd  )"

function init() {
  util_base_url=https://raw.githubusercontent.com/huo376230434/daily-utils/master
  util_url_suffix=common1/base.sh
  base_path=$current_dir/$util_url_suffix;
if [ ! -e  $base_path ]; then
echo "要请求远程拉取公共函数库"

    if [ ! -d $current_dir/common ] ;then
        mkdir common;
    fi
cd common;
wget ${util_base_url}/sh/${util_url_suffix}
cd ../
fi
}
init;




sudo rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

sudo yum install -y nginx

sudo systemctl start nginx.service

sudo systemctl enable nginx.service




