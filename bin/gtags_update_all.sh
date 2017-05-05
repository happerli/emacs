#!/bin/bash

PROJECTS_DIR=/home/tonyli/workspace
ACTION=gtags

##排除以下情况：
##1.非目录
##2.非my目录

function is_my_dir(){
    param=`find $PWD -maxdepth 1 -name ".projectile"`
    if [ -z "$param" ];then
        return 1 #1为假
    else
        return 0 #0为真
    fi
}

source recur_dir.sh
exit 0;
