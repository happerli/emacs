(require 'dired-details)
(dired-details-install)

(defun diredext-exec-git-command-in-shell (command &optional arg file-list)
  "Run a shell command `git COMMAND`' on the marked files.
if no files marked, always operate on current line in dired-mode
"
  (interactive
   (let ((files (dired-get-marked-files t current-prefix-arg)))
     (list
      ;; Want to give feedback whether this file or marked files are used:
      (dired-read-shell-command "git command on %s: " current-prefix-arg files)
      current-prefix-arg
      files)))
  (unless (string-match "[*?][ \t]*\\'" command)
    (setq command (concat command " *")))
  (setq command (concat "git " command))
  (dired-do-shell-command command arg file-list)
  (message command))

(eval-after-load 'dired
  '(progn
     ;; {dired-details
     (setq-default dired-details-hidden-string "")
     (define-key dired-mode-map "(" 'dired-details-toggle)
     (define-key dired-mode-map ")" 'dired-details-toggle)
     ;; }
     (define-key dired-mode-map "/" 'diredext-exec-git-command-in-shell)

     (require 'dired+)
     (setq dired-recursive-deletes 'top)
     (define-key dired-mode-map [mouse-2] 'dired-find-file)
     (dolist (file `(((if *unix* "zathura" "open") "pdf" "dvi" "pdf.gz" "ps" "eps")
                     ("unrar x" "rar")
                     ((if *unix* "mplayer -stop-xscreensaver" "mplayer")  "avi" "mpg" "rmvb" "rm" "flv" "wmv" "mkv" "mp4" "m4v" "webm")
                     ("mplayer -playlist" "list" "pls")
                     ((if *unix* "feh" "open") "gif" "jpeg" "jpg" "tif" "png" )
                     ("7z x" "7z")
                     ("djview" "djvu")
                     ("firefox" "xml" "xhtml" "html" "htm" "mht")))
       (add-to-list 'dired-guess-shell-alist-default
                    (list (concat "\\." (regexp-opt (cdr file) t) "$")
                          (car file))))
     ))

;;dired mode
;;dired 可以递归的拷贝和删除目录
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)
(setq dired-listing-switches "-aluh")                  ;传给 ls 的参数
(setq directory-free-space-args "-Pkh")                ;目录空间选项
(setq dired-omit-size-limit nil)                       ;dired忽略的上限
(setq dired-dwim-target t)                             ;Dired试着猜测默认的目标
                                        ;If non-nil, this lets Dired know that
                                        ;you’d like it to guess a default target
                                        ;for commands like copy and move. Say
                                        ;you have your Frame split into two
                                        ;Dired Windows; in this case, Dired will
                                        ;assume that you want to copy/move the
                                        ;file from the one into the other. This
                                        ;is cool stuff.
(setq my-dired-omit-status t)                          ;设置默认忽略文件
(setq my-dired-omit-regexp "^\\.?#\\|^\\..*")          ;设置忽略文件的匹配正则表达式
(setq my-dired-omit-extensions '(".cache"))            ;设置忽略文件的扩展名列表

(provide 'init-dired)
