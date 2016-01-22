;;----------------------------------------------------------------------------
;; Shift lines up and down with M-up and M-down
;;----------------------------------------------------------------------------

;;----------------------------------------------------------------------------
;; Handy key bindings
;;----------------------------------------------------------------------------
;; To be able to M-x without meta(this can hide ido)
(global-set-key (kbd "C-x C-m") 'execute-extended-command)

;;kill-word(M-d) 
;Ctrl-X, u/l  to upper/lowercase regions without confirm
(global-set-key [f12] 'list-bookmarks)
(global-set-key (kbd "M-o") 'switch-window)
;; M-x ct ENTER:Create tags file.
; @see http://xahlee.blogspot.com/2012/01/emacs-tip-hotkey-for-repeat-complex.html
(global-set-key [f2] 'repeat-complex-command)

;effective emacs item 3
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\M-s" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'tags-search)
(global-set-key "\C-x\C-n" 'find-file-other-frame) ;open new frame with a file
;KEYBOARD SECTION
;global keyb maps
(global-set-key "\C-xc" 'clipboard-kill-ring-save)
(global-set-key "\C-cc" 'copy-region-as-kill)

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

;;iedit-mode batch modify string
(global-set-key (kbd "C-c ; i") 'iedit-mode-toggle-on-function)

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

;; increase and decrease font size in GUI emacs
(when (display-graphic-p)
  (global-set-key (kbd "C-=") 'text-scale-increase)
  (global-set-key (kbd "C--") 'text-scale-decrease)
  )

(global-set-key (kbd "C-?") 'redo)
(global-set-key (kbd "C-\\") 'goto-last-change) ;;设置跳转快捷键
;;临时记号
;;有时你需要跳到另一个文件进行一些操作，然后很快的跳回来。你当然可以 使用 bookmark或者寄存器
;;但是这些实在是太慢了。你多想拥有vi那样瘿ma, mb, 'a, 'b 的操作。现在你可以用几
;;蟿elisp 达到类似的目的
(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\,)] 'ska-jump-to-register)
(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)
(global-set-key [(control c)(k)] 'browse-kill-ring)
(global-set-key [(control c)(q)] 'browse-kill-ring-quit)

(global-set-key (kbd "C-c j s") 'sr-speedbar-toggle)
(global-set-key (kbd "C-c j r") 'sr-speedbar-refresh-toggle)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

;;todo:(recent-jump-mode)
;;todo:(recent-jump-small-mode)
;;todo:find in kill ring buffer and paste to current buffer
;;M-y

;;todo:speedbar in nw

(provide 'init-key)
