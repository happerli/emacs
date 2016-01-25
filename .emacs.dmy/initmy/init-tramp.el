;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;How to use
;;编辑root权限的文件：C-x C-f /su:root@localhost:/ 然后输入root密码，或者C-x C-f /sudo: 输入用户的密码
;;使用ftp，ssh等可以编辑远程文件，具体可以参考：
;;http://blog.donews.com/pluskid/archive/2006/05/06/858306.aspx
;;Tramp和ido的冲突
;;很不幸，这个和ido.el有些冲突，找了比较久也没找到一个解决方法，只好在想使用tramp的时候使用M-x ido-mode暂时关闭ido-mode。打开需要编辑的文件后就可以继续使用ido-mode了。
;;比如打开 /etc/apt/sources.list 
;;C-x C-f /sudo:[root@] 
;;方括号中是提示，直接回车，又提示 [localhost] 再回车，就会在 echo buffer 出现输入密码的 提示，输入了，就可以了，然后找你要的文件 /etc/apt/sources.list 
;;直接编辑，保存就是了。

(require 'tramp)
(setq tramp-default-method "ssh")
;(setq tramp-debug-buffer t) ;; Debug Buffer 
(cond
 ((string-match "linux" system-configuration)
  (nconc  (cadr (assq 'tramp-login-args
         (assoc "ssh" tramp-methods))) '("/bin/zsh" "-i"))
  (setcdr       (assq 'tramp-remote-sh
         (assoc "ssh" tramp-methods))  '("/bin/zsh -i"))
  (setq tramp-completion-without-shell-p t)))
