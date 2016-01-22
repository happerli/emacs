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
;;    The command ��package-refresh-content�� will fetch the latest package list from remote servers.
;;    It has to be done manually. It��s not reasonable to automatically fetch the list for a normal text editor.
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
;; 2. delim-pad:�ڣ���fill white space��
;;     When manipulating padding space in front of a list with SPC and DEL, make
;;     matching ending padding the same:
;;     (    foo, bar    )
;;      ^^^^        ####
;; 3. (global-set-key "\C-ci" 'ido-goto-symbol) ; in init-ido.el: any key you see fit
;; 4. dired mode:
;;    "C-x d": enter dired mode;
;;    "C-x C-j" jump to current directory;
;;    h ģʽ����
;;    n, p �ϡ����ƶ����
;;    C-n, C-p �ϡ����ƶ����
;;    M-{, M-} �ѱ�ǵ��ļ�֮���ƶ�
;;    <, > �����е�Ŀ¼�м��ƶ�
;;    m ����ļ�������һ��
;;    u ȥ����ǣ�����һ�� 
;;    U ȥ�����������еı��
;;    M-Backspace ȥ�����������е�ĳ����ǣ�ȱʡΪ * ���
;;    t ���/δ��ǻ���
;;    D ɾ�����б�ǵ��ļ�/Ŀ¼ [*]
;;    d ���á�ɾ����ǡ����ַ�D�������ҹ������һ�� 
;;    x ִ��ɾ���� d ��ǵ��ļ�/Ŀ¼
;;    % g ������С����С�regexp ���ļ�
;;    * * ������п�ִ���ļ�
;;    * . �������ͬ��չ���ļ�
;;    * / �������Ŀ¼
;;    * @ ������з�������
;;    * c �ı��ǵķ���
;;    % d ͨ��ƥ�� regexp ���ɾ��
;;    % m ͨ��ƥ�� regexp ���
;;    C-x C-f �����ļ�
;;    + ����Ŀ¼
;;    R �ļ���������/�ƶ�
;;    C �����ļ�
;;    S �����ļ��� Symbol link (����·��)
;;    Y �����ļ��� Symbol link (���·��)
;;    H �����ļ��� Hard link
;;    % C ����ƥ�� regexp ���ļ�
;;    % S ����ƥ�� regexp �� Symbol link (����·��)
;;    % Y ����ƥ�� regexp �� Symbol link (���·��)
;;    % H ����ƥ�� regexp �� Hark link
;;    % l �ļ�����һ��ΪСд
;;    % u �ļ�����һ��Ϊ��д
;;    % R, % r ������/�ƶ�ƥ�� regexp ���ļ�
;;    �����ļ���Ŀ¼
;;    e, f, RET ���ļ���Ŀ¼
;;    a ���ļ���Ŀ¼�����滻��ǰ����
;;    v ʹ�� view ģʽ�鿴�ļ���q �˳�����Щ�ļ�ʹ���ⲿ�鿴�������
;;    o ��һ�������У����ļ���Ŀ¼
;;    C-o ��һ�������У����ļ���Ŀ¼������ǰ���ڲ���
;;    F ��(���)�ļ�
;;    I ʹ�� Info ģʽ�鿴�ļ�
;;    N ʹ�� man ģʽ�鿴�ļ�������ǰ׺��������ʾ���봦������
;;    V ʹ�� RMAIL ģʽ�鿴�ļ�
;;    ^ ����Ŀ¼�ĸ�Ŀ¼������ǰ׺����������Ĵ����д�
;;    q �˳����壬����ǰ׺������رջ���
;;    s ���������С��ļ���/ʱ�䡱����
;;    C-u s �޸Ĵ��ݸ� ls �Ĳ��������޸�ÿ�е�����
;;    i �ѵ�ǰ�е���Ŀ¼���뻺����
;;    M-o ����/��ʾ���ִ�Ҫ�ļ���ʹ�������㣬����ǰ׺����������ص��ļ�
;;    $ ����/��ʾ��ǰĿ¼������ 
;;    M-$ ����/��ʾ����������Ŀ¼����
;;    k �����ļ����� g ��������ʾ����
;;    l ˢ�»����ļ�
;;    g ˢ�»��������ļ�
;;    C-/, C-_, C-x u dired ģʽ�� undo
;;    ����
;;    = �Ƚ��ļ�
;;    M-= �ļ��ͱ���֮��Ƚϣ�����ǰ׺��������ʾ���� diff ѡ��
;;    w �����ļ����� kill-ring
;;    Z ѹ��/��ѹ���ļ�
;;    X ���ļ���ִ�� shell ����
;;    B ����(Emacs Lisp)�ļ�
;;    L ����(Emacs Lisp)�ļ�
;;    y �����ļ�������Ϣ (ͨ�� file ����)
;;    P ��ӡ�ļ�
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
;;     'M-. TAG' ������һ�� TAG �Ķ��崦��
;;     'M-*'     �ص���ʼ���� TAG �ĵط�
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
