;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

(setq default-directory (getenv "LJ_EMACS_WORK_DIR"));;设置打开文件的缺省路径
(defconst system-head-file-dir (list "/usr/include" "/usr/local/include"
                                     "/usr/include/sys") "system header files")
(defconst user-head-file-dir   (list "." default-directory "../hdr" "../include" ) "user header files")

(defun my-max-window()
  (if (equal window-system 'w32)
      (w32-send-sys-command 61488)
    (progn
      (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                             '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
      (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                             '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
      )
    )
  )
(run-with-idle-timer 0.5 nil 'my-max-window)

(require 'server) ;;server in back end
(when (and (= emacs-major-version 24) (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)
  )
(server-start)
;; (when (not (equal window-system 'w32)) 
;;   (setq pc-selection-mode t);;使用Win下的选择习惯,用shift+方向键进行选择
;;   (setq partial-completion-mode 1)   ;;启用部分补全功能，如输入M-x q r r相当于M-x query-replace-regexp   
;;   )

;; try to improve slow performance on windows.
(setq w32-get-true-file-attributes nil)

;; lang, encoding
(set-language-environment "English")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

(setq inhibit-startup-message t);;关闭emacs启动时的画面
(setq gnus-inhibit-startup-message t);;关闭gnus启动时的画面
(if (equal window-system 'w32)
    (progn
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (set-scroll-bar-mode nil);;取消滚动条 nw mode no effect
      )
  (progn
    (setq menu-bar-mode -1)
    (setq tool-bar-mode -1)
    (setq set-scroll-bar-mode nil);;取消滚动条 nw mode no effect
    )
  )

(toggle-menu-bar-mode-from-frame 0) ;;close menu in frame

;;font config
(setq-default line-spacing 3)
;;(w32-select-font nil t);;call font select dialog
(set-default-font "Courier-12")
;;change font size
(defun increase-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (ceiling (* 1.10
                                  (face-attribute 'default :height)))))
(defun decrease-font-size ()
  (interactive)
  (set-face-attribute 'default
                      nil
                      :height
                      (floor (* 0.9
                                (face-attribute 'default :height)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'swbuff)

;;关闭烦人的出错时的提示声
(setq ring-bell-function nil)
(setq visible-bell nil)
(blink-cursor-mode t);;nw mode no effect
(setq kill-ring-max 1024)               ;用一个很大的kill ring. 这样防止我不小心删掉重要的东西
(setq max-lisp-eval-depth 40000)        ;lisp最大执行深度
(setq max-specpdl-size 10000)           ;最大容量
(setq undo-outer-limit 5000000)         ;撤销限制
(setq message-log-max t)                ;设置message记录全部消息, 而不用截掉
(setq eval-expression-print-length nil) ;设置执行表达式的长度没有限制
(setq eval-expression-print-level nil)  ;设置执行表达式的深度没有限制
(setq global-mark-ring-max 1024)        ;设置最大的全局标记容量
(setq history-delete-duplicates t)      ;删除minibuffer的重复历史
(delete-selection-mode 1)

;;(customize-set-variable 'scroll-bar-mode 'right));;设置滚动栏在窗口右侧，而默
;;认是在左边
(fset 'yes-or-no-p 'y-or-n-p);; 改变 Emacs 固执的要你回答yes 的行为。按 y 或空格键表示 yes，n 表示 no
;;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把我的文档搞的一团糟。
;;我觉得先用光标定位，然后鼠标中键点击要好的多。不管你的光标在文档的那个位置，或
;;是在minibuffer，鼠标中键一点击，X selection 的内容就被插入到那个位置
(setq mouse-yank-at-point t)
(setq-default auto-fill-function 'do-auto-fill) ;; Autofill in all modes;;
(setq default-fill-column 80) ;;fill-column 设为 60. 这样的文字更好读
(setq require-final-newline t);; 存盘的时候，要求最后一个字符时换行符。自动的在文件末增加一新行
(setq next-line-add-newlines nil);;do not add new line while move cusor to buffer end.
(setq track-eol t);; 当光标在行尾上下移动的时候，始终保持在行尾
(setq enable-recursive-minibuffers t);;可以递归的使用minibuffer
(setq scroll-margin 3 scroll-conservatively 10000);;防止页面滚动时跳动，
;;scroll-margin 3 可以在靠近屏幕边界行时就开始滚动，可以很好的看到上下文
(setq x-select-enable-clipboard t);支持emacs和外部程序的粘贴
(global-hl-line-mode 1);; high light current line
(setq frame-title-format "emacs@%b");;在标题栏显示buffer的名字，而不是emacs@n.com 这样没用的提示
(setq auto-image-file-mode t);;使Emacs 可以直接打开和显示图片
(auto-compression-mode 1)   ;打开压缩文件时自动解压缩
(setq-default kill-whole-line nil);; 在行首C-k 时，no同时删除该行
;;处理shell-mode乱码
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
(setq echo-keystrokes 0.1);; 尽快显示按键序列
(minibuffer-electric-default-mode 1)
(icomplete-mode 1)   ;;在minibuffer里启用自动补全函数和变量 
(setq line-number-display-limit 100000)
(hl-line-mode 1)
(setq hl-line-face 'underline)
(show-paren-mode t)
(setq search-highlight t)
(setq query-replace-highlight t)

;;显示行号 http://www.emacswiki.org/emacs/LinumPlus
(require 'linum+)
(global-linum-mode 1);;启用全局显示行号模式

;;;;;;;;;;;;;;;;;;;;;;;;;;;;   显示时间设置   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;mode line 显示行列出time
(setq-default mode-line-format
              '("-" mode-line-mule-info mode-line-modified
                mode-line-frame-identification  mode-line-buffer-identification
                " " global-mode-string " %[(" mode-name mode-line-process
                minor-mode-alist "%n" ")%]-" (which-func-mode ("" which-func-format "-"))
                (line-number-mode "L%l-")(column-number-mode "C%c-")(-3 . "%p")"-%-")
              )
(setq column-number-mode t)
(setq line-number-mode t)
(display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠
(setq display-time-24hr-format t);;时间使用24小时制
(setq display-time-day-and-date t);;时间显示包括日期和具体时间
(setq display-time-interval 10);;时间的变化频率
(setq display-time-string-forms
      '(month "/" day "(" dayname ")" 24-hours ":" minutes))
(display-time)
;;;;;;;;;;;;;;;;;;;;;;;;;;;  显示时间设置结束  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mini buffer, mode line
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(require 'uniquify);;当有两个文件名相同的缓冲敿保持每个buffer名唯一的功能
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
(setq uniquify-after-kill-buffer-p t)  ;删除重复名字的Buffer后重命名

;; 语法高亮。除 shell-mode 和text-mode 之外的模式中使用语法高亮
(setq font-lock-maximum-decoration t)
(setq font-lock-global-modes '(not shell-mode text-mode))
(setq font-lock-verbose t)
(setq font-lock-maximum-size '((t . 1048576) (vm-mode . 5250000)))


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


(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)
;;设置每句话的结束标志 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。

(add-hook 'comint-output-filter-functions
          'comint-watch-for-password-prompt)
;;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况，此时加密显出你的密码

(defun open-eshell-other-buffer ()
  "Open eshell in other buffer"
  (interactive)
  (split-window-vertically)
  (eshell))

;;emacs的重做命令模式
(require 'redo+)
(global-set-key (kbd "C-?") 'redo)

;;智能括号
(require 'autopair)      ;;智能自动补全括号 http://www.emacswiki.org/emacs/AutoPairs
(autopair-global-mode 1) ;; 全局启用智能补全括号
(require 'highlight-parentheses);智能括号匹配高亮 http://www.emacswiki.org/emacs/HighlightParentheses

;;;使autopair模式和highlight-parentheses集成交互使用
(add-hook 'highlight-parentheses-mode-hook
          '(lambda ()
             (setq autopair-handle-action-fns
                   (append
                    (if autopair-handle-action-fns
                        autopair-handle-action-fns
                      '(autopair-default-handle-action))
                    '((lambda (action pair pos-before)
                        (hl-paren-color-update)))))))

;;Enables highlight-parentheses-mode on all buffers:
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)
(setq show-paren-style 'parentheses)    ;括号匹配显示但不是烦人的跳到另一个括号

;; 高亮显示当前buffer中的一个符号
;;Quickly highlight a symbol throughout the buffer and cycle through its locations.
(require 'highlight-symbol)
(highlight-symbol-mode t)
(dolist (hook (list                     ;设置highlight mode
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
  (add-hook hook '(lambda () (setq highlight-symbol-mode t))))

(global-set-key [f7] 'highlight-symbol-at-point)
(global-set-key [C-f7] 'highlight-symbol-next)
(global-set-key [S-f7] 'highlight-symbol-prev)

;;在历史编辑中跳转 http://www.emacswiki.org/emacs/GotoChg
(require 'goto-chg)
(global-set-key (kbd "C-\\") 'goto-last-change) ;;设置跳转快捷键

(require 'color-moccur)                 ;人性化的搜索功能http://www.emacswiki.org/emacs/color-moccur.el
(require 'moccur-edit)                  ;搜索编辑 依赖于color-moccur http://www.emacswiki.org/emacs/moccur-edit.el
;;; ### Color moccur ###--- 增强的Buffer搜索
(setq moccur-kill-moccur-buffer t)         ;退出buffer时自动关闭其buffer
(setq moccur-edit-highlight-edited-text t) ;高亮编辑过的内容
(defadvice moccur-edit-change-file         ;编辑过后自动保存buffer
  (after save-after-moccur-edit-buffer activate)
  "Automatically save buffer when edit in moccur."
  (save-buffer))

(require 'ediff)                        ;文件比较功能 emacs帿http://www.emacswiki.org/emacs/EdiffMode
(require 'ediff+)                       ;ediff增强 http://www.emacswiki.org/emacs/ediff+.el
(setq ediff-split-window-function (if (> (frame-width) 150)
                                      'split-window-horizontally
                                    'split-window-vertically));; split the window depending on the frame width:

;;用M-x执行某个命令的时候，在输入的同时给出可选的命令名提示http://www.emacswiki.org/emacs/IcompleteMode
(require 'icomplete+) 
(icomplete-mode 99) ;;启用M-x命令提示
(eval-after-load "icomplete" '(progn (require 'icomplete+))) ;;icomplete模式增强
;; ;;Mcomplete Mode == IcompleteMode + IswitchBuffers  这个 模式容易出问题
;; (require 'mcomplete)
;; (load "mcomplete-history")
;; (autoload 'mcomplete-mode "mcomplete"
;;   "Toggle minibuffer completion with prefix and substring matching."
;;       t nil)
;; (autoload 'turn-on-mcomplete-mode "mcomplete"
;;   "Turn on minibuffer completion with prefix and substring matching."
;;   t nil)
;; (autoload 'turn-off-mcomplete-mode "mcomplete"
;;   "Turn off minibuffer completion with prefix and substring matching."
;;   t nil)
;; (turn-on-mcomplete-mode)

;; 用ibuffer代替默认的buffer switch
;; 参考http://www.emacswiki.org/emacs/IbufferMode
;; http://www.emacswiki.org/emacs/ibuffer
;; ibuffer是emacs自带的，可用 M-x ibuffer 调出
;; 下面只是将快捷键 C-x C-b 映射为调出ibuffer的命令
;; 在ibuffer中的操作方式和dired mode一样
;; n和p是上下，m是选中该文件，可选多个，D是kill buffer
;; 回车或者按e(就是edit)来编辑文件
;; 在ibuffer页面，用英文斜线来通过关键字过滤缩小显示文件范围
;; / 后面支持正则表达式
;; 撤销过滤按两下/，就是按 ᾿// ᾿
;; 在ibuffer中，按英文等号᾿= ᾿对未保存文件和它上一个保存版本做diff
;; 抿g 刷新文件目录
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
;;显示时默认隐藏所有以*开头的文件
(require 'ibuf-ext)
;;(add-to-list 'ibuffer-never-show-predicates "^\\*") ;;启用这句话时就忽略所有以*开头的文件
;;http://www.emacswiki.org/emacs/BufferMenuPlus
(require 'buff-menu+)
;;; --- 交互式Buffer
(setq ibuffer-sorting-mode 'recency)    ;用最近打开模式显示


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

;;将文件模式和文件后缀关联起来。append表示追加
( setq auto-mode-alist
      ( append 
        '(("\\.py\\'" . python-mode)
          ("\\.s?html?\\'" . html-helper-mode)
          (" \\.asp\\'" . html-helper-mode)
          ("\\.phtml\\'" . html-helper-mode)
          ("\\.css\\'" . css-mode)
          ("\\.pc$" . c-mode)
          )
        auto-mode-alist))

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

;;======================            拷贝代码自动格式势         =====================
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

;;----------------------            End 拷贝代码自动格式势       --------------------- 

;;kill-ring 里的内容都可以方便的浏览，粘贴。具体操作请在这个buffer 按C-h m 或者?.
(require 'browse-kill-ring)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(browse-kill-ring-default-keybindings)


;;设置以下 hippie-expand 的补全方式。它是一个优先列表， hippie-expand 会优先使用表最前面的函数来补全
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list 
      '(
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;;hide region ,this script make no effect of (pc-selection-mode);;使用Win下的选择习惯,用shift+方向键进行选择
                                        ;(require 'hide-region)
                                        ;(global-set-key (kbd "C-c r") 'hide-region-hide)
                                        ;(global-set-key (kbd "C-c R") 'hide-region-unhide)

;; hide lines
                                        ;(require 'hide-lines)
                                        ;(global-set-key (kbd "C-c l") 'hide-lines)
                                        ;(global-set-key (kbd "C-c L") 'show-all-invisible)

;;fold function
(load-library  "folding")
(declare (special fold-fold-on-startup
                  fold-keys-already-setup
                  ))

(setq fold-fold-on-startup t)
(folding-mode-add-find-file-hook)

(setq fold-keys-already-setup nil)
(add-hook 'folding-mode-hook
          (function (lambda()
                      (unless fold-keys-already-setup
                        (setq fold-keys-already-setup t)
                        (define-prefix-command 'ctl-f-folding-mode-prefix)
                        (define-key 'ctl-f-folding-mode-prefix "f" 'fold-fold-region)
                        (define-key  'ctl-f-folding-mode-prefix "e" 'fold-enter)
                        (define-key 'ctl-f-folding-mode-prefix "x" 'fold-exit)
                        (define-key  'ctl-f-folding-mode-prefix "b" 'fold-whole-buffer)
                        (define-key 'ctl-f-folding-mode-prefix "o" 'fold-open-buffer)
                        (define-key 'ctl-f-folding-mode-prefix "h" 'fold-hide)
                        (define-key 'ctl-f-folding-mode-prefix "s" 'fold-show)
                        (define-key 'ctl-f-folding-mode-prefix "t" 'fold-top-level)
                        (define-key 'ctl-f-folding-mode-prefix "f" 'fold-fold-region)
                        )
                      (local-set-key "\C-f" 'ctl-f-folding-mode-prefix))))

(fold-add-to-marks-list 'sgml-mode
                        "<!-- {" 
                        "<!-- } -->" " --> ")
(fold-add-to-marks-list 'c-mode "/* <" "/* > */" "*/")
(fold-add-to-marks-list 'c++-mode
                        "//<" "//>" "")
(fold-add-to-marks-list 'LaTeX-mode "%%% {{{" "%%% }}}" " ")
(fold-add-to-marks-list 'latex2e-mode "%%% {{{" "%%% }}}" " ")
(fold-add-to-marks-list 'latex-mode "%%%% {{{" "%%%% }}}" " ")
(fold-add-to-marks-list 'BibTeX-mode "%%% {{{" "%%% }}}" " ")
(fold-add-to-marks-list 'lisp-mode ";;; {" ";;; }" "")
(fold-add-to-marks-list 'lex-mode" /* {{{ " " /* }}} */ " "*/")
(fold-add-to-marks-list 'html-mode "<!-- { " "<!-- } -->" "-->")
(fold-add-to-marks-list 'shell-script-mode "# {{{" "# }}}" nil)
(fold-add-to-marks-list 'sh-mode "# {{{ " "# }}}" nil)


;;使用 Ctrl-c left arrow（对，就是向左的箭头键）组合键，退回你的上一个窗口设置
(when (fboundp 'winner-mode)
  (winner-mode 1))


;;MMM(多个主模式 multiple mode in one buffer)
(autoload 'mmm-mode "mmm-mode" "Multiple Major Modes" t)
(autoload 'mmm-parse-buffer "mmm-mode" "Automatic MMM-ification" t)


;;emacs中管理多个终端的工具,what advance???
;;http://www.emacswiki.org/emacs/MultiTerm
(require 'multi-term)
(setq multi-term-program "/bin/bash")


(defun window-move-up (&optional arg)
  "Current window move-up 2 lines."
  (interactive "P")
  (if arg
      (scroll-up arg)
    (scroll-up 2)))

(defun window-move-down (&optional arg)
  "Current window move-down 3 lines."
  (interactive "P")
  (if arg
      (scroll-down arg)
    (scroll-down 3)))

(defun other-window-move-up (&optional arg)
  "Other window move-up 1 lines."
  (interactive "p")
  (scroll-other-window arg))

(defun other-window-move-down (&optional arg)
  "Other window move-down 2 lines."
  (interactive "P")
  (if arg
      (scroll-other-window-down arg)
    (scroll-other-window-down 2)))

(global-font-lock-mode t)
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("　" 0 my-face-b-1 append)
     ("\t" 0 my-face-u-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(defface my-face-f-2 '((t (:foreground "GreenYellow"))) nil)
(defvar my-face-f-2 'my-face-f-2)
;; Emacs 中，改变文件时，默认都会产生备份文件(以~ 结尾的文件。可以完全去掉
;; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一
;; 个固定的地方("~/backups")。对于每个备份文件，保留最原始的两个版本和最新的
;; 1个版本。并备份的时候，备份文件是复本，而是原件
(setq version-control t);;启用版本控制，即可以备份多次
;;(setq backup-directory-alist (quote (("." . "~/.emacs/backups"))))
(setq backup-directory-alist '(("." . "~/.emacs/local/backups/")))
(setq kept-old-versions 2);;备份最原始的两次及第一次编辑前的文档和第二次编辑前的
;;文件
(setq kept-new-versions 10);;备份最新的版本10次，理解同上
(setq delete-old-versions t);;删掉不属于以上版本的版本
(setq backup-by-copying t);;备份设置方法，直接拷贝
(setq make-backup-files t);; 设定产生备份文件
;;(setq-default make-backup-files nil);; 不生成临时文件
;;(setq auto-save-mode nil) ;;自动保存模式

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;set title show path name
(setq frame-title-format
      '("%S" (buffer-file-name "%f"
                               (dired-directory dired-directory "%b"))))
;; set title show path name END

;;(autoload 'php-html-helper-mode "html-helper-mode" "html-helper-mode" t)
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)
;;   To invoke html-helper-mode automatically on .html files, do this:
(setq auto-mode-alist (cons '("\\.html$" . html-helper-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.htm$" . html-helper-mode) auto-mode-alist))
;;   To invoke html-helper-mode automatically on .asp files, do this:
;;     (setq auto-mode-alist (cons '("\\.asp$" . html-helper-mode) auto-mode-alist))
;;   To invoke html-helper-mode automatically on .phtml files, do this:
;;     (setq auto-mode-alist (cons '("\\.phtml$" . html-helper-mode) auto-mode-alist))
;;ƥƤ(ºí-εܳ°´%4¶Փ¦ƥƤµŀ¨ºÊ(global-set-key "%" 'match-paren)

(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))
;;END
;;;;;;;;;;;;;;;;;;;;;;;End;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;IDO模式
;;lets you interactively do things with buffers and files.
;;http://www.masteringemacs.org/articles/2010/10/10/introduction-to-ido-mode/
;;http://www.emacswiki.org/emacs/InteractivelyDoThings
;;ido的配合这个可以使你在用C-x C-f打开文件的时候在后面有提示
;;这里是直接打开了ido的支持，在emacs23中这个是自带的
;;(require 'ido)
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode t);;启用ido模式 有一段时间无法启用ido的原因是由于ido.el是emacs23自带
;;的而我在我的插件目录下有ido.el有冲突，所以去掉就可以初始化了
;;(setq ido-enable-flex-matching t)                   ;模糊匹配


;;如果你已经有了一个region。你可以使用 C-x r C-x 把它显示为一个矩形
;;如果你刚开始设定一个矩形区域，你可以使用 C-x r 作为你的 set-mark-command 的前
;;缀，比如 C-x r C-SPC。那么区域会被显示为矩形⾿
(require 'rect-mark)


;;filecache 能够根据用户输入的文件名，找到该文件的实际位置，省去了用户回忆和查找
;;的过程。 下面是我的配置（忽略git相关目录及文件） filecache 没有独立的文档，
;;用法记录在源文件头上的注释里，不过已经足够了，本来也不是很复杂的东西⾿
;;使用时有一个小窍门，在使用 C-x C-f 打开文件时，不用管前面的目录名是什么，直接
;;在后面 输入文件名，然后用 C-TAB 补全，目录名会自动被替换，无需手工修改
(require 'filecache)
(add-to-list 'file-cache-filter-regexps "\\.git\\>")
(add-to-list 'file-cache-filter-regexps "\\out\\>")
(add-to-list 'file-cache-filter-regexps "\\out2\\>")
(add-to-list 'file-cache-filter-regexps "\\svn\\>")
(add-to-list 'file-cache-filter-regexps "\\.svn\\>")

(defun file-cache-save-cache-to-file (file)
  "Save contents of `file-cache-alist' to FILE.
For later retrieval using `file-cache-read-cache-from-file'"
  (interactive "FFile: ")
  (with-temp-file (expand-file-name file)
    (prin1 file-cache-alist (current-buffer))))

(defun file-cache-read-cache-from-file (file)
  "Clear `file-cache-alist' and read cache from FILE.
The file cache can be saved to a file using
`file-cache-save-cache-to-file'."
  (interactive "fFile: ")
  (file-cache-clear-cache)
  (let ((buf (find-file-noselect file)))
    (setq file-cache-alist (read buf))
    (kill-buffer buf)))

;;Automatically add files
;;The suggested way to add files automatically:
;;(file-cache-add-directory-recursively (getenv "LJ_EMACS_WORK_DIR"));;/path/to/project

;; (eval-after-load "filecache"
;;   '(progn (file-cache-add-directory-using-find (getenv "LJ_EMACS_WORK_DIR"))
;;           (file-cache-add-directory-list '(getenv "LJ_EMACS_WORK_DIR"))
;;           (file-cache-add-file-list (getenv "LJ_EMACS_WORK_DIR"))))
;; ;;           (file-cache-add-directory-list '("~/project/nautilus_4.0_ST_RC" "~/project/nautilus_4.0_ST_RC/src" "~/project/nautilus_4.0_ST_RC/test"))
;; ;;           (file-cache-add-file-list (list "~/foo/bar" "~/baz/bar"))))

(define-key minibuffer-local-completion-map [C-tab] 'file-cache-minibuffer-complete)
(define-key minibuffer-local-map [C-tab] 'file-cache-minibuffer-complete)
(define-key minibuffer-local-must-match-map [C-tab] 'file-cache-minibuffer-complete)
(require 'pc-select)
(pc-selection-mode t)
(setq shift-select-mode t)
