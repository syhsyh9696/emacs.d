;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(cfs--current-profile "profile1" t)
 '(cfs--profiles-steps (quote (("profile1" . 2))) t)
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
	("eb0a314ac9f75a2bf6ed53563b5d28b563eeba938f8433f6d1db781a47da1366" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-archives
   (quote
	(("gnu" . "http://elpa.emacs-china.org/gnu/")
	 ("melpa" . "http://elpa.emacs-china.org/melpa/")
	 ("popkit" . "http://elpa.popkit.org/packages/")))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add package
(defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		chinese-fonts-setup
		smartparens
		;; --- Major Mode ---

		;; --- Minor Mode ---
		
		;; --- Themes ---
		dracula-theme
		) "Default packages")

(setq package-selected-packages my/packages)

;; Package auto install fucntion
(defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))


;; set the default text coding system
(setq default-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; 关闭备份文件功能
(setq make-backup-files nil)

;; 设置光标的样式
;; setq 和 setq-default 如果不是buffer-local(每一个buffer都有这个值)的话，二者等价
(setq-default cursor-type 'bar)

;; 高亮当前行
(global-hl-line-mode t)

;; highlight matching parenthese 开启括号匹配
(add-hook 'eamcs-lisp-mode-hook 'show-paren-mode)

;; 方便图形界面的菜单中打开最近编辑过的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 设置打开时宽和高和位置
(set-frame-position (selected-frame) 450 100)
(set-frame-width (selected-frame) 120)
(set-frame-height (selected-frame) 33)

;; 设置按F2打开init.el
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; set company extension
(global-company-mode t)
;; always replace tab with 4 space
(setq-default tab-width 4)
;; set different ruby mode
(setq ruby-indent-level 4)

;; turn off tool-bar
;; turn off scroll-bar
;; show linum-mode
(tool-bar-mode -1)
(scroll-bar-mode -1)
(linum-mode t)
(delete-selection-mode t)

;; org-mode 模式下注释语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org-agenda 文件目录
(setq org-agenda-files '("d:/Org"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; 让 chinese-fonts-setup 随着 emacs 自动生效。
;; (chinese-fonts-setup-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
;; (cfs-set-spacemacs-fallback-fonts)
(require 'chinese-fonts-setup)
;; 开启emacs时启动cfs插件
(chinese-fonts-setup-enable)

;; Use hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;; Swiper config (M-x strengthen)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

;; smartparens config
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
