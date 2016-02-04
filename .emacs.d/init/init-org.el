;; -*- coding: utf-8 -*-
(require 'org)
;;(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
;;(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(setq org-startup-indented t)
(setq org-log-done t)

;;Changing a task state is done with C-c C-t KEY,
;;where KEY is the appropriate fast todo state selection key as defined in org-todo-keywords.
(setq org-use-fast-todo-selection t)

;;allows changing todo states with S-left and S-right skipping all of 
;;the normal processing when entering or leaving a todo state. 
;;This cycles through the todo states but skips setting timestamps and
;; entering notes which is very convenient when all you want to
;; do is fix up the status of an entry.
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-agenda-files (quote ("~/org/gtd")))
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))


;;The triggers break down to the following rules:
;; -Moving a task to CANCELLED adds a CANCELLED tag
;; -Moving a task to WAITING adds a WAITING tag
;; -Moving a task to HOLD adds WAITING and HOLD tags
;; -Moving a task to a done state removes WAITING and HOLD tags
;; -Moving a task to TODO removes WAITING, CANCELLED, and HOLD tags
;; -Moving a task to NEXT removes WAITING, CANCELLED, and HOLD tags
;; -Moving a task to DONE removes WAITING, CANCELLED, and HOLD tags
;;The tags are used to filter tasks in the agenda views conveniently.
(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("MEETING" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold))))
			  
(defun bh/hide-other ()
  (interactive)
  (save-excursion
    (org-back-to-heading 'invisible-ok)
    (hide-other)
    (org-cycle)
    (org-cycle)
    (org-cycle)))

(defun bh/set-truncate-lines ()
  "Toggle value of truncate-lines and refresh window display."
  (interactive)
  (setq truncate-lines (not truncate-lines))
  ;; now refresh window display (an idiom from simple.el):
  (save-excursion
    (set-window-start (selected-window)
                      (window-start (selected-window)))))

(defun bh/make-org-scratch ()
  (interactive)
  (find-file "/tmp/publish/scratch.org")
  (gnus-make-directory "/tmp/publish"))

(defun bh/switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))
  
(provide 'init-org)

