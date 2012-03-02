(tool-bar-mode nil);;去掉工具栏
(scroll-bar-mode nil);;去掉滚动条

;;显示行号
(require 'linum)
(global-linum-mode t)

;;字体Mono 大小12pt
(custom-set-faces '(default((t (:height 120 :family "DejaVu Sans Mono")))))

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

(custom-set-variables
 '(warning-minimum-level :error);;解决nxhtml erb的warn问题
 '(ecb-layout-name "left14")
 '(ecb-layout-window-sizes (quote (("left14" (0.2564102564102564 . 0.6949152542372882) (0.2564102564102564 . 0.23728813559322035)))))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("/home/yyj/1store/projects/demo" "demo"))))
 '(ecb-tip-of-the-day nil)
 '(ecb-tree-buffer-style (quote ascii-guides)))

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
(add-to-list 'auto-mode-alist '(".html.erb$" . eruby-nxhtml-mumamo-mode))
(yas/define-snippets 'nxhtml-mode nil 'html-mode)

(add-to-list 'load-path "~emacs.d/zencoding")
(require 'zencoding-mode)
(add-hook 'sqml-mode-hock 'zencoding-mode)


;;buffer上下翻动快捷键
(global-set-key "\M-p" 'bs-cycle-previous);;上一个buffer
(global-set-key "\M-n" 'bs-cycle-next);;下一个buffer