;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(add-to-list 'load-path (concat (getenv "LJ_EMACS_CONFIG_DIR")
                                "/.emacs.d/elisp/lj-keybindings-base-ergoemacs-5.3.9"))

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "LJ") ;my key binding.
(load "ergoemacs-mode-lj")

;; turn on minor mode ergoemacs-mode
(ergoemacs-mode 1)
(global-set-key (kbd "M-a") 'anything-execute-extended-command)

;; 	7	8	9
;; M+S	��P	��P	��P
;; M	��B	��B	��B
;; 	U	I	O
;; M+S	��W	��	��W
;; M	��W	��	��W
;; 	J	K	L
;; M+S	��	��	��
;; M	��	��	��
;; 	M	,	.
;; M+S	��|	|?	��|
;; M	|��	?|	��|
;; 	SPACE		
;; M	set-mark-command		
