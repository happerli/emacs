;; @see http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
;; But I need global-mode-string,
;; @see http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_360.html
;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
  (list
    ;; the buffer name; the file name as a tool tip
    '(:eval (propertize "%b " 'face nil
        'help-echo (buffer-file-name)))

		"" 'which-func-format
    
    ;; line and column
    "(" ;; '%02' to set to 2 chars at least; prevents flickering
    "L:%02l" "," "C:%01c" "," "%p"
      ;; (propertize "%02l" 'face 'font-lock-type-face) ","
      ;; (propertize "%02c" 'face 'font-lock-type-face)
    ") "

    ;; the current major mode for the buffer.
    "["

    '(:eval (propertize "%m" 'face nil
              'help-echo buffer-file-coding-system))
    " "


    ;; insert vs overwrite mode, input-method in a tooltip
    '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
              'face nil
              'help-echo (concat "Buffer is in "
                           (if overwrite-mode "overwrite" "insert") " mode")))

    ;; was this buffer modified since the last save?
    '(:eval (when (buffer-modified-p)
              (concat ","  (propertize "Mod"
                             'face nil
                             'help-echo "Buffer has been modified"))))

    ;; is this buffer read-only?
    '(:eval (when buffer-read-only
              (concat ","  (propertize "RO"
                             'face nil
                             'help-echo "Buffer is read-only"))))
    "] "

    ;;global-mode-string, org-timer-set-timer in org-mode need this
    (propertize "%M" 'face nil)

    " --"
    ;; i don't want to see minor-modes; but if you want, uncomment this:
    ;; minor-mode-alist  ;; list of minor modes
    "%-" ;; fill with '-'
    ))

(which-function-mode 1)	
(setq column-number-mode t)
(setq line-number-mode t)
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-interval 10);;时间的变化频率
(setq display-time-string-forms
      '(month "/" day "(" dayname ")" 24-hours ":" minutes))
(display-time)

(provide 'init-modeline)

