;;----------------------------------------------------------------------------
;; Nicer naming of buffers for files with identical names
;;----------------------------------------------------------------------------
(require 'uniquify);;当有两个文件名相同的缓冲敿保持每个buffer名唯一的功能
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
(setq uniquify-after-kill-buffer-p t)  ;删除重复名字的Buffer后重命名

(provide 'init-uniquify)