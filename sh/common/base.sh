#!/bin/sh

function error() {
    echo  -e "\033[31m $1 \033[0m"
}

function success() {
    echo  -e "\033[32m $1 \033[0m"
}

function info() {
    echo  -e "\033[37m $1 \033[0m"
}

function warn() {
    echo  -e "\033[33m $1 \033[0m"
}


#字符串是否在文件之内
function is_str_in_file() {
    str=$1;
    file=$2;
    #echo $str;
    res=`grep "$str" $file  `
    count=${#res}
    if  [ $count -gt 0 ];then
   return 1;
    else
return 0;
    fi
}

#如果字符串不存在文件中，则追加
function append_file_if_not_exists() {
   is_str_in_file "$1" $2
   res=$?;
if [ $res -eq 0 ] ; then
   echo $1 >> $2;
fi
}

#强制为root ,否则退出
function must_be_root() {
    user=`whoami`
    if [ $user != "root" ]; then
        echo "当前执行用户必须为root";
        exit 1;
    fi
}


#current_dir="$( cd "$( dirname "$0"  )" && pwd  )" // 获取当前执行脚本所在目录

# 判断系统是ubuntu 还是centos //粗略判断
function check_system_type() {
   is_ubuntu=`cat /etc/issue | grep Ubuntu`
    count=${#is_ubuntu}
    if  [ $count -gt 0 ];then
   return 1;
    else
return 0;
  fi
}