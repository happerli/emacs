;; -*- coding: utf-8 -*-

(setq emacs-load-start-time (current-time))

(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))) )
(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)
                   ))

(require 'init-modeline)
(require 'cl-lib)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'idle-require)
(require 'init-elpa)
(require 'init-exec-path) ;; Set up $PATH

;;change default layout of ediff
(setq ediff-split-window-function (quote split-window-horizontally))
(prefer-coding-system 'utf-8)
(require 'init-git)
(require 'init-window-buffer)
(require 'init-highlight-symbol)
(require 'init-linum-mode)
(require 'init-misc)
(require 'init-projectile)
(require 'init-theme)
(require 'init-stripe-buffer)
(require 'init-sessions)
(require 'init-recentf)
(require 'init-gtags)
(require 'init-vlf)
(require 'init-ibuffer)
(require 'init-company)
(require 'init-org)
(require 'init-cc-mode)
(require 'init-ace-jump-mode)
(require 'init-helm)
(require 'init-ignored)

(server-start) 

(provide 'init)
