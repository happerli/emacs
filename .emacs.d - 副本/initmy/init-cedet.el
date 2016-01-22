;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(add-to-list 'load-path "~/.emacs.d/elisp/cedet-1.1/common")
(require 'cedet)
(require 'semantic-ia)
 
;; Enable EDE (Project Management) features
(global-ede-mode 1)
 
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
 
;; Enable SRecode (Template management) minor-mode.
;;(global-srecode-minor-mode 1)
