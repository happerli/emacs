;; -*- coding: utf-8 -*-
;;----------------------------------------------------------------------------
;; TODO:
;;----------------------------------------------------------------------------
;; 1. filter elpa packeage
;; 2. change include path in init-cc-mode.el
;; 3. create project
;; 4. create or update ctags&gtags
;; 5. when use cygwin, Change path to cygwin directory in window
;; 6. You possibly need run below command at the terminal at least once to update the content from package repositories:
;;       emacs -nw --batch -l ~/.emacs.d/init.el -f package-refresh-contents
;;    The command “package-refresh-content” will fetch the latest package list from remote servers.
;;    It has to be done manually. It’s not reasonable to automatically fetch the list for a normal text editor.
;;    You maybe should modify URL of "melpa-stable" for download package.

;;----------------------------------------------------------------------------
;; Prepare
;;----------------------------------------------------------------------------
;; 1. add emacs, gtags etc. to path environment variable.
;;    such as D:\emacs-24.3\bin\;D:\emacs-24.3\glo651wb\bin;
;; 2. run gtags in root directory of source code.
;;----------------------------------------------------------------------------
;; Which functionality can use
;;----------------------------------------------------------------------------
;; 1. csv-mode:edit csv file
;; 2. delim-pad:在（）fill white space。
;;     When manipulating padding space in front of a list with SPC and DEL, make
;;     matching ending padding the same:
;;     (    foo, bar    )
;;      ^^^^        ####
;; 3. (global-set-key "\C-ci" 'ido-goto-symbol) ; in init-ido.el: any key you see fit
;; 4. dired mode:
;;    "C-x d": enter dired mode;
;;    "C-x C-j" jump to current directory;
;;    h 模式帮助
;;    n, p 上、下移动光标
;;    C-n, C-p 上、下移动光标
;;    M-{, M-} 已标记的文件之间移动
;;    <, > 缓冲中的目录行间移动
;;    m 标记文件，下移一行
;;    u 去掉标记，下移一行 
;;    U 去掉缓冲中所有的标记
;;    M-Backspace 去掉缓冲中所有的某个标记，缺省为 * 标记
;;    t 标记/未标记互换
;;    D 删除所有标记的文件/目录 [*]
;;    d 设置“删除标记”（字符D），并且光标下移一行 
;;    x 执行删除用 d 标记的文件/目录
;;    % g 标记所有“含有”regexp 的文件
;;    * * 标记所有可执行文件
;;    * . 标记所有同扩展名文件
;;    * / 标记所有目录
;;    * @ 标记所有符号连接
;;    * c 改变标记的符号
;;    % d 通过匹配 regexp 标记删除
;;    % m 通过匹配 regexp 标记
;;    C-x C-f 创建文件
;;    + 创建目录
;;    R 文件的重命名/移动
;;    C 复制文件
;;    S 创建文件的 Symbol link (绝对路径)
;;    Y 创建文件的 Symbol link (相对路径)
;;    H 创建文件的 Hard link
;;    % C 复制匹配 regexp 的文件
;;    % S 创建匹配 regexp 的 Symbol link (绝对路径)
;;    % Y 创建匹配 regexp 的 Symbol link (相对路径)
;;    % H 创建匹配 regexp 的 Hark link
;;    % l 文件名逐一改为小写
;;    % u 文件名逐一改为大写
;;    % R, % r 重命名/移动匹配 regexp 的文件
;;    访问文件，目录
;;    e, f, RET 打开文件或目录
;;    a 打开文件或目录，并替换当前缓冲
;;    v 使用 view 模式查看文件，q 退出，有些文件使用外部查看程序调用
;;    o 另一个窗口中，打开文件或目录
;;    C-o 另一个窗口中，打开文件或目录，但当前窗口不变
;;    F 打开(多个)文件
;;    I 使用 Info 模式查看文件
;;    N 使用 man 模式查看文件，若有前缀参数，提示输入处理命令
;;    V 使用 RMAIL 模式查看文件
;;    ^ 访问目录的父目录，若有前缀参数在另外的窗口中打开
;;    q 退出缓冲，若有前缀参数则关闭缓冲
;;    s 互换缓冲中“文件名/时间”排序
;;    C-u s 修改传递给 ls 的参数，即修改每行的内容
;;    i 把当前行的子目录插入缓冲中
;;    M-o 隐藏/显示部分次要文件，使缓冲更简便，若有前缀参数标记隐藏的文件
;;    $ 隐藏/显示当前目录中内容 
;;    M-$ 隐藏/显示缓冲中所有目录内容
;;    k 隐藏文件，按 g 可以再显示出来
;;    l 刷新缓冲文件
;;    g 刷新缓冲所有文件
;;    C-/, C-_, C-x u dired 模式的 undo
;;    其他
;;    = 比较文件
;;    M-= 文件和备份之间比较，若有前缀参数，提示输入 diff 选项
;;    w 复制文件名到 kill-ring
;;    Z 压缩/解压缩文件
;;    X 在文件上执行 shell 命令
;;    B 编译(Emacs Lisp)文件
;;    L 加载(Emacs Lisp)文件
;;    y 给出文件类型信息 (通过 file 命令)
;;    P 打印文件
;; 5. (global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; 6. (global-set-key (kbd "C-x 4 u") 'winner-undo)
;;    (global-set-key (kbd "C-x 4 r") 'winner-redo)
;;    (global-set-key "\C-x|" 'split-window-horizontally-instead)
;;    (global-set-key "\C-x_" 'split-window-vertically-instead)
;; 7. (global-set-key (kbd "C-M-=") 'increase-default-font-height);;no effect in nw
;;    (global-set-key (kbd "C-M--") 'decrease-default-font-height);;no effect in nw
;; 8. M+num: switch to window
;; 9. when switch to shell script mode, it maybe freeze emacs in cygwin nw, 
;;      you should press C-g to stop snippets loading for shell script mode.
;; 10. (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; 11. define key in term or xterm in init-term.el and init-xterm.el
;; 12. (global-set-key (kbd "C-c j s") 'sr-speedbar-toggle)
;;     (global-set-key (kbd "C-c j r") 'sr-speedbar-refresh-toggle)
;; 13. switch buffer:c-x-left,c-x-right. or ido-switch-buffer. or c-x-b
;; 14. undo or redo : ( but redo has problem in nw.)
;;     (global-set-key (kbd "C-?") 'undo)
;;     (global-set-key (kbd "C-?") 'redo)
;; 15. navigate in current buffer.
;;     (define-key global-map [f5] 'recent-jump-backward)
;;     (define-key global-map [f6] 'recent-jump-forward)
;; 16. highlight symbol:
;;     (global-set-key [f7] 'highlight-symbol-at-point)
;;     (global-set-key [C-f7] 'highlight-symbol-next)
;;     (global-set-key [S-f7] 'highlight-symbol-prev)
;; 17. gtags:
;;     'M-. TAG' 跳到第一个 TAG 的定义处。
;;     'M-*'     回到开始查找 TAG 的地方
;;     'M-p' or 'M-n' jump cursor to prev or next line in tags buffer.
;; 18. To be able to M-x without meta(this can hide ido)
;;     (global-set-key (kbd "C-x C-m") 'execute-extended-command)
;; 19. switch buffer
;;     "C-x C-b"
;;     "C-x b"
;;     "C-x left"
;;     "C-x right"
;; 20. Shift lines up and down with M-up and M-down
;; 21. sr-speedbar
;;     (global-set-key (kbd "C-c j s") 'sr-speedbar-toggle)
;;     (global-set-key (kbd "C-c j r") 'sr-speedbar-refresh-toggle)
;; other key binding:
;;     refer to init-key.
;;----------------------------------------------------------------------------------


(setq emacs-load-start-time (current-time))
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/init"))

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *macbook-pro-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))
(setq *win32* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *linux-x* (and window-system *linux*) )
(setq *xemacs* (featurep 'xemacs) )
(setq *emacs23* (and (not *xemacs*) (or (>= emacs-major-version 23))) )
(setq *emacs24* (and (not *xemacs*) (or (>= emacs-major-version 24))) )
(setq *no-memory* (cond
                   (*is-a-mac*
                    (< (string-to-number (nth 1 (split-string (shell-command-to-string "sysctl hw.physmem")))) 4000000000))
                   (*linux* nil)
                   (t nil)
                   ))

;----------------------------------------------------------------------------
; Functions (load all files in defuns-dir)
;----------------------------------------------------------------------------
 (setq defuns-dir (expand-file-name "~/.emacs.d/defuns"))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
      (load file)))
 ;----------------------------------------------------------------------------
; Load configs for specific features and modes
;----------------------------------------------------------------------------
(require 'init-modeline)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(server-start)  
(require 'cl-lib)
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el

;; win32 auto configuration, assuming that cygwin is installed at "d:/cygwin"
(condition-case nil
    (when *win32*
      (setq cygwin-mount-cygwin-bin-directory "d:/cygwin64/bin")
      (require 'setup-cygwin)
      ;; better to set HOME env in GUI
      ;; (setenv "HOME" "c:/cygwin/home/someuser")
      )
  (error
   (message "setup-cygwin failed, continue anyway")
   ))
(require 'idle-require)
(require 'init-exec-path) ;; Set up $PATH
(provide 'init)
(put 'scroll-left 'disabled nil)
