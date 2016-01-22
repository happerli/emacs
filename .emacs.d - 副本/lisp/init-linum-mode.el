(when *emacs23*
  (global-linum-mode t);;启用全局显示行号模式

  ;http://stackoverflow.com/questions/3875213/ \
  ;turning-on-linum-mode-when-in-python-c-mode
  (setq linum-mode-inhibit-modes-list '(eshell-mode
                                         shell-mode
                                         erc-mode
                                         help-mode
                                         jabber-roster-mode
                                         jabber-chat-mode
                                         twittering-mode
                                         compilation-mode
                                         weibo-timeline-mode
                                         woman-mode
                                         Info-mode
                                         calc-mode
                                         calc-trail-mode
                                         comint-mode
                                         gnus-group-mode
                                         inf-ruby-mode
                                         gud-mode
                                         org-mode
                                         vc-git-log-edit-mode
                                         log-edit-mode
                                         term-mode
                                         w3m-mode
                                         speedbar-mode
                                         gnus-summary-mode
                                         gnus-article-mode
                                         browse-kill-ring-mode
                                         calendar-mode))
  (defadvice linum-on (around linum-on-inhibit-for-modes)
             "Stop the load of linum-mode for some major modes."
             (unless (member major-mode linum-mode-inhibit-modes-list)
               ad-do-it))
  (ad-activate 'linum-on)
  )
  
;;显示行号 http://www.emacswiki.org/emacs/LinumPlus
(require 'linum+)

(provide 'init-linum-mode)
