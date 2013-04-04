(global-linum-mode t);;显示行号
(show-paren-mode t);;括号匹配显示
(load-theme 'wombat t)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(defvar my-packages '(;;------tabbar------
		      tabbar
		      tabbar-ruler
		      ;;------yasnippet---
		      yasnippet
		      yasnippet-bundle
		      ;;------auto-complete
		      auto-complete
		      ;;------clojure-----
		      clojure-mode
                      clojure-test-mode
                      nrepl
		      ac-nrepl
		      ;;------paredit-----
		      paredit))
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
;;(setq ac-auto-start nil);;禁用自动补全
;;(ac-set-trigger-key "<C-return>");;用Ctrl-Enter来触发自动补全

;;config-4-clojure
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)

(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

