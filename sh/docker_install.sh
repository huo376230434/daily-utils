#!/bin/sh
# ubuntu 用这个
function check_system_type() {
   is_ubuntu=`cat /etc/issue | grep Ubuntu`
    count=${#is_ubuntu}
    if  [ $count -gt 0 ];then
   return 1;
    else
return 0;
  fi
}

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
