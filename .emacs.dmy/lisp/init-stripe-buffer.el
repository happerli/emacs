;; Use different background colors for even and odd lines.
;; https://github.com/sabof/stripe-buffer
(autoload 'turn-on-stripe-buffer-mode "stripe-buffer" "" nil)
(autoload 'turn-on-stripe-table-mode "stripe-buffer" "" nil)
(add-hook 'dired-mode-hook 'turn-on-stripe-buffer-mode)
(add-hook 'org-mode-hook 'turn-on-stripe-table-mode)
(provide 'init-stripe-buffer)