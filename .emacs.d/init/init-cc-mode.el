;C/C++ SECTION
  ; @see https://github.com/seanfisk/cmake-flymake
  ; make sure you project use cmake
 ;;;(flymake-mode 1)
 ;;;(if (and buffer-file-name
 ;;;         (not (or (string-match "^/usr/local/include/.*" buffer-file-name)
 ;;;                  (string-match "^/usr/src/linux/include/.*" buffer-file-name))
 ;;;              ))
 ;;;    (cppcm-reload-all))

(defun my-c-mode-hook ()
  (setq c-default-style "linux")
  (setq default-tab-width 4)
  (setq c-basic-offset 4)

  ;syntax-highlight aggressively
  ;(setq font-lock-support-mode 'lazy-lock-mode)
  (setq lazy-lock-defer-contextually t)
  (setq lazy-lock-defer-time 0)

  ;make DEL take all previous whitespace with it
  (c-toggle-hungry-state 1)

  (require 'fic-mode)
  (add-hook 'c++-mode-hook 'turn-on-fic-mode)
  )

;; donot use c-mode-common-hook or cc-mode-hook because many major-modes use this hook
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              ;; indent
              ;; (fix-c-indent-offset-according-to-syntax-context 'substatement 0)
              ;; (fix-c-indent-offset-according-to-syntax-context 'func-decl-cont 0)

              ;; gtags (GNU global) stuff
              (setq gtags-suggested-key-mapping t)
              (if *emacs24* (ggtags-mode 1)))
            (when (derived-mode-p 'c-mode 'c++-mode)
              (my-c-mode-hook))
            ))

;; for modern-c++-font-lock-mode
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)
(add-hook 'c-mode-hook #'modern-c++-font-lock-mode)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(provide 'init-cc-mode)
