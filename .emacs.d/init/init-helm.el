(require 'helm-config)

(autoload 'helm-c-yas-complete "helm-c-yasnippet" nil t)
;;(global-set-key (kbd "C-x C-f") 'ffap)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(autoload 'helm-ls-git-ls "helm-ls-git" nil t)
(autoload 'helm-browse-project "helm-ls-git" nil t)

;; {{ Lean helm window
;; @see http://www.reddit.com/r/emacs/comments/2z7nbv/lean_helm_window/
(setq helm-display-header-line nil) ;; t by default
;; keep the full source header line when multiple sources
;; and hidden when there's a single source
(defun helm-toggle-header-line ()
  (if (= (length helm-sources) 1)
      (set-face-attribute 'helm-source-header nil :height 0.1)
    (set-face-attribute 'helm-source-header nil :height 1.0)))
(add-hook 'helm-before-initialize-hook 'helm-toggle-header-line)

;; {{ Helm window always opens in current window we are working on, from @tuhdo
(setq helm-echo-input-in-header-line t)
(defun helm-hide-minibuffer-maybe ()
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face (let ((bg-color (face-background 'default nil)))
                              `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)
;; }}

(eval-after-load 'helm
  '(progn
     ;; Helm window is too big?
     ;;(helm-autoresize-mode 1)

     ;; @see http://tuhdo.github.io/helm-intro.html
     (setq helm-split-window-in-side-p t ;; opens a small window inside the lower half of current window
           helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
           helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
           helm-scroll-amount 8 ; scroll 8 lines other window using M-<next>/M-<prior>
           helm-ff-file-name-history-use-recentf t)

     (when (executable-find "curl")
       (setq helm-google-suggest-use-curl-p t))

     (setq helm-completing-read-handlers-alist
           '((describe-function . ido)
             (describe-variable . ido)
             (debug-on-entry . helm-completing-read-symbols)
             (find-function . helm-completing-read-symbols)
             (find-tag . helm-completing-read-with-cands-in-buffer)
             (ffap-alternate-file . nil)
             (tmm-menubar . nil)
             (dired-do-copy . nil)
             (dired-do-rename . nil)
             (vc-copy-file-and-rename-buffer . nil)
             (dired-create-directory . nil)
             (find-file . ido)
             (copy-file-and-rename-buffer . nil)
             (rename-file-and-buffer . nil)
             (w3m-goto-url . nil)
             (ido-find-file . nil)
             (ido-edit-input . nil)
             (mml-attach-file . ido)
             (read-file-name . nil)
             (yas/compile-directory . ido)
             (execute-extended-command . ido)
             (minibuffer-completion-help . nil)
             (minibuffer-complete . nil)
             (c-set-offset . nil)
             (wg-load . ido)
             (rgrep . nil)
             (read-directory-name . ido)
             ))
    (helm-mode 1)
	(global-set-key (kbd "M-x") 'helm-M-x)
	(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
	(global-set-key (kbd "M-y") 'helm-show-kill-ring)
	(global-set-key (kbd "C-x b") 'helm-mini)
	(global-set-key (kbd "C-c h o") 'helm-occur)
	(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
	(global-set-key (kbd "C-'") 'ace-jump-helm-line)
    ))
;; }}

;; {{helm-gtags
;; customize
(autoload 'helm-gtags-mode "helm-gtags" nil t)
(setq helm-c-gtags-path-style 'relative)
(setq helm-c-gtags-ignore-case t)
(setq helm-c-gtags-read-only t)
(add-hook 'c-mode-hook (lambda () (helm-gtags-mode)))
(add-hook 'c++-mode-hook (lambda () (helm-gtags-mode)))
;; }}



;; key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
              (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
              (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
              (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
              (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
              (local-set-key (kbd "C-c C-f") 'helm-gtags-pop-stack)))
;; ==end

(if *emacs24*
    (progn
      (autoload 'helm-c-yas-complete "helm-c-yasnippet" nil t)
      (global-set-key (kbd "C-x C-o") 'helm-find-files)
      (global-set-key (kbd "C-c f") 'helm-for-files)
      (global-set-key (kbd "C-c y") 'helm-c-yas-complete)
      (global-set-key (kbd "C-c i") 'helm-imenu)
      )
  ;;(global-set-key (kbd "C-x C-f") 'ffap)
  )

;;(autoload 'helm-swoop "helm-swoop" nil t)
;;(autoload 'helm-back-to-last-point "helm-swoop" nil t)
(require 'helm-swoop)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; Move up and down like isearch
(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)
;; If you prefer fuzzy matching
(setq helm-swoop-use-fuzzy-match t)

(require 'linum-relative)
(helm-linum-relative-mode 1)
(linum-relative-in-helm-p)

(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)


;;; Enable helm-gtags-mode
;;(add-hook 'c-mode-hook 'helm-gtags-mode)
;;(add-hook 'c++-mode-hook 'helm-gtags-mode)
;;(add-hook 'asm-mode-hook 'helm-gtags-mode)
;;
;;;; customize
;;(custom-set-variables
;; '(helm-gtags-path-style 'relative)
;;'(helm-gtags-ignore-case t)
;; '(helm-gtags-auto-update t))
;;
;;;; key bindings
;;(eval-after-load "helm-gtags"
;;  '(progn
;;     (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-find-tag)
;;     (define-key helm-gtags-mode-map (kbd "M-]") 'helm-gtags-find-rtag)
;;     ;;(define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
;;     (define-key helm-gtags-mode-map (kbd "M-*") 'helm-gtags-pop-stack)))

;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

(provide 'init-helm)
