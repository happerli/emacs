(require 'package)

;;------------------------------------------------------------------------------
;; Patch up annoying package.el quirks
;;------------------------------------------------------------------------------
(defadvice package-generate-autoloads (after close-autoloads (name pkg-dir) activate)
  "Stop package.el from leaving open autoload files lying around."
  (let ((path (expand-file-name (concat
                                 ;; name is string when emacs <= 24.3.1,
                                 (if (symbolp name) (symbol-name name) name)
                                 "-autoloads.el") pkg-dir)))
    (with-current-buffer (find-file-existing path)
      (kill-buffer nil))))

;;------------------------------------------------------------------------------
;; Add support to package.el for pre-filtering available packages
;;------------------------------------------------------------------------------
(defvar package-filter-function nil
  "Optional predicate function used to internally filter packages used by package.el.

The function is called with the arguments PACKAGE VERSION ARCHIVE, where
PACKAGE is a symbol, VERSION is a vector as produced by `version-to-list', and
ARCHIVE is the string name of the package archive.")

(defadvice package--add-to-archive-contents
  (around filter-packages (package archive) activate)
  "Add filtering of available packages using `package-filter-function', if non-nil."
  (when (or (null package-filter-function)
      (funcall package-filter-function
         (car package)
         (funcall (if (fboundp 'package-desc-version)
          'package--ac-desc-version
        'package-desc-vers)
            (cdr package))
         archive))
    ad-do-it))

;;------------------------------------------------------------------------------
;; On-demand installation of packages
;;------------------------------------------------------------------------------
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


;;------------------------------------------------------------------------------
;; Standard package repositories
;;------------------------------------------------------------------------------


(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ;; uncomment below line if you need use GNU ELPA
                         ;; ("gnu" . "http://elpa.gnu.org/packages/")
                         ))

;; We include the org repository for completeness, but don't use it.
;; Lock org-mode temporarily:
 (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))

;; Un-comment below line if you download zip file
;; from https://github.com/redguardtoo/myelpa/archive/master.zip
;; and extract its content into ~/myelpa/
;; (setq package-archives '(("myelpa" . "~/projs/myelpa")))

;; Or Un-comment below line if you prefer installing package from https://github.com/redguardtoo/myelpa/ directly
;; (setq package-archives '(("myelpa" . "https://raw.github.com/redguardtoo/myelpa/master/")))

;; List of VISIBLE packages from melpa-unstable (http://melpa.org)
;; Feel free to add more packages!
(defvar melpa-include-packages
  '(color-theme
    web
    idomenu)
  "Don't install any Melpa packages except these packages")

;; Don't take Melpa versions of certain packages
(setq package-filter-function
      (lambda (package version archive)
        (and
         (not (memq package '(eieio)))
         (or (and (string-equal archive "melpa") (memq package melpa-include-packages))
             (not (string-equal archive "melpa")))
         )))

;; un-comment below code if you prefer use all the package on melpa (unstable) without limitation
;; (setq package-filter-function nil)

;;------------------------------------------------------------------------------
;; Fire up package.el and ensure the following packages are installed.
;;------------------------------------------------------------------------------

(package-initialize)

;;(require-package 'org)
(require-package 'window-numbering)
(require-package 'ace-jump-buffer)
(require-package 'highlight-symbol)
(require-package 'ace-jump-mode)
(require-package 'projectile)
(require-package 'magit)
(require-package 'git-gutter)
(require-package 'color-theme)
(require-package 'session)
(require-package 'smex)
(require-package 'ggtags)
(require-package 'helm)
(require-package 'company)
(require-package 'helm-swoop)
;;(require-package 'helm-gtags)
(require-package 'ace-jump-helm-line)
;;use local copy (require-package 'linum-relative)
(require-package 'helm-projectile)
(require-package 'ace-isearch)
(require-package 'ibuffer-vc)
(require-package 'zoom-window)
(require-package 'vlf)
(require-package 'json-mode)
(require-package 'js2-mode)
;;(require-package 'flymake-css)
;;(require-package 'flymake-jslint)
;;(require-package 'tidy)
(require-package 'web-mode)

(provide 'init-elpa)
