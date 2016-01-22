;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(ffap-bindings)

(defun ffap-settings ()
  "Settings for `ffap'."
  (setq ffap-c-path (append ffap-c-path system-head-file-dir user-head-file-dir)))

(eval-after-load "ffap"
  `(ffap-settings))

(provide 'ffap-settings)
