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
    (set-font-2 "Consolas" "Microsoft Yahei" 26 30)
    (message "windows字体设置完毕")))
 ((string-equal system-type "gnu/linux") ; linux
  (progn
    (set-font "文泉驿等宽微米黑" "文泉驿等宽微米黑" 14 16)
    (message "linux字体设置完毕"))))
