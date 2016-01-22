;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(require 'auto-install)
(setq auto-install-directory (concat (getenv "LJ_EMACS_CONFIG_DIR") "/.emacs.d/auto-install/"))
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)             ; 互換性確保
