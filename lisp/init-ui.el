;; Turn off tool-bar scroll-
;; show linum-mode
(tool-bar-mode -1)
(scroll-bar-mode -1)
(linum-mode t)
(delete-selection-mode t)

(setq inigit-splash-screen t)

;; 设置光标的样式
;; setq 和 setq-default
;; 如果不是buffer-local(每一个buffer都有这个值)的话，二者等价
(setq-default cursor-type 'bar)

;; 高亮当前行
(global-hl-line-mode t)

;; 设置打开时宽和高和位置
(set-frame-position (selected-frame) 450 100)
(set-frame-width (selected-frame) 120)
(set-frame-height (selected-frame) 33)

(provide 'init-ui)
