;;(menu-bar-mode nil);;去掉菜单栏
(tool-bar-mode nil);;去掉工具栏
(scroll-bar-mode nil);;去掉滚动条

;;显示行号
(require 'linum)
(global-linum-mode t)

;;字体Mono 大小14pt
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :family "DejaVu Sans Mono")))))

;LANG  
(set-language-environment 'Chinese-GB)  
(set-keyboard-coding-system 'utf-8)  
(set-clipboard-coding-system 'utf-8)  
(set-terminal-coding-system 'utf-8)  
(set-buffer-file-coding-system 'utf-8)  
(set-default-coding-systems 'utf-8)  
(set-selection-coding-system 'utf-8)  
(modify-coding-system-alist 'process "*" 'utf-8)  
(setq default-process-coding-system '(utf-8 . utf-8))  
(setq-default pathname-coding-system 'utf-8)  
(set-file-name-coding-system 'utf-8)

(add-to-list 'load-path
	     "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-comidia)

(load-file "~/.emacs.d/plugins/cedet-1.0.1/common/cedet.el")
(global-ede-mode 1);Enable the Project management system
(semantic-load-enable-code-helpers);Enable prototype help and smart completion
(global-srecode-minor-mode 1);Enable template insertion menu

(add-to-list 'load-path
	     "~/.emacs.d/plugins/ecb-2.40")
(load-file "~/.emacs.d/plugins/ecb-2.40/ecb.el")
(global-set-key "\C-cd" 'ecb-goto-window-directories)
(global-set-key "\C-c1" 'ecb-goto-window-edit1)
(global-set-key "\C-c2" 'ecb-goto-window-edit2)
(global-set-key "\C-h" 'ecb-goto-window-history)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-name "left14")
 '(ecb-layout-window-sizes (quote (("left14" (0.2564102564102564 . 0.6949152542372882) (0.2564102564102564 . 0.23728813559322035)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("/home/yyj/store0/projects/headshot" "headshot"))))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style (quote ascii-guides))
 '(warning-minimum-level :error))

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(setq yas/snippet-dirs '("~/.emacs.d/snippets" "~/.emacs.d/plugins/yasnippet/extras/imported"))
(yas/global-mode 1)

;;加载auto-complete开始
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3.1/ac-dict")
(ac-config-default)

;;tabbar
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
(require 'tabbar)
(tabbar-mode 1)
(set-face-attribute 'tabbar-default nil
:family "DejaVu Sans Mono")
(set-face-attribute 'tabbar-unselected nil
:foreground "white" :background "DarkGreen")
(set-face-attribute 'tabbar-selected nil
:foreground "DarkGreen" :background "LightGoldenrod")

;;yaml-mode
(add-to-list 'load-path "~/.emacs.d/plugins/yaml-mode")
;;.yml后缀文件的自动加载yaml-mode
(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; nxhtml (HTML ERB template support)
(load "~/.emacs.d/plugins/nxhtml/autostart.el")
(setq
 mumamo-background-colors nil
 nxhtml-global-minor-mode t
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))
(yas/define-snippets 'nxhtml-mode nil 'html-mode)

;; MuMaMo-Mode for rhtml files
(add-to-list 'load-path "~/.emacs.d/plugins/nxhtml/util")
(require 'mumamo-fun)
(setq mumamo-chunk-coloring 'submode-colored)
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . eruby-html-mumamo))
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-html-mumamo))

(add-to-list 'load-path "~emacs.d/zencoding")
(require 'zencoding-mode)
(add-hook 'nxhtml-mode-hook 'zencoding-mode)

;;快捷键
(global-set-key "\C-c\C-c" 'clipboard-kill-ring-save);;复制
(global-set-key "\C-c\C-v" 'clipboard-yank);;粘贴

(global-set-key "\C-z" 'undo);;撤销

;;多窗口跳转 按下 Ctrl+c 后 跟相应的 字母键
(global-set-key (kbd "M-<left>") 'windmove-left );;跳转到左面的窗口
(global-set-key (kbd "M-<right>") 'windmove-right );;跳转到右面的窗口
(global-set-key (kbd "M-<top>") 'windmove-up );;跳转到上面的窗口
(global-set-key (kbd "M-<down>") 'windmove-down );;跳转到下面的窗口

(global-set-key "\C-x\C-b" 'ibuffer);;用ibuffer替换原来的buffer选择窗口好看些

(global-set-key "\C-cg" 'goto-line);;跳转到第 行

(global-set-key (kbd "<f12>") 'ecb-activate);;打开ecb

(setq rsense-home "/home/yyj/store0/soft/rsense-0.3")
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)

;; Complete by C-c .
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-/") 'ac-complete-rsense)))

(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/plugins/rinari")
(require 'rinari)

;;(require 'ruby-electric-brace)
;;(add-hook 'ruby-mode-hook 'ruby-electric-mode)

;;不生成备份文件
(setq make-backup-files t)
