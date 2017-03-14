
;; Set the default text coding system
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; 取消移动到buffer开头结尾声音
(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(global-linum-mode t)

;; 关闭备份文件功能 自动保存功能
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Recentf mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 保持emacs内外部文件相同
(global-auto-composition-mode t)

;; always replace tab with 4 space
(setq-default tab-width 4)

;; Ruby mode configurations(differents)
(setq ruby-indent-level 4)

;; highlight matching parenthese 开启括号匹配
(add-hook 'eamcs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(provide 'init-better-defaults)
