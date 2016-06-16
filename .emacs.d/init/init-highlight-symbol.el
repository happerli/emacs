(require 'highlight-symbol)
;; 高亮显示当前buffer中的一个符号
;;Quickly highlight a symbol throughout the buffer and cycle through its locations.
(autoload 'highlight-symbol-at-point "highlight-symbol" "" t)
(highlight-symbol-mode t)
(dolist (hook (list                     ;设置highlight mode
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'javascript-mode-hook
               'web-mode-hook
               'css-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook
               ))
  (add-hook hook '(lambda () (setq highlight-symbol-mode t))))

(global-set-key [f7] 'highlight-symbol-at-point)
(global-set-key [C-f7] 'highlight-symbol-next)
(global-set-key [S-f7] 'highlight-symbol-prev)

(provide 'init-highlight-symbol)
