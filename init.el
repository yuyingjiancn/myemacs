(setq inhibit-startup-message t);;关闭启动画面
(setq make-backup-files nil);;设置无备份
(global-linum-mode t);;显示行号
(show-paren-mode t);;括号匹配显示
(display-time);;显示时间
(load-theme 'wombat t)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(defvar my-packages '(;;------tabbar-------------
		      tabbar
		      tabbar-ruler
		      ;;------yasnippet----------
		      yasnippet
		      yasnippet-bundle
		      ;;------auto-complete------
		      auto-complete
		      ;;------彩虹括号------------
		      rainbow-delimiters
		      ;;------paredit------------
		      paredit
		      ;;------clojure------------
		      clojure-mode
                      clojure-test-mode
                      nrepl
		      ac-nrepl
		      ;;------js2-mode----------
		      js2-mode
		      ;;------scss-mode---------
		      scss-mode
		      ;;------rainbow-mode------
		      rainbow-mode
		      ;;------zencoding---------
		      zencoding-mode))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
;;(add-to-list 'load-path "~/.emacs.d/elpa/tabbar-2.0.1")
(load-file "~/.emacs.d/elpa/tabbar-ruler-0.27/tabbar-ruler.el")
(setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
(setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
(setq tabbar-ruler-popup-menu 't) ; If you want a popup menu.
(setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar

;;auto-complete config
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode 1);;开启auto-complete
(setq ac-auto-start nil);;禁用自动补全
(ac-set-trigger-key "<C-return>");;用Ctrl-Enter来触发自动补全

;;config-4-clojure
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode);;在clojure中启用彩虹括号

;;nxhtml
;;下面两行是为了防止emacs 24 nxhtml的很多warning
(eval-after-load "bytecomp"  
  '(add-to-list 'byte-compile-not-obsolete-vars  
                'font-lock-beginning-of-syntax-function))  
(eval-after-load "bytecomp"  
  '(add-to-list 'byte-compile-not-obsolete-vars  
		'font-lock-syntactic-keywords))
;;加载nxtml  
(load "~/.emacs.d/my_packages/nxhtml/autostart.el")
(setq
 mumamo-background-colors nil
 nxhtml-global-minor-mode t
 mumamo-chunk-coloring 'submode-colored
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . eruby-nxhtml-mumamo-mode));;erb nxhtml mode
(add-hook 'nxhtml-mode-hook 'zencoding-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; 
(defun all-css-modes() (css-mode) (rainbow-mode))
(defun all-scss-mode() (scss-mode) (rainbow-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . all-css-modes)) 
(add-to-list 'auto-mode-alist '("\\.scss$" . all-scss-modes))

