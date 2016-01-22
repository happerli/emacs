;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (concat (getenv "LJ_EMACS_CONFIG_DIR") "/.emacs.d/ac-dict"))
(ac-config-default)
(require 'auto-complete+)

(define-key ac-completing-map "\n" 'ac-complete)
;;(define-key ac-completing-map "\r" nil)
;; Just ignore case
(setq ac-ignore-case t)
;; Ignore case if completion target string doesn't include upper characters
(setq ac-ignore-case 'smart)

(defun my-ac-emacs-c++-mode ()
  (setq ac-sources '(ac-source-words-in-buffer
;;                     ac-source-c++-keywords
  ;;                   ac-source-c-keywords
                     ac-source-words-in-same-mode-buffers
                     ac-source-gtags
                     ac-source-semantic
                     ac-source-files-in-current-dir 
                     ac-source-filename 
                     ac-source-yasnippet
                     ac-source-abbrev
                     ac-source-dictionary
                     )))

(dolist (hook (list
               'c-mode-hook
               'c++-mode-hook
               ))
  (add-hook hook 'my-ac-emacs-c++-mode))
