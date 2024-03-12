;;; Jeon's Extreme Minimal Alt Ctrl Shift

;;; Remove Custom Section
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;;; Defaults
(use-package emacs
  :custom
  (user-full-name "WooHyung Jeon")
  (user-mail-address "jeon@ptrtoj.com")
  (visible-bell t)
  (inhibit-startup-screen t)
  (inhibit-startup-message t)
  (inhibit-startup-echo-area-message t)
  (initial-major-mode 'fundamental-mode)
  (defalias 'yes-or-no-p 'y-or-n-p))

;;; Use Package
;; (require 'use-package)
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-delete-old-versions t)
  :bind
  ("C-c p" . auto-package-update-now))

;;; UI
(use-package tool-bar
  :config
  (tool-bar-mode -1))

(use-package tooltip
  :config
  (tooltip-mode -1))

(use-package menu-bar
  :config
  (menu-bar-mode -1))

(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)
  (display-line-numbers-width-start t)
  :config
  (global-display-line-numbers-mode 1)
  (dolist (mode '(term-mode-hook
		  shell-mode-hook
		  eshell-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode -1)))))

(use-package display-fill-column-indicator
  :config
  ;;(set-face-background 'fill-column-indicator "#ffff00")
  (global-display-fill-column-indicator-mode 1))

(use-package hl-line
  :config
  (global-hl-line-mode 1))

;;; Theme
(use-package custom
  :config
  ;;(load-theme 'modus-operandi t)
  (load-theme 'modus-vivendi t))

;;; Fonts
(use-package faces
  :config
  ;;(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  ;;(set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "Berkeley Mono")))

(use-package whitespace
  :hook
  (before-save . whitespace-cleanup))

(use-package simple
  :config
  (column-number-mode 1)
  :hook
  (before-save . delete-trailing-whitespace))

(use-package files
  :custom
  (make-backup-files nil))

(use-package recentf
  :config
  (recentf-mode 1)
  :bind
  ("C-x C-r" . recentf-open-files))

(use-package autorevert
  :custom
  (global-auto-revert-non-file-buffers t))

(use-package savehist
  :config
  (savehist-mode 1))

(use-package delsel
  :config
  (delete-selection-mode 1))

(use-package ido
  :custom
  (ido-enable-flex-matching t)
  (ido-everywhere t)
  :config
  (ido-mode 1))

(use-package bind-keys
  :bind
  ;; Changed the same keybinding to 'auto-package-update-now'
  ;; See, 'auto-package-update' section
  ;;("C-c p" . package-refresh-contents)
  ("C-c k" . describe-personal-keybindings))

(use-package eglot
  :hook
  (prog-mode . eglot-ensure))

(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode)
  (org-mode . electric-pair-mode))

(use-package subword
  :config
  (global-superword-mode 1))

(use-package cc-vars
  :custom
  (c-default-style "k&r")
  (c-basic-offset 4)
  :hook
  (c-mode . (lambda () (local-set-key (kbd "C-c C-c") 'compile))))

(use-package eldoc
  :diminish
  :hook
  (emacs-lisp-mode . turn-on-eldoc-mode))

(use-package abbrev
  :diminish)

;; (use-package company
;;   :ensure t
;;   :diminish
;;   :hook
;;   (prog-mode . company-mode)
;;   (org-mode . company-mode))

;;; 3rd Party Packages
(use-package diminish
  :ensure t)

(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode 1))

(use-package indent-guide
  :ensure t
  :diminish
  :custom
  (indent-guide-char " ")
  :config
  (set-face-background 'indent-guide-face "#F0F0F0")
  (indent-guide-global-mode 1))

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))
