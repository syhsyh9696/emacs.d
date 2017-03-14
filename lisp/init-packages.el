;; cl - Common Lisp Extension
(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("gnu" . "http://elpa.emacs-china.org/gnu/") t)
  (add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
  (add-to-list 'package-archives '("popkit" . "http://elpa.popkit.org/packages/") t))

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
		popwin
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


;; Set company extension
(global-company-mode t)

;; Use hungry-delete mode
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 让 chinese-fonts-setup 随着 emacs 自动生效。
;; (chinese-fonts-setup-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
;; (cfs-set-spacemacs-fallback-fonts)
(require 'chinese-fonts-setup)
;; 开启emacs时启动cfs插件
(chinese-fonts-setup-enable)

;; Swiper config (M-x strengthen)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; Theme setting
(load-theme 'dracula t)

;; popwin mode setup
(require 'popwin)
(popwin-mode t)

;; smartparens config
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(provide 'init-packages) 
