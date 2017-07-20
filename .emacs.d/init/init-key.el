;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;in search mode, show finding content of current buffer in occur buffer: M-o
;;in search mode, show finding content of all buffer in occur buffer: M-O
;;to exit occur buffer: q
;; 下面只是将快捷键 C-x C-b 映射为调出ibuffer的命令
;; n和p是上下，m是选中该文件，可选多个，D是kill buffer
;; 回车或者按e(就是edit)来编辑文件
;; 在ibuffer页面，用英文斜线来通过关键字过滤缩小显示文件范围
;; 比如 ᾿/n日记 ᾿，就会只显示buffer名称中有日记这两个字的文件了
;; 撤销过滤按两下，就是按 ᾿// ᾿
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;按Ctrl-Alt-\ 对这块代码重新进行格式化

;;PuTTY
;;Terminal->Keyboard:
;;  The Backspace key: Control-? (127)
;;  The Home and End keys: Standard
;;  The Function keys and keypad: Xterm R6
;;  Initial state of cursor keys: Normal
;;  Initial state of numeric keypad: Normal
;;  Enable extra keyboard features: all disable
;;      control-alt is different from altgr: enable
;;Terminal->Features:
;;  Disable application keypad mode: false
;;select region(for can't use shift key in putty)
(global-set-key (kbd "C-@") 'set-mark-command)

;; 逗号后插入空格
(global-set-key (kbd ",")
                '(lambda ()
                    (interactive)
                    (insert ", ")))

(provide 'init-key)
