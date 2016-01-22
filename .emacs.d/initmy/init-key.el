;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;;http://dsec.pku.edu.cn/~jinlong/emacs/emacs.html

(global-set-key (kbd "C-=") 'recent-jump-backward)
(global-set-key (kbd "C--") 'recent-jump-backward)

(global-set-key [f2] 'sr-speedbar-toggle)
(global-set-key [C-f2] [?\C-x ?d])

(define-key key-translation-map [f3] [?\C-s])
(global-set-key [C-f3] [?\C-s ?\C-w])
(define-key key-translation-map [S-f3] [?\C-r])

(global-set-key [f4] 'other-window);; 跳转到Emacs 的另一个buffer窗口
(global-set-key [C-f4] 'delete-window)
(global-set-key [S-f4] 'delete-other-windows)

(global-set-key [f5] 'highlight-symbol-at-point)
(global-set-key [C-f5] 'highlight-symbol-next)
(global-set-key [S-f5] 'highlight-symbol-prev)

(global-set-key [f6] 'cscope-find-global-definition-no-prompting)
(global-set-key [C-f6] 'cscope-find-global-definition)
(global-set-key [S-f6] 'cscope-find-this-text-string)

(global-set-key [f7] 'cscope-find-this-symbol)
(global-set-key [C-f7] 'cscope-next-symbol)
(global-set-key [S-f7] 'cscope-prev-symbol)

(global-set-key [f8] 'cscope-find-called-functions)
(global-set-key [C-f8] 'cscope-find-functions-calling-this-function)
(global-set-key [S-f8] 'cscope-pop-mark)

(global-set-key [f9] 'cscope-find-this-file)
(global-set-key [C-f9] 'cscope-next-file)
(global-set-key [S-f9] 'cscope-prev-file)

(global-set-key [f10] 'hs-toggle-hiding)
(global-set-key [C-f10] 'hs-hide-all)
(global-set-key [S-f10] 'hs-show-all)

(global-set-key [f11] 'cscope-quit)
(global-set-key [C-f11] 'winner-redo)
(global-set-key [S-f11] 'winner-undo)

(global-set-key [f12] 'recent-jump-small-forward)
(global-set-key [C-f12] 'recent-jump-forward)
(global-set-key [f11] 'recent-jump-small-backward)
(global-set-key [C-f11] 'recent-jump-backward)

;; (global-set-key [f12] 'ska-point-to-register)
;; (global-set-key [C-f12] 'ska-jump-to-register)
;; (global-set-key [S-f12] 'goto-last-change)


(global-set-key (kbd "C-?") 'redo)
(global-set-key (kbd "C-\\") 'goto-last-change) ;;设置跳转快捷键
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(global-set-key [(meta ?/)] 'hippie-expand)
(global-set-key (kbd "M-g") 'goto-line);;设置M-g为goto-line
(global-set-key (kbd "C-x k") 'kill-this-buffer);; 按下C-x k立即关闭当前的buffer
;;(global-set-key (kbd "M-n") 'window-move-up)
;;(global-set-key (kbd "M-p") 'window-move-down)
(global-set-key (kbd "C-x N") 'linum-mode)
;;(global-set-key [(f8)] 'open-eshell-other-buffer)
;;(global-set-key [C-f8] 'eshell)
;;目的是开一个shell的小buffer，用于更方便地测试程序也就是运行程序了，我经常会用到
;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell

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
(global-set-key (kbd "C-w") 'lj-cut)
(global-set-key (kbd "M-w") 'lj-copy)
(global-set-key [C-prior] 'swbuff-switch-to-previous-buffer)
(global-set-key [C-next] 'swbuff-switch-to-next-buffer)
(global-set-key (kbd "M-n") 'window-move-up)
(global-set-key (kbd "M-p") 'window-move-down)



