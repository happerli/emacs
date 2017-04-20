;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------
(setq-default
 blink-cursor-delay 0.5
 blink-cursor-interval 0.4
 bookmark-default-file "~/.emacs.d/.bookmarks.el"
 buffers-menu-max-size 30
 case-fold-search t
 compilation-scroll-output t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 grep-highlight-matches t
 grep-scroll-output t
 line-spacing 0.2
 ;; 当光标在行尾上下移动的时候，始终保持在行尾
 track-eol t
 ;;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把我的文档搞的一团糟。
;;我觉得先用光标定位，然后鼠标中键点击要好的多。不管你的光标在文档的那个位置，或
;;是在minibuffer，鼠标中键一点击，X selection 的内容就被插入到那个位置
 mouse-yank-at-point t
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil
 ;;用一个很大的kill ring. 这样防止我不小心删掉重要的东西
 kill-ring-max 1024
 ;;设置最大的全局标记容量
 global-mark-ring-max 1024
 ;;删除minibuffer的重复历史
history-delete-duplicates t
;;fill-column 设为 80. 这样的文字更好读
default-fill-column 80
delete-selection-mode 1
 ;; no annoying beep on errors
visible-bell t
transient-mark-mode t
)

(show-paren-mode t);; highlight paren
(setq show-paren-style 'parenthesis)

(global-auto-revert-mode)
(setq global-auto-revert-non-file-buffers t
      auto-revert-verbose nil)

;; @see http://www.quora.com/Whats-the-best-way-to-edit-remote-files-from-Emacs
(setq tramp-default-method "ssh")
(setq tramp-auto-save-directory "~/.backups/tramp/")
(setq tramp-chunksize 8192)

;; But don't show trailing whitespace in SQLi, inf-ruby etc.
(add-hook 'comint-mode-hook
          (lambda () (setq show-trailing-whitespace nil)))


(define-key global-map (kbd "RET") 'newline-and-indent)

(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode" "Major mode for comma-separated value files." t)


;;----------------------------------------------------------------------------
;; Don't disable narrowing commands
;;----------------------------------------------------------------------------
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)


;;----------------------------------------------------------------------------
;; Handy key bindings
;;----------------------------------------------------------------------------
;; To be able to M-x without meta
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)

(defun suspend-mode-during-cua-rect-selection (mode-name)
  "Add an advice to suspend `MODE-NAME' while selecting a CUA rectangle."
  (let ((flagvar (intern (format "%s-was-active-before-cua-rectangle" mode-name)))
        (advice-name (intern (format "suspend-%s" mode-name))))
    (eval-after-load 'cua-rect
      `(progn
         (defvar ,flagvar nil)
         (make-variable-buffer-local ',flagvar)
         (defadvice cua--activate-rectangle (after ,advice-name activate)
           (setq ,flagvar (and (boundp ',mode-name) ,mode-name))
           (when ,flagvar
             (,mode-name 0)))
         (defadvice cua--deactivate-rectangle (after ,advice-name activate)
           (when ,flagvar
             (,mode-name 1)))))))

;;----------------------------------------------------------------------------
;; Random line sorting
;;----------------------------------------------------------------------------
(defun sort-lines-random (beg end)
  "Sort lines in region randomly."
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr nil 'forward-line 'end-of-line nil nil
                   (lambda (s1 s2) (eq (random 2) 0)))))))


(add-hook 'prog-mode-hook
          '(lambda ()
             ;; enable for all programming modes
             ;; http://emacsredux.com/blog/2013/04/21/camelcase-aware-editing/
             (subword-mode)
             (if *emacs24* (electric-pair-mode 1))
             ;; eldoc, show API doc in minibuffer echo area
             (turn-on-eldoc-mode)
             ;; show trailing spaces in a programming mod
             (setq show-trailing-whitespace t)))

;; turns on auto-fill-mode, don't use text-mode-hook because for some
;; mode (org-mode for example), this will make the exported document
;; ugly!
;; (add-hook 'markdown-mode-hook 'turn-on-auto-fill)
(add-hook 'change-log-mode-hook 'turn-on-auto-fill)
(add-hook 'cc-mode-hook 'turn-on-auto-fill)
(global-set-key (kbd "C-c q") 'auto-fill-mode)

;; {{ whitespace
;; (require 'whitespace)
;; (setq whitespace-style '(face empty tabs lines-tail trailing))
;; (global-whitespace-mode t)
;; }}

;; some project prefer tab, so be it
;; @see http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode
(setq-default tab-width 4)
(defun toggle-indent-tab ()
  (interactive)
  (if indent-tabs-mode
      (progn
        (setq indent-tabs-mode nil))
    (progn
        (setq indent-tabs-mode t)
        (setq indent-line-function 'insert-tab)
      )))
      
;;; ### Indent ###
;;; --- 缩进设置
(setq-default indent-tabs-mode t)       ;默认不用空格替代TAB
(setq default-tab-width 4)              ;设置TAB默认的宽度
(dolist (hook (list                     ;设置用空格替代TAB的模式
               'emacs-lisp-mode-hook
               'lisp-mode-hook
               'lisp-interaction-mode-hook
               'scheme-mode-hook
               'c-mode-hook
               'c++-mode-hook
               'java-mode-hook
               'haskell-mode-hook
               'asm-mode-hook
               'emms-tag-editor-mode-hook
               'sh-mode-hook
               ))
  (add-hook hook '(lambda () (setq indent-tabs-mode nil))))
;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑Makefile 的时候也不用担心，
;;因为makefile-mode 会把 TAB 键设置成真正TAB 字符，并且加亮显示的
;;----------------------------------------------------------------------------
;; Misc config - yet to be placed in separate files
;;----------------------------------------------------------------------------
;; {{ shell and conf
(add-to-list 'auto-mode-alist '("\\.[a-zA-Z]+rc$" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.aspell\\.en\\.pws\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.meta\\'" . conf-mode))
(add-to-list 'auto-mode-alist '("\\.ctags\\'" . conf-mode))
;; }}

;; java
(add-to-list 'auto-mode-alist '("\\.aj\\'" . java-mode))

;; makefile
(add-to-list 'auto-mode-alist '("\\.ninja$" . makefile-gmake-mode))

;; midnight mode purges buffers which haven't been displayed in 3 days
(require 'midnight)
(setq midnight-mode t)

(add-auto-mode 'tcl-mode "Portfile\\'")
(fset 'yes-or-no-p 'y-or-n-p);; 改变 Emacs 固执的要你回答yes 的行为。按 y 或空格键表示 yes，n 表示 no

(column-number-mode 1)

;; NO automatic new line when scrolling down at buffer bottom
;; NO add new line while move cusor to buffer end.
(setq next-line-add-newlines nil)

;; @see http://stackoverflow.com/questions/4222183/emacs-how-to-jump-to-function-definition-in-el-file
(global-set-key (kbd "C-h C-f") 'find-function)

;Ctrl-X, u/l  to upper/lowercase regions without confirm
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Write backup files to own directory
(if (not (file-exists-p (expand-file-name "~/.backups")))
    (make-directory (expand-file-name "~/.backups"))
    )
(setq
  backup-by-coping t ; don't clobber symlinks
  backup-directory-alist '(("." . "~/.backups"))
  delete-old-versions t
  ;;删掉不属于以上版本的版本
  kept-new-versions 6
  ;;备份最新的版本10次，理解同上
  kept-old-versions 2
  ;;备份最原始的两次及第一次编辑前的文档和第二次编辑前的
  version-control t  
  ;;use versioned backups
  )
(setq make-backup-files t);; 设定产生备份文件

;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Don't disable narrowing commands
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-defun 'disabled nil)

; from RobinH
;Time management
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

(when *win32*
  ;; resize frame
  (defun w32-maximize-frame ()
    "Maximize the current frame."
    (interactive)
    (w32-send-sys-command 61488)
    (global-set-key (kbd "C-c z") 'w32-restore-frame))

  (global-set-key (kbd "C-c z") 'w32-maximize-frame)

  (defun w32-restore-frame ()
    "Restore a minimized frame."
    (interactive)
    (w32-send-sys-command 61728)
    (global-set-key (kbd "C-c z") 'w32-maximize-frame))

  )

;; M-x ct ENTER
(defun ct (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f %s/TAGS -e -R %s" dir-name (directory-file-name dir-name)))
  )

; @see http://xahlee.blogspot.com/2012/01/emacs-tip-hotkey-for-repeat-complex.html
;;(global-set-key [f2] 'repeat-complex-command)

;effective emacs item 3
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\M-s" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'tags-search)
(global-set-key "\C-x\C-n" 'find-file-other-frame) ;open new frame with a file

;;a no-op function to bind to if you want to set a keystroke to null
(defun void () "this is a no-op" (interactive))

;convert a buffer from dos ^M end of lines to unix end of lines
(defun dos2unix ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;vice versa
(defun unix2dos ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

;show ascii table
(defun ascii-table ()
  "Print the ascii table. Based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
           (setq i (+ i 1))
           (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))


;; I'm in Australia now, so I set the locale to "en_AU"
(defun insert-date (prefix)
    "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
    (interactive "P")
    (let ((format (cond
                   ((not prefix) "%d.%m.%Y")
                   ((equal prefix '(4)) "%Y-%m-%d")
                   ((equal prefix '(16)) "%d %B %Y")))
          )
      (insert (format-time-string format))))

(defun insert-blog-version ()
  "insert version of my blog post"
  (interactive)
  (insert (format-time-string "%Y%m%d"))
  )

;;compute the length of the marked region
(defun region-length ()
  "length of a region"
  (interactive)
  (message (format "%d" (- (region-end) (region-beginning)))))

(defalias 'list-buffers 'ibuffer)
;KEYBOARD SECTION
;global keyb maps
(global-set-key "\C-xc" 'clipboard-kill-ring-save)
(global-set-key "\C-cc" 'copy-region-as-kill)

;; @see http://www.emacswiki.org/emacs/BetterRegisters
;; This is used in the function below to make marked points visible
(defface register-marker-face '((t (:background "grey")))
      "Used to mark register positions in a buffer."
      :group 'faces)

;effective emacs item 7; no scrollbar, no menubar, no toolbar
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
;; effective emacs item 9
(defalias 'qrr 'query-replace-regexp)

(setq-default regex-tool-backend 'perl)

;; {{ work around color theme bug
;; @see https://plus.google.com/106672400078851000780/posts/KhTgscKE8PM
(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(defadvice load-theme (before disable-themes-first activate)
  (disable-all-themes))
;; }}

;;; {{ clipboard stuff
;; Use the system clipboard;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; you need install xsel under Linux
;; xclip has some problem when copying under Linux
(defun copy-yank-str (msg &optional clipboard-only)
  (unless clipboard-only (kill-new msg))
  (cond
   ;; display-graphic-p need windows 23.3.1
   ((and (display-graphic-p) x-select-enable-clipboard)
    (x-set-selection 'CLIPBOARD msg))
   (t (with-temp-buffer
        (insert msg)
        (shell-command-on-region (point-min) (point-max)
                                 (cond
                                  ((eq system-type 'cygwin) "putclip")
                                  ((eq system-type 'darwin) "pbcopy")
                                  (t "xsel -ib")
                                  )))
    )))

(defun cp-filename-of-current-buffer ()
  "copy file name (NOT full path) into the yank ring and OS clipboard"
  (interactive)
  (let ((filename))
    (when buffer-file-name
      (setq filename (file-name-nondirectory buffer-file-name))
      (copy-yank-str filename)
      (message "filename %s => clipboard & yank ring" filename)
      )))

(defun cp-fullpath-of-current-buffer ()
  "copy full path into the yank ring and OS clipboard"
  (interactive)
  (when buffer-file-name
    (copy-yank-str (file-truename buffer-file-name))
    (message "full path of current buffer => clipboard & yank ring")
    ))

;; {{ git-messenger
(autoload 'git-messenger:popup-message "git-messenger" "" t)
;; show details to play `git blame' game
(setq git-messenger:show-detail t)
(add-hook 'git-messenger:after-popup-hook (lambda (msg)
                                            ;; extract commit id and put into the kill ring
                                            (when (string-match "\\(commit *: *\\)\\([0-9a-z]+\\)" msg)
                                              (kill-new (match-string 2 msg)))
                                            (copy-yank-str msg)
                                            (message "commit details > clipboard & kill-ring")))
(global-set-key (kbd "C-x v p") 'git-messenger:popup-message)
;; }}

(defun copy-to-x-clipboard ()
  (interactive)
  (if (region-active-p)
      (progn
        (cond
         ((and (display-graphic-p) x-select-enable-clipboard)
          (x-set-selection 'CLIPBOARD (buffer-substring (region-beginning) (region-end))))
         (t (shell-command-on-region (region-beginning) (region-end)
                                     (cond
                                      (*cygwin* "putclip")
                                      (*is-a-mac* "pbcopy")
                                      (*linux* "xsel -ib")))
            ))
        (message "Yanked region to clipboard!")
        (deactivate-mark))
        (message "No region active; can't yank to clipboard!")))

(defun paste-from-x-clipboard()
  (interactive)
  (cond
   ((and (display-graphic-p) x-select-enable-clipboard)
    (insert (x-selection 'CLIPBOARD)))
   (t (shell-command
       (cond
        (*cygwin* "getclip")
        (*is-a-mac* "pbpaste")
        (t "xsel -ob"))
       1))
   ))

(defun my/paste-in-minibuffer ()
  (local-set-key (kbd "M-y") 'paste-from-x-clipboard)
  )

(add-hook 'minibuffer-setup-hook 'my/paste-in-minibuffer)
;;; }}

;;(eval-after-load 'speedbar '(if (load "mwheel" t)
;;                               ;; Enable wheelmouse support by default
;;                               (cond (window-system
;;                                       (mwheel-install)))))


; @see http://www.emacswiki.org/emacs/SavePlace
(require 'saveplace)
(setq-default save-place t)

;; {{expand-region.el
;; if emacs-nox, use C-@, else, use C-2;
(if window-system
 (progn
   (define-key global-map (kbd "C-2") 'er/expand-region)
   (define-key global-map (kbd "C-M-2") 'er/contract-region)
   )
 (progn
   (define-key global-map (kbd "C-@") 'er/expand-region)
   (define-key global-map (kbd "C-M-@") 'er/contract-region)
 )
)
;; }}

;;iedit-mode
(global-set-key (kbd "C-c ; i") 'iedit-mode-toggle-on-function)

;;align text
(global-set-key (kbd "C-c C-l") 'align-regexp)

;; my screen is tiny, so I use minimum eshell prompt
(setq eshell-prompt-function
       (lambda ()
         (concat (getenv "USER") " $ ")))

;; max frame, @see https://github.com/rmm5t/maxframe.el
;;(require 'maxframe)

;; command-frequency
;; (require 'command-frequency)
;; (command-frequency-table-load)
;; (command-frequency-mode 1)
;; (command-frequency-autosave-mode 1)

(defun toggle-env-http-proxy ()
  "set/unset the environment variable http_proxy which w3m uses"
  (interactive)
  (let ((proxy "http://127.0.0.1:8000"))
    (if (string= (getenv "http_proxy") proxy)
        ;; clear the the proxy
        (progn
          (setenv "http_proxy" "")
          (message "env http_proxy is empty now")
          )
      ;; set the proxy
      (setenv "http_proxy" proxy)
      (message "env http_proxy is %s now" proxy)
        )
    ))

(defun strip-convert-lines-into-one-big-string (beg end)
"strip and convert selected lines into one big string which is copied into kill ring.
When transient-mark-mode is enabled, if no region is active then only the
current line is acted upon.

If the region begins or ends in the middle of a line, that entire line is
copied, even if the region is narrowed to the middle of a line.

Current position is preserved."
  (interactive "r")
  (let (str (orig-pos (point-marker)))
  (save-restriction
    (widen)
    (when (and transient-mark-mode (not (use-region-p)))
      (setq beg (line-beginning-position)
            end (line-beginning-position 2)))

    (goto-char beg)
    (setq beg (line-beginning-position))
    (goto-char end)
    (unless (= (point) (line-beginning-position))
      (setq end (line-beginning-position 2)))

    (goto-char beg)
    (setq str (replace-regexp-in-string "[ \t]*\n" "" (replace-regexp-in-string "^[ \t]+" "" (buffer-substring-no-properties beg end))))
    ;; (message "str=%s" str)
    (kill-new str)
    (goto-char orig-pos)))
  )

;; { smarter navigation to the beginning of a line
;; http://emacsredux.com/blog/2013/05/22/smarter-navigation-to-the-beginning-of-a-line/
(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)
;; }

(defun open-readme-in-git-root-directory ()
  (interactive)
  (let (filename
        (root-dir (locate-dominating-file (file-name-as-directory (file-name-directory buffer-file-name)) ".git"))
        )
    ;; (message "root-dir=%s" root-dir)
    (and root-dir (file-name-as-directory root-dir))
    (setq filename (concat root-dir "README.org"))
    (if (not (file-exists-p filename))
        (setq filename (concat root-dir "README.md"))
      )
    ;; (message "filename=%s" filename)
    (if (file-exists-p filename)
        (switch-to-buffer (find-file-noselect filename nil nil))
      (message "NO README.org or README.md found!"))
    ))
(global-set-key (kbd "C-c C-q") 'open-readme-in-git-root-directory)

;; from http://emacsredux.com/blog/2013/05/04/rename-file-and-buffer/
(defun vc-rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)))))))

(defun vc-copy-file-and-rename-buffer ()
"copy the current buffer and file it is visiting.
if the old file is under version control, the new file is added into
version control automatically"
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (copy-file filename new-name t)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)
        (when (vc-backend filename)
          (vc-register)
         )))))

;; @see http://wenshanren.org/?p=298
(defun wenshan-edit-current-file-as-root ()
  "Edit the file that is associated with the current buffer as root"
  (interactive)
  (if (buffer-file-name)
      (progn
        (setq file (concat "/sudo:root@localhost:" (buffer-file-name)))
        (find-file file))
    (message "Current buffer does not have an associated file.")))

;; {{ eval and replace anywhere
;; @see http://emacs.wordpress.com/2007/01/17/eval-and-replace-anywhere/ 
(defun fc-eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-c e") 'fc-eval-and-replace)

(defun calc-eval-and-insert (&optional start end)
(interactive "r")
(let ((result (calc-eval (buffer-substring-no-properties start end))))
(goto-char (point-at-eol))
(insert " = " result)))

(defun calc-eval-line-and-insert ()
(interactive)
(calc-eval-and-insert (point-at-bol) (point-at-eol)))
(global-set-key (kbd "C-c C-e") 'calc-eval-line-and-insert)
;; }}

;; input open source license
(autoload 'legalese "legalese" "" t)

;; {{ buf-move
(autoload 'buf-move-left "buffer-move" "move buffer" t)
(autoload 'buf-move-right "buffer-move" "move buffer" t)
(autoload 'buf-move-up "buffer-move" "move buffer" t)
(autoload 'buf-move-down "buffer-move" "move buffer" t)
;; }}

;; edit confluence wiki
(autoload 'confluence-edit-mode "confluence-edit" "enable confluence-edit-mode" t)
(add-to-list 'auto-mode-alist '("\\.wiki\\'" . confluence-edit-mode))

;; {{string-edit.el
(autoload 'string-edit-at-point "string-edit" "enable string-edit-mode" t)
;; }}

;; {{ issue-tracker
(global-set-key (kbd "C-c C-t") 'issue-tracker-increment-issue-id-under-cursor)
;; }}

(defun erase-specific-buffer (num buf-name)
  (let ((message-buffer (get-buffer buf-name))
        (old-buffer (current-buffer)))
    (save-excursion
      (if (buffer-live-p message-buffer)
          (progn
            (switch-to-buffer message-buffer)
            (if (not (null num))
                (progn
                  (end-of-buffer)
                  (dotimes (i num)
                    (previous-line))
                  (set-register t (buffer-substring (point) (point-max)))
                  (erase-buffer)
                  (insert (get-register t))
                  (switch-to-buffer old-buffer))
              (progn
                (erase-buffer)
                (switch-to-buffer old-buffer))))
        (error "Message buffer doesn't exists!")
        ))))

;; {{ message buffer things
(defun erase-message-buffer (&optional num)
  "Erase the content of the *Messages* buffer in emacs.
    Keep the last num lines if argument num if given."
  (interactive "p")
  (erase-specific-buffer num
                         (cond
                          ((eq 'ruby-mode major-mode) "*server*")
                          (t "*Messages*")
                          )))

;; }}

;; {{ ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)
;; }}

;; {{ show email sent by `git send-email' in gnus
(eval-after-load 'gnus
    '(progn
       (require 'gnus-article-treat-patch)
       (setq gnus-article-patch-conditions
             '( "^@@ -[0-9]+,[0-9]+ \\+[0-9]+,[0-9]+ @@" ))
       ))
;; }}

(defun toggle-full-window()
  "Toggle the full view of selected window"
  (interactive)
  ;; @see http://www.gnu.org/software/emacs/manual/html_node/elisp/Splitting-Windows.html
  (if (window-parent)
      (delete-other-windows)
    (winner-undo)
    ))

;; {{ copy the file-name/full-path in dired buffer into clipboard
;; `w` => copy file name
;; `C-u 0 w` => copy full path
(defadvice dired-copy-filename-as-kill (after dired-filename-to-clipboard activate)
  (with-temp-buffer
    (insert (current-kill 0))
    (shell-command-on-region (point-min) (point-max)
                             (cond
                              ((eq system-type 'cygwin) "putclip")
                              ((eq system-type 'darwin) "pbcopy")
                              (t "xsel -ib")
                              )))
  (message "%s => clipboard" (current-kill 0))
  )

;; }}

(defun insert-file-link-from-clipboard ()
  "Make sure the full path of file exist in clipboard. This command will convert
The full path into relative path insert it as a local file link in org-mode"
  (interactive)
  (let (str)
    (with-temp-buffer
      (paste-from-x-clipboard)
      (setq str (buffer-string)))

    ;; convert to relative path (relative to current buffer) if possible
    (let ((m (string-match (file-name-directory (buffer-file-name)) str) ))
      (when m
        (if (= 0 m )
            (setq str (substring str (length (file-name-directory (buffer-file-name)))))
          )
        )
        (insert (format "[[file:%s]]" str))
      )
    ))

(defun convert-image-to-css-code ()
  "convert a image into css code (base64 encode)"
  (interactive)
  (let (str
        rlt
        (file (read-file-name "The path of image:"))
        )
    (with-temp-buffer
      (shell-command (concat "cat " file "|base64") 1)
      (setq str (replace-regexp-in-string "\n" "" (buffer-string)))
      )
    (setq rlt (concat "background:url(data:image/"
                      (car (last (split-string file "\\.")))
                      ";base64,"
                      str
                      ") no-repeat 0 0;"
                      ))
    (kill-new rlt)
    (copy-yank-str rlt)
    (message "css code => clipboard & yank ring")
    ))


(defun current-thing-at-point ()
  (interactive)
  (message "thing = %s" (thing-at-point 'symbol)))

(defun add-pwd-into-load-path ()
  "add current directory into load-path, useful for elisp developers"
  (interactive)
  (let ((dir (expand-file-name default-directory)))
    (if (not (memq dir load-path))
        (add-to-list 'load-path dir)
        )
    (message "Directory added into load-path:%s" dir)
    )
  )

;; {{ save history
(setq history-length 8000)
(setq savehist-additional-variables '(search-ring regexp-search-ring kill-ring))
(savehist-mode 1)
;; }}

(setq system-time-locale "C")

;; {{ unique lines
(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))
;; }}

;; {{start dictionary lookup
;; use below commands to create dicitonary
;; mkdir -p ~/.stardict/dic
;; # wordnet English => English
;; curl http://abloz.com/huzheng/stardict-dic/dict.org/stardict-dictd_www.dict.org_wn-2.4.2.tar.bz2 | tar jx -C ~/.stardict/dic
;; # Langdao Chinese => English
;; curl http://abloz.com/huzheng/stardict-dic/zh_CN/stardict-langdao-ec-gb-2.4.2.tar.bz2 | tar jx -C ~/.stardict/dic
;;
(setq sdcv-dictionary-simple-list '("鏈楅亾鑻辨眽瀛楀吀5.0"))
(setq sdcv-dictionary-complete-list '("WordNet"))
(autoload 'sdcv-search-pointer "sdcv" "show word explanation in buffer" t)
(autoload 'sdcv-search-input+ "sdcv" "show word explanation in tooltip" t)
(global-set-key (kbd "C-c ; b") 'sdcv-search-pointer)
(global-set-key (kbd "C-c ; t") 'sdcv-search-input+)
;; }}

(defun evil-toggle-input-method ()
  "when toggle on input method, switch to evil-insert-state if possible.
when toggle off input method, switch to evil-normal-state if current state is evil-insert-state"
  (interactive)
  ;; some guy donot use evil-mode at all
  (if (fboundp 'evil-insert-state)
      (if (not current-input-method)
          (if (not (string= evil-state "insert"))
              (evil-insert-state))
        (if (string= evil-state "insert")
            (evil-normal-state)
          )))
  (toggle-input-method))

(global-set-key (kbd "C-\\") 'evil-toggle-input-method)


;; {{smart-compile: http://www.emacswiki.org/emacs/SmartCompile
(autoload 'smart-compile "smart-compile" "" t)
;; }}

; {{ direx
(autoload 'direx:jump-to-directory "direx" "" t)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)
;; }}

;; {{ support MY packages which are not included in melpa
(autoload 'wxhelp-browse-class-or-api "wxwidgets-help" "" t)
(autoload 'issue-tracker-increment-issue-id-under-cursor "issue-tracker" "" t)
(autoload 'elpamr-create-mirror-for-installed "elpa-mirror" "" t)
(autoload 'org2nikola-export-subtree "org2nikola" "" t)
;; }}

(setq web-mode-imenu-regexp-list
  '(("<\\(h[1-9]\\)\\([^>]*\\)>\\([^<]*\\)" 1 3 ">" nil)
    ("^[ \t]*<\\([@a-z]+\\)[^>]*>? *$" 1 " id=\"\\([a-zA-Z0-9_]+\\)\"" "#" ">")
    ("^[ \t]*<\\(@[a-z.]+\\)[^>]*>? *$" 1 " contentId=\"\\([a-zA-Z0-9_]+\\)\"" "=" ">")
    ))

;; {{ imenu
(setq imenu-max-item-length 128)
(setq imenu-max-item-length 64)
;; }}

(defun toggle-web-js-offset ()
  "toggle js2-basic-offset"
  (interactive)
  (let ((v (if (= js2-basic-offset 2) 4 2)))
    (setq web-mode-indent-style v)
    (setq web-mode-code-indent-offset v)
    (setq web-mode-css-indent-offset v)
    (setq web-mode-markup-indent-offset v)
    (setq js2-basic-offset v)
    (message "web-mode js2-mode indent=%d" v)
    ))

(autoload 'sos "sos" "search stackoverflow" t)

;; {{ which-func
(autoload 'which-function "which-func")
(autoload 'popup-tip "popup")
(defun popup-which-function ()
  (interactive)
  (let ((msg (which-function)))
    (popup-tip msg)
    (copy-yank-str msg)
    ))
;; }}

(defun latest-kill-to-clipboard ()
  (interactive)
  (copy-yank-str (current-kill 1) t))

(autoload 'vr/replace "visual-regexp")
(autoload 'vr/query-replace "visual-regexp")
;; if you use multiple-cursors, this is for you:
(autoload 'vr/mc-mark "visual-regexp")

;; @see http://www.emacswiki.org/emacs/EasyPG#toc4
;; besides, use gnupg 1.4.9 instead of 2.0
(defadvice epg--start (around advice-epg-disable-agent disable)
  "Make epg--start not able to find a gpg-agent"
  (let ((agent (getenv "GPG_AGENT_INFO")))
    (setenv "GPG_AGENT_INFO" nil)
    ad-do-it
    (setenv "GPG_AGENT_INFO" agent)))

;; {{go-mode
;;(require 'go-mode-load)
;; }}

;; my config form init-base.el
;; try to improve slow performance on windows.
(setq w32-get-true-file-attributes nil)

;; lang, encoding
;;(set-language-environment "English")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq scroll-margin 3 scroll-conservatively 10000);;防止页面滚动时跳动，
;;scroll-margin 3 可以在靠近屏幕边界行时就开始滚动，可以很好的看到上下文
(global-hl-line-mode 1);; high light current line
(setq frame-title-format "emacs@%b");;在标题栏显示buffer的名字，而不是emacs@n.com 这样没用的提示
(setq auto-image-file-mode t);;使Emacs 可以直接打开和显示图片
(auto-compression-mode 1);;打开压缩文件时自动解压缩
(setq-default kill-whole-line nil);; 在行首C-k 时，no同时删除该行
;;处理shell-mode乱码
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
(setq echo-keystrokes 0.1);; 尽快显示按键序列
(setq line-number-display-limit 100000)
(hl-line-mode 1)
;; Use underline for do Not mix from highlight parentheses
(setq hl-line-face 'underline)
(setq query-replace-highlight t)

;;设置每句话的结束标志 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况，此时加密显出你的密码
(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)

(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))

;;临时记号
;;有时你需要跳到另一个文件进行一些操作，然后很快的跳回来。你当然可以 使用 bookmark或者寄存器
;;但是这些实在是太慢了。你多想拥有vi那样瘿ma, mb, 'a, 'b 的操作。现在你可以用几
;;蟿elisp 达到类似的目的
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
    (jump-to-register 8)
    (set-register 8 tmp)))


;;======================            拷贝代码自动格式         =====================
;;Emacs 里对代码的格式化支持的非常好，不但可以在编辑的时候自动帮你格式化，还可以选中一块代码，
;;抿Ctrl-Alt-\ 对这块代码重新进行格式化.如果要粘贴一块代码的话，粘贴完了紧接着按Ctrl-Alt-\,
;;就可以把新加入的代码格式化好。可是，对于这种粘贴加上重新格式化的机械操作，
;;Emacs 应该可以用它自动化才能配得上它的名气，把下面的代码加到配置文件里，你的 Emacs 就会拥有这种能力
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(
                     c-mode
                     c++-mode
                     clojure-mode
                     emacs-lisp-mode
                     haskell-mode
                     js-mode
                     latex-mode
                     lisp-mode
                     objc-mode
                     perl-mode
                     cperl-mode
                     plain-tex-mode
                     python-mode
                     rspec-mode
                     ruby-mode
                     scheme-mode))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))

;;----------------------            End 拷贝代码自动格式       --------------------- 

;;MMM(多个主模式 multiple mode in one buffer)
(autoload 'mmm-mode "mmm-mode" "Multiple Major Modes" t)
(autoload 'mmm-parse-buffer "mmm-mode" "Automatic MMM-ification" t)

;;;;;;;;;;;;;;;jump;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'recent-jump)
(require 'recent-jump-small)

(setq rj-mode-line-format nil)
(setq rjs-mode-line-format nil)

(recent-jump-mode)
(recent-jump-small-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(hide-ifdef-mode 1)
;;; for hideif
(defun yp-hif-toggle-block ()
  "toggle hide/show-ifdef-block --lgfang"
  (interactive)
  (require 'hideif)
  (let* ((top-bottom (hif-find-ifdef-block))
         (top (car top-bottom)))
    (goto-char top)
    (hif-end-of-line)
    (setq top (point))
    (if (hif-overlay-at top)
        (show-ifdef-block)
      (hide-ifdef-block))))

(defun hif-overlay-at (position)
  "An imitation of the one in hide-show --lgfang"
  (let ((overlays (overlays-at position))
        ov found)
    (while (and (not found) (setq ov (car overlays)))
      (setq found (eq (overlay-get ov 'invisible) 'hide-ifdef)
            overlays (cdr overlays)))
    found))

;;----------------------------------------------------------------------------
;; Shift lines up and down with M-up and M-down
;;----------------------------------------------------------------------------
(require 'move-text)
(move-text-default-bindings)

;;emacs的重做命令模式
(require 'redo+)
(global-set-key (kbd "C-?") 'redo)

;;在历史编辑中跳转 http://www.emacswiki.org/emacs/GotoChg
(require 'goto-chg)
(global-set-key (kbd "C-\\") 'goto-last-change) ;;设置跳转快捷键

;;----------------------------------------------------------------------------------------
(require 'color-moccur)                 ;人性化的搜索功能http://www.emacswiki.org/emacs/color-moccur.el
(require 'moccur-edit)                  ;搜索编辑 依赖于color-moccur http://www.emacswiki.org/emacs/moccur-edit.el
;;; ### Color moccur ###--- 增强的Buffer搜索
(setq moccur-kill-moccur-buffer t)         ;退出buffer时自动关闭其buffer
(setq moccur-edit-highlight-edited-text t) ;高亮编辑过的内容
(defadvice moccur-edit-change-file         ;编辑过后自动保存buffer
  (after save-after-moccur-edit-buffer activate)
  "Automatically save buffer when edit in moccur."
  (save-buffer))
;;----------------------------------------------------------------------------------------

(require 'ediff)                        ;文件比较功能 emacs帿http://www.emacswiki.org/emacs/EdiffMode
;;Interactively, on the fly:
;;Whitespace sensitivity – Toggle with `##’ (‘ediff-toggle-skip-similar’).
;;Case sensitivity – Toggle with `#c’ (‘ediff-toggle-ignore-case’). This assumes that you’ve loaded library Lisp:ediff+.el and that you are using ;;`diff(1)’ as ‘ediff-diff-program’. (Toggling case-sensitivity is available in vanilla GNU Emacs 22, so Lisp:ediff+.el is mainly useful for older ;;Emacs versions.)
(require 'ediff+)                       ;ediff增强 http://www.emacswiki.org/emacs/ediff+.el
(setq ediff-split-window-function (if (> (frame-width) 150)
                                      'split-window-horizontally
                                    'split-window-vertically));; split the window depending on the frame width:
    
;;;;kill-ring 里的内容都可以方便的浏览，粘贴。具体操作请在这个buffer 按C-h m 或者?.
;;;;need install browse-kill-ring
;;(require 'browse-kill-ring)
;;(global-set-key [(control c)(k)] 'browse-kill-ring)
;;(browse-kill-ring-default-keybindings)  

(provide 'init-misc)
