;; Org-mode 模式下注释语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org-agenda 文件目录
(setq org-agenda-files '("d:/Org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
