;; Solution 1: disable all vc backends
;; @see http://stackoverflow.com/questions/5748814/how-does-one-disable-vc-git-in-emacs
;; (setq vc-handled-backends ())

;; ;; Solution 2: if NO network mounted drive involved
(setq vc-handled-backends '(Git SVN Hg))

(provide 'init-git)

