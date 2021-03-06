(require 'flymake)

(add-hook 'c-mode-common-hook
'(lambda ()
(flymake-mode t)
))

(defun flymake-display-err-minibuf ()
"Displays the error/warning for the current line in the minibuffer"
(interactive)
(let* ((line-no (flymake-current-line-no))
(line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
(count (length line-err-info-list))
)
(while (> count 0)
(when line-err-info-list
(let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
(full-file (flymake-ler-full-file (nth (1- count) line-err-info-list)))
(text (flymake-ler-text (nth (1- count) line-err-info-list)))
(line (flymake-ler-line (nth (1- count) line-err-info-list))))
(message "%s %s" line text)
)
)
(setq count (1- count)))))
(setq ac-auto-show-menu 0.1)

(add-hook 'c-mode-common-hook
'(lambda ()
(define-key c-mode-base-map "\C-c\C-d" 'flymake-display-err-minibuf)
))
