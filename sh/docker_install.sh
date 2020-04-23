#!/bin/sh

################## 引入 base 函数库 ##################

current_dir="$( cd "$( dirname "$0"  )" && pwd  )"


# shellcheck disable=SC2112
function init() {
  util_base_url=http://luoyexn.xin/daily-utils/
  util_url_suffix=common/base.sh
  base_path=$current_dir/$util_url_suffix;
if [ ! -e  $base_path ]; then
info "要请求远程拉取shell函数库"

    if [ ! -d $current_dir/common ] ;then
        mkdir common;
    fi
# shellcheck disable=SC2164
cd common;
wget ${util_base_url}/sh/${util_url_suffix}
cd ../
fi
}
init;



source common/base.sh;
################## 正文 ##################


check_system_type
is_ubuntu=$?;

    if  [ $is_ubuntu -gt 0 ];then
      echo "ubuntu"
      sudo apt update
      apt install git curl
    else
      echo "centos"
      sudo yum update
      yum install git
    fi

exit 1;




curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

sudo curl -L https://github.com/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version
