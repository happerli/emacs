;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(add-to-list 'load-path (concat (getenv "LJ_EMACS_CONFIG_DIR")
                                "/.emacs.d/elisp/lj-keybindings-base-ergoemacs-5.3.9"))

(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "LJ") ;my key binding.
(load "ergoemacs-mode-lj")

;; turn on minor mode ergoemacs-mode
(ergoemacs-mode 1)
(global-set-key (kbd "M-a") 'anything-execute-extended-command)

;; 	7	8	9
;; M+S	¡ûP	¡ùP	¡úP
;; M	¡ûB	¡ùB	¡úB
;; 	U	I	O
;; M+S	¡ÚW	¡ø	¡ÛW
;; M	¡ûW	¡ü	¡úW
;; 	J	K	L
;; M+S	¡Ú	¨‹	¡Û
;; M	¡û	¡ý	¡ú
;; 	M	,	.
;; M+S	¡Ú|	|?	¡Û|
;; M	|¡û	?|	¡ú|
;; 	SPACE		
;; M	set-mark-command		
