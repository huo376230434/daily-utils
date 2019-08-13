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