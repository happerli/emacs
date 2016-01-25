(autoload 'sr-speedbar-toggle "sr-speedbar")

;; sr-speedbar config
(setq sr-speedbar-skip-other-window-p t)

(setq sr-speedbar-width-console 30)
(setq sr-speedbar-width-x 30)


;; regular speedbar config
(setq speedbar-verbosity-level 0)

(defun speedbar-edit-line-and-switch-to-window ()
  (interactive)
  (speedbar-edit-line)
  (other-window 1))

(setq sr-speedbar-auto-refresh t)
(setq speedbar-show-unknown-files t)  
(setq sr-speedbar-width 50)  
(setq speedbar-use-images nil)  
(setq sr-speedbar-right-side nil)  

(provide 'init-sr-speedbar)
