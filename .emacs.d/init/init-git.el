;; Solution 1: disable all vc backends
;; @see http://stackoverflow.com/questions/5748814/how-does-one-disable-vc-git-in-emacs
;; (setq vc-handled-backends ())

;; ;; Solution 2: if NO network mounted drive involved
(setq vc-handled-backends '(Git SVN Hg))

;; Sometimes I want check other developer's commit
;; show file of specific version
(autoload 'magit-show "magit" "" t nil)
;; show the commit
(autoload 'magit-show-commit "magit" "" t nil)

(eval-after-load 'magit
  '(progn
     ;; Don't let magit-status mess up window configurations
     ;; http://whattheemacsd.com/setup-magit.el-01.html
     (defadvice magit-status (around magit-fullscreen activate)
       (window-configuration-to-register :magit-fullscreen)
       ad-do-it
       (delete-other-windows))

     (defun magit-quit-session ()
       "Restores the previous window configuration and kills the magit buffer"
       (interactive)
       (kill-buffer)
       (jump-to-register :magit-fullscreen))

     (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)))

(when *is-a-mac*
  (add-hook 'magit-mode-hook (lambda () (local-unset-key [(meta h)]))))


(require 'git-gutter)

; If you enable global minor mode
(global-git-gutter-mode t)

(git-gutter:linum-setup)
;;(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
;;(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
;;(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
;;(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Stage current hunk
;;(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
;;(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

(provide 'init-git)

