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
;;  The Function keys and keypad: SCO
;;  Initial state of cursor keys: Normal
;;  Initial state of numeric keypad: Normal
;;  Enable extra keyboard features: all disable
;;Terminal->Features:
;;  Disable application keypad mode
;;See (http://the.earth.li/~sgtatham/putty/0.62/htmldoc/Chapter4.html#config-keyboard for more info.
;;This is the only type that recognizes all function keys. 

(if (eq system-uses-terminfo t)
    (progn                              ;; PuTTY hack - needs to be in SCO mode
      (define-key key-translation-map [\e] [\M])
      (define-key input-decode-map "\e[H" [home])
      (define-key input-decode-map "\e[F" [end])
      (define-key input-decode-map "\e[D" [S-left])
      (define-key input-decode-map "\e[C" [S-right])
      (define-key input-decode-map "\e[A" [S-up])
      (define-key input-decode-map "\e[B" [S-down])
      (define-key input-decode-map "\e[C" [S-right])
      (define-key input-decode-map "\e[I" [prior])
      (define-key input-decode-map "\e[G" [next])
      (define-key input-decode-map "\e[M" [f1])
      (define-key input-decode-map "\e[Y" [S-f1])
      (define-key input-decode-map "\e[k" [C-f1])
      (define-key input-decode-map "\e\e[M" [M-f1])
      (define-key input-decode-map "\e[N" [f2])
      (define-key input-decode-map "\e[Z" [S-f2])
      (define-key input-decode-map "\e[l" [C-f2])
      (define-key input-decode-map "\e\e[N" [M-f2])
      (define-key input-decode-map "\e[O" [f3])
      (define-key input-decode-map "\e[a" [S-f3])
      (define-key input-decode-map "\e[m" [C-f3])
      (define-key input-decode-map "\e\e[O" [M-f3])
      (define-key input-decode-map "\e[P" [f4])
      (define-key input-decode-map "\e[b" [S-f4])
      (define-key input-decode-map "\e[n" [C-f4])
      (define-key input-decode-map "\e\e[P" [M-f4])
      (define-key input-decode-map "\e[Q" [f5])
      (define-key input-decode-map "\e[c" [S-f5])
      (define-key input-decode-map "\e[o" [C-f5])
      (define-key input-decode-map "\e\e[Q" [M-f5])
      (define-key input-decode-map "\e[R" [f6])
      (define-key input-decode-map "\e[d" [S-f6])
      (define-key input-decode-map "\e[p" [C-f6])
      (define-key input-decode-map "\e\e[R" [M-f6])
      (define-key input-decode-map "\e[S" [f7])
      (define-key input-decode-map "\e[e" [S-f7])
      (define-key input-decode-map "\e[q" [C-f7])
      (define-key input-decode-map "\e\e[S" [M-f7])
      (define-key input-decode-map "\e[T" [f8])
      (define-key input-decode-map "\e[f" [S-f8])
      (define-key input-decode-map "\e[r" [C-f8])
      (define-key input-decode-map "\e\e[T" [M-f8])
      (define-key input-decode-map "\e[U" [f9])
      (define-key input-decode-map "\e[g" [S-f9])
      (define-key input-decode-map "\e[s" [C-f9])
      (define-key input-decode-map "\e\e[U" [M-f9])
      (define-key input-decode-map "\e[V" [f10])
      (define-key input-decode-map "\e[h" [S-f10])
      (define-key input-decode-map "\e[_" [C-f10])
      (define-key input-decode-map "\e\e[V" [M-f10])
      (define-key input-decode-map "\e[W" [f11])
      (define-key input-decode-map "\e[i" [S-f11])
      (define-key input-decode-map "\e[u" [C-f11])
      (define-key input-decode-map "\e\e[W" [M-f11])
      (define-key input-decode-map "\e[X" [f12])
      (define-key input-decode-map "\e[j" [S-f12])
      (define-key input-decode-map "\e[v" [C-f12])
      (define-key input-decode-map "\e\e[X" [M-f12])))

(provide 'init-key)