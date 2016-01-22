;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-


;;CUA-MODE 矩形块复制粘贴操作,user can use c-v c-x c-c as in window system. http://www.emacswiki.org/emacs/CuaMode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands 矩形操作后不TAB对齐
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy nil) ;; Standard Windows behaviour

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun copy-line (&optional arg)
  "Save current line into Kill-Ring without mark the line"
  (interactive "P")
  (let ((beg (line-beginning-position)) 
        (end (line-end-position arg)))
    (copy-region-as-kill beg end))
  )

(defun copy-word (&optional arg)
  "Copy words at point"
  (interactive "P")
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9_-]" 1) (backward-word 1)) (point))) 
        (end (progn (forward-word arg) (point))))
    (copy-region-as-kill beg end))
  )

(defun lj-copy (&optional arg)
  "LJ Copy"
  (interactive "P")
  (if mark-active
      (kill-ring-save (region-beginning) (region-end))
    (progn 
      (if (looking-at "[a-zA-Z0-9_-]")
          (copy-word)
        (copy-line)
        )
      )
    )
  )


(defun cut-line (&optional arg)
  "Cut current line into Kill-Ring without mark the line"
  (interactive "P")
  (let ((beg (line-beginning-position)) 
        (end (line-end-position arg)))
    (kill-region beg end))
  )

(defun cut-word (&optional arg)
  "Cut words at point"
  (interactive "P")
  (let ((beg (progn (if (looking-back "[a-zA-Z0-9_-]" 1) (backward-word 1)) (point))) 
        (end (progn (forward-word arg) (point))))
    (kill-region beg end))
  )

(defun lj-cut (&optional arg)
  "LJ Cut"
  (interactive "P")
  (if mark-active
      (kill-region (region-beginning) (region-end))
    (progn 
      (if (looking-at "[a-zA-Z0-9_-]")
          (cut-word)
        (cut-line)
        )
      )
    )
  )

