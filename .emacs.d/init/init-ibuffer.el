(eval-after-load 'ibuffer
  '(progn
     ;; Use human readable Size column instead of original one
     (define-ibuffer-column size-h
       (:name "Size" :inline t)
       (cond
        ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
        ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
        (t (format "%8d" (buffer-size)))))
     ;; Explicitly require ibuffer-vc to get its column definitions, which
     ;; can't be autoloaded
     (require 'ibuffer-vc)

     (setq ibuffer-expert t
           ibuffer-show-empty-filter-groups nil
           ibuffer-display-summary nil)

     (setq ibuffer-saved-filter-groups
           (quote (("default"
                    ("code" (or (mode . emacs-lisp-mode)
                                (mode . cperl-mode)
                                (mode . c-mode)
                                (mode . java-mode)
                                (mode . idl-mode)
                                (mode . web-mode)
                                (mode . lisp-mode)
                                (mode . js2-mode)
                                (mode . c++-mode)
                                (mode . lua-mode)
                                (mode . cmake-mode)
                                (mode . ruby-mode)
                                (mode . scss-mode)
                                (mode . css-mode)
                                (mode . csharp-mode)
                                (mode . objc-mode)
                                (mode . sql-mode)
                                (mode . python-mode)
                                (mode . coffee-mode)
                                (mode . php-mode)
                                (mode . sh-mode)
                                (mode . json-mode)
                                (mode . scala-mode)
                                (mode . go-mode)
                                (mode . erlang-mode)
                                ))
                    ("dired" (or (mode . dired-mode)
                                 (mode . sr-mode)
                                 ))
                    ("erc" (mode . erc-mode))
                    ("planner" (or
                                (name . "^\\*Calendar\\*$")
                                (name . "^diary$")
                                (mode . muse-mode)
                                (mode . org-mode)
                                (mode . org-agenda-mode)
                                ))
                    ("emacs" (or
                              (name . "^\\*scratch\\*$")
                              (name . "^\\*Messages\\*$")))
                    ("gnus" (or
                             (mode . message-mode)
                             (mode . bbdb-mode)
                             (mode . mail-mode)
                             (mode . gnus-group-mode)
                             (mode . gnus-summary-mode)
                             (mode . gnus-article-mode)
                             (name . "^\\.bbdb$")
                             (name . "^\\.newsrc-dribble")))))))
     (add-hook 'ibuffer-mode-hook (lambda ()
                                    ;;; this function freeze emacs (ibuffer-vc-set-filter-groups-by-vc-root)
                                    (unless (eq ibuffer-sorting-mode 'filename/process)
                                      (ibuffer-do-sort-by-filename/process))
                                    (ibuffer-switch-to-saved-filter-groups "default")
                                    ))
     ))


;; Modify the default ibuffer-formats
(setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size-h 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (vc-status 16 16 :left)
              " "
              filename-and-process)))

(setq ibuffer-filter-group-name-face 'font-lock-doc-face)
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
;; 撤销过滤按两下/，就是按 ?// ?
;; 在ibuffer中，按英文等号?= ?对未保存文件和它上一个保存版本做diff
;; 抿g 刷新文件目录
(require 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
;;显示时默认隐藏所有以*开头的文件
(require 'ibuf-ext)
;;(add-to-list 'ibuffer-never-show-predicates "^\\*") ;;启用这句话时就忽略所有以*开头的文件
;;http://www.emacswiki.org/emacs/BufferMenuPlus
;;(require 'buff-menu+)
;;; --- 交互式Buffer
(setq ibuffer-sorting-mode 'recency)    ;用最近打开模式显示
(global-set-key (kbd "C-x C-b") 'ibuffer)
(require 'vlf-setup)

(provide 'init-ibuffer)
