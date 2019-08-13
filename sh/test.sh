#!/bin/sh

function error() {
    echo  "\033[31m $1 \033[0m"
}

function success() {
    echo  "\033[32m $1 \033[0m"
}

function info() {
    echo  "\033[37m $1 \033[0m"
}

function warn() {
    echo  "\033[33m $1 \033[0m"
}



