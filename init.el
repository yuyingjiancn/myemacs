
;; 解决windows下保存文件编码为utf-8的问题
;; 解决elpy在python文件中输入注释是中文就报error in process sentinel: peculiar error: "exited abnormally with code 1"的问题
;; 解决编辑python文件flake8报UnicodeDecodeError的问题
;; 注意如果文件中不包含中文，保存仍为ANSI，有中文则保存为UTF-8
;; python文件头部设定编码的正确写法 coding: utf-8 的utf-8要小写
(if
    (string-equal system-type "windows-nt")
    (progn
      (prefer-coding-system 'utf-8)
      (set-default-coding-systems 'utf-8)
      (set-language-environment 'utf-8)
      (set-selection-coding-system 'utf-8)))

;; 中文与外文字体设置1
(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s:pixelsize=%d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))
;; 中文与外文字体设置2
(defun set-font-2 (english chinese english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format   "%s %d"  english english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese :size chinese-size))))
(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (progn
    (set-font-2 "Consolas" "Microsoft Yahei" 11 16)
    (message "windows字体设置完毕")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (set-font "文泉驿等宽微米黑" "文泉驿等宽微米黑" 14 16)
    (message "linux字体设置完毕"))))

(tool-bar-mode 0) 
;;(menu-bar-mode 0) 
(scroll-bar-mode 0)
(global-linum-mode 1) ;;显示行号
(setq linum-format "%d.")

(setq make-backup-files nil) ;; 禁止产生备份文件
(setq auto-save-default nil) ;; 禁止产生临时文件

(define-prefix-command 'prefix-command-ctrl-s)
(global-set-key (kbd "C-s") 'prefix-command-ctrl-s)

(setq custom-file "~/.emacs.d/custom.el") ;;custom.el 放到单独的文件中
(load custom-file 'no-error 'no-message)

;; 快速打开配置文件
(defun edit-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
;; 教学演示用设置
(defun reload-init-file ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
;; 教学演示用设置
(defun become-teacher ()
  (interactive)
  (load-file "~/.emacs.d/teacher.el"))

;;-------------------------------------------------------------------------------------------
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" . "http://elpa.emacs-china.org/gnu/"))
(add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/"))
(package-initialize)

;; 安装use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 启用use-package
(eval-when-compile
  (require 'use-package))

;; auto-package-update会自动更新包
(use-package auto-package-update
  :ensure t   ;;如果包没有安装，确保包安装
  :config     ;;当包加载以后执行后面的代码
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init
  (load-theme 'spacemacs-light t))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "coding for fun")
  (setq dashboard-startup-banner "~/.emacs.d/logos/emacs-yu-logo.png"))

(use-package neotree
  :ensure t
  :config
  :bind (([f8] . neotree-toggle)))

;;显示快捷键
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; For current hourly builds, use the MELPA archives.
;; In MELPA, Ivy is split into three packages: ivy, swiper and counsel;
;; you can simply install counsel which will bring in the other two as dependencies.
(use-package counsel
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :bind(("C-s s" . swiper)
	("C-s a" . counsel-ag)
 	("M-x" . counsel-M-x)
	("C-x C-f" . counsel-find-file)))

(use-package company
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'company-mode)
  (bind-key "C-." 'company-complete-common)
  (bind-key "\t" 'company-indent-or-complete-common))

(use-package flycheck
  :ensure t
  :config
  (if (string-equal system-type "gnu/linux") ;;windows下不用太卡了
      (add-hook 'python-mode-hook 'flycheck-mode)))

(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (setq elpy-rpc--backend "jedi")
  (if (string-equal system-type "gnu/linux") ;;linux下用flycheck，所以flymake去掉
      (setq elpy-modules (delq 'elpy-module-flymake elpy-modules)))
  (setq python-shell-interpreter "jupyter"
	python-shell-interpreter-args "console --simple-prompt"
	python-shell-prompt-detect-failure-warning nil)
  (add-to-list 'python-shell-completion-native-disabled-interpreters
               "jupyter"))

;; (use-package anaconda-mode
;;   :ensure t
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

;;(use-package company-anaconda
;;  :ensure t
;;  :after (company)
;;  :config
;;  (add-to-list 'company-backends 'company-anaconda))

;; 装ess的时候如果没这个会报错
(use-package julia-mode
  :ensure t)

(use-package ess
  :ensure t
  :after (julia-mode))

(use-package projectile
  :ensure t)

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :init
  (setq rust-format-on-save t))

(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'rust-mode-hook 'lsp-mode))

(use-package lsp-rust
  :ensure t
  :after lisp-mode
  :config
  (setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
  (add-hook 'rust-mode-hook #'lsp-rust-enable))



;; helm相关的放在后面，否则安装的时候会出错。
;; (use-package helm
;;   :ensure t
;;   :bind
;;   ([remap execute-extended-command] . helm-M-x)
;;   ([remap find-file] . helm-find-files)
;;   ([remap list-buffers] . helm-buffers-list)
;;   ([remap occur] . helm-occur)
;;   ([remap dabbrev-expand] . helm-dabbrev)
;;   :config
;;   (helm-mode 1))

;; (use-package helm-ag
;;   :ensure t
;;   :after (helm))

;; (use-package helm-swoop
;;   :ensure t
;;   :after (helm))
