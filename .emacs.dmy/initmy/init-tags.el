;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;(require 'ascope)
(require 'xcscope)

;; install cscope
;; $ ./configure
;; $ make
;; $ sudo make install
;; $ cscope --version
;; (make install 时要用sudo权限，安装到/usr/local)
;; 安装过程出现的问题：
;; 1.出现`flex' is missing on your system.
;; $ sudo apt-get install flex
;; 2.出现yacc: 未找到命令
;; $ sudo apt-get install byacc
;; 3.出现“curses.h not found”之类的错误
;; $ sudo apt-get libncurses-dev

;; configure
;; 在源码根目录下，如~/kernerl/linux-2.6.29.3,利用cscope-indexer脚本生成文件列表和数据库，方法是执行
;; cscope-indexer -r
;; -r参数表示递归检索子目录，文件列表和数据库的默认文件名分别为cscope.files和cscope.out，
;; 可以使用-i,-f参数进行修改，请参考man了 解脚本参数用法。
;; Cscope默认在每次进行查找时更新cscope.out。 当工程十分庞大时，建议关闭该选项以提高查找速度。
(setq cscope-do-not-update-database t)
;; Cscope可以通过创建反向索引加速查找，方法是调用Cscope时，使用-q参数。修改cscope-indexer脚 本，将
;; cscope -b -i $LIST_FILE -f $DATABASE_FILE
;; 替换为
;; cscope -q -b -i $LIST_FILE -f $DATABASE_FILE


