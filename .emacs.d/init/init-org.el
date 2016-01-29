;; -*- coding: utf-8 -*-
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(setq org-startup-indented t)
(setq org-log-done t)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;(eval-after-load 'org
;;   '(progn
;;      (require 'org-clock)
;;      ; @see http://irreal.org/blog/?p=671
;;      (setq org-src-fontify-natively t)
;;      ;; (require 'org-fstree)
;;      (defun soft-wrap-lines ()
;;        "Make lines wrap at window edge and on word boundary,
;;        in current buffer."
;;        (interactive)
;;        ;; display wrapped lines instead of truncated lines
;;        (setq truncate-lines nil)
;;        (setq word-wrap t))
;;      (add-hook 'org-mode-hook '(lambda ()
;;                                  (setq evil-auto-indent nil)
;;                                  (soft-wrap-lines)
;;                                  ))))


(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "SOMEDAY(S)" "PROJECT(P@)" "|" "CANCELLED(c@/!)"))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org clock
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Change task state to STARTED when clocking in
(setq org-clock-in-switch-to-state "STARTED")
;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show the clocked-in task - if any - in the header line
(defun sanityinc/show-org-clock-in-header-line ()
  (setq-default header-line-format '((" " org-mode-line-string " "))))

(defun sanityinc/hide-org-clock-from-header-line ()
  (setq-default header-line-format nil))

(add-hook 'org-clock-in-hook 'sanityinc/show-org-clock-in-header-line)
(add-hook 'org-clock-out-hook 'sanityinc/hide-org-clock-from-header-line)
(add-hook 'org-clock-cancel-hook 'sanityinc/hide-org-clock-from-header-line)

(eval-after-load 'org-clock
  '(progn
     (define-key org-clock-mode-line-map [header-line mouse-2] 'org-clock-goto)
     (define-key org-clock-mode-line-map [header-line mouse-1] 'org-clock-menu)))

(eval-after-load 'org
   '(progn
      (require 'org-clock)
      ; @see http://irreal.org/blog/?p=671
      (setq org-src-fontify-natively t)
      ;; (require 'org-fstree)
      (defun soft-wrap-lines ()
        "Make lines wrap at window edge and on word boundary,
        in current buffer."
        (interactive)
        ;; display wrapped lines instead of truncated lines
        (setq truncate-lines nil)
        (setq word-wrap t))
      (add-hook 'org-mode-hook '(lambda ()
                                  (setq evil-auto-indent nil)
                                  (soft-wrap-lines)
                                  ))))

(defadvice org-open-at-point (around org-open-at-point-choose-browser activate)
  (let ((browse-url-browser-function
         (cond ((equal (ad-get-arg 0) '(4))
                'browse-url-generic)
               ((equal (ad-get-arg 0) '(16))
                'choose-browser)
               (t
                (lambda (url &optional new)
                  (w3m-browse-url url t))))))
    ad-do-it))
	
(provide 'init-org)

