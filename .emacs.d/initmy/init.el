;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

 (when (equal window-system 'w32)
   (setenv "HOME" (getenv "LJ_EMACS_CONFIG_DIR"))
   (setenv "PATH" (getenv "LJ_EMACS_INSTALL_DIR"))
 )

(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d"))
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/init"))
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/elisp"))
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/elisp/ac"))
(add-to-list 'load-path (concat (getenv "HOME") "/.emacs.d/auto-install"))

(load "init-base")
(load "init-ffap")
(load "init-coding")
(load "init-tags")
(load "init-auto-complete")
;;(load "init-color-theme")
(load "init-speedbar")
(load "init-anything");;do not use ido when use anything.
(load "init-term")
;;(load "init-tramp")
;;(load "init-vc");;for svn
;;(load "init-windows")
;;(load "init-auto-install")
;;(load "init-flymake")
(load "init-cua")

;通过 ~/.session 保存/恢复离开Emacs时的全局变量(kill-ring，命令记�?..)，局部变量，寄存器，打开的文件，修改过的文件和最后修改的位置
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

;通过 ~/.emacs.desktop 保存/恢复离开Emacs时的所有Buffer(Emacs自带功能),第一次使用的时�?要运�?M-x
;desktop-save 命令
(load "desktop") 
(require 'desktop)
(setq desktop-save t)
(setq desktop-load-locked-desktop t)
(setq *desktop-dir* (list (expand-file-name "~/.emacs/local")))
(setq desktop-path '("~/.emacs/local"))
(setq desktop-dirname "~/.emacs/local")
(setq desktop-base-file-name ".emacs-desktop")
(desktop-save-mode 1)
(desktop-read)

(load "init-key")
;;(load "init-ergo")
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
;;  '(custom-enabled-themes (quote (deeper-blue)))
;;  '(session-use-package t nil (session)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

(require 'command-frequence)
