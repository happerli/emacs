#!/bin/bash

function scandir() {
    local cur_dir parent_dir workdir
    workdir=$1
    cd ${workdir}
    if [ ${workdir} = "/" ]
    then
        cur_dir=""
    else
        cur_dir=$(pwd)
    fi

    for dirlist in $(ls ${cur_dir})
    do
        if test -d ${dirlist};then
            cd ${dirlist}
			if is_my_dir ${dirlist};then
                echo "update dir: ${cur_dir}/${dirlist}"
                $ACTION
                sleep 1
                echo "update success  ^_^"
            fi
            scandir ${cur_dir}/${dirlist}
            cd ..
        fi
    done
}


if [ -z  "$1"  ];then
    scandir $PROJECTS_DIR
elif [ -d  "$1" ];then
    scandir $1
else
    echo "not exist \"$PROJECTS_DIR/$1\""
    exit 0;
fi
