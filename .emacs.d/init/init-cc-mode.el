;;;C/C++ SECTION
(require 'cc-mode)

;; for modern-c++-font-lock-mode
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
(add-hook 'c-mode-hook #'modern-c++-font-lock-mode)

;;Create MyCppStyle
(defconst MyCppStyle
  '((c-tab-always-indent . t)
    (c-offsets-alist . ((substatement-open . 0)
                        (innamespace . 0)
                        (inline-open . 0)
                        (case-label  . +)
                        (block-open  . 0)))
    ;;(c-echo-syntactic-information-p t)
    ;;(setq indent-tabs-mode nil)
    )
  "My Cpp Coding Style")
(c-add-style "MyCppStyle" MyCppStyle)

;;Define own hook
(defun MyCppHook ()
  (setq c-style-variables-are-local-p nil)
  (require 'google-c-style)
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
  (setq c-default-style "google")
  (c-set-style "MyCppStyle")

  (setq indent-tabs-mode nil)
  (setq default-tab-width 4)
  (setq c-basic-offset 4)
  (setq c-tab-always-indent t)
  (setq c++-tab-always-indent t)

  (setq lazy-lock-defer-contextually t)
  (setq lazy-lock-defer-time 0)

  ;;;make DEL take all previous whitespace with it
  (c-toggle-hungry-state 1)

  (require 'fic-mode)
  (add-hook 'c++-mode-hook 'turn-on-fic-mode)
  )
(add-hook 'c++-mode-hook 'MyCppHook)
(add-hook 'c-mode-hook 'MyCppHook)

;;set *.h and *.c and *.cpp files use c++ mode
(setq auto-mode-alist
      (cons '("\\.h$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.c$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.cpp$" . c++-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.cc$" . c++-mode) auto-mode-alist))

;;-----------------------------------------------
;; zap tabs
;;
(defun buffer-untabify ()
  "Untabify an entire buffer"
  (interactive)
  (untabify (point-min) (point-max)))

;;
;; re-indent buffer
;;
(defun buffer-indent()
  "Reindent an entire buffer"
  (interactive)
  (indent-region (point-min) (point-max) nil))

;;
;; Untabify, re-indent, make EOL be '\n' not '\r\n'
;;   and delete trailing whitespace
;;
(defun buffer-cleanup()
  "Untabify and re-indent an entire buffer"
  (interactive)
  (buffer-untabify)
  (buffer-indent)
  (delete-trailing-whitespace))

(defun cpp-astyle()
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning)
              end (region-end))
      (setq beg (point-min)
            end (point-max)))
    (shell-command-on-region beg end "astyle -s4 -S -A3 -H -U -p -k3" nil t)))

(provide 'init-cc-mode)
