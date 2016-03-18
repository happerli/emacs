;;
;; ace jump mode major function
;; 
;;(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-x b") 'ace-jump-buffer)


;; 
;; enable a more powerful jump back function from ace jump mode
;;
;;(autoload
;;  'ace-jump-mode-pop-mark
;;  "ace-jump-mode"
;;  "Ace jump back:-)"
;;  t)
;;(eval-after-load "ace-jump-mode"
;;  '(ace-jump-mode-enable-mark-sync))
;;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(require 'ace-isearch)
(global-ace-isearch-mode +1)
(custom-set-variables
 '(ace-isearch-input-length 4))
(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map (kbd "C-'") 'ace-isearch-jump-during-isearch)

(provide 'init-ace-jump-mode)
