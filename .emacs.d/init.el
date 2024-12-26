;;; init.el --- for Emacs -*- lexical-binding: t -*-

;;; Commentary:

;; Jeon's Personal & Minimal Emacs Config

;; TODO:
;; - Decide to include or not, if yes, then where
;;   - Encoding: UTF-8
;;   - no-byte-compile: t

;; Useful Links:
;; - Thomas Ingram's 'My Emacs Config': https://taingram.org/init.html
;; - Purcell's 'A reasonable Emacs config': https://github.com/purcell/emacs.d

;;; Defaults:
;; Prepare Emacs
(use-package emacs
  :custom
  (user-full-name "WooHyoung Jeon")
  (user-mail-address "jeon@ptrtoj.com")		; from 'startup.el'
  (inhibit-startup-screen 1)			; from 'startup.el'
  (use-short-answers 1)				; 'help' page recommends not setting this to 't'
  (visible-bell 1))

;; Prevent Emacs Generating 'custom.el'
(use-package cus-edit
  :custom
  (custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))

;; Prepare Package Manager
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

(use-package auto-package-update
  :ensure t
  :bind
  ("C-c u p" . package-refresh-contents)	; provided from 'package' itself
  ("C-c u g" . auto-package-update-now-async)	; provided from 'auto-package-update' package
  :custom
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-delete-old-versions t))
;; Diminish
(use-package diminish
  :ensure t)

;; Fix MacOS Shell Path Problem
(use-package exec-path-from-shell
  :ensure t
  :custom
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;; Editing:
;; Recent Files
(use-package recentf
  :bind
  ("C-x C-r" . recentf-open-files)		; 'C-x C-r' was 'find-file-read-only'
  :config
  (recentf-mode 1))

;; Remember Recent Command History
(use-package savehist
  :config
  (savehist-mode 1))

;; Remember Last Cursor Postion from File
(use-package saveplace
  :config
  (save-place-mode 1))

;; Automatically Match Parenthesis
(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode))

;; Delete Selection as I Type
(use-package delsel
  :config
  (delete-selection-mode 1))

;; Clean Whitespaces
(use-package whitespace
  ;; show whitespace with colors
  ;;:custom
  ;;(whitespace-style '(face tabs tab-mark trailing))
  ;;(custom-set-faces '(whitespace-tab ((t (:foreground "#020202")))))
  :hook
  ;;(prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;; Files
(use-package files
  :config
  (setq safe-local-variable-values
	'((eval outline-hide-body)
	  (outline-minor-mode-cycle . t))))
  ;;:custom
  ;; Prevent Emacs Generating Backup
  ;;(make-backup-files nil))

;; Revert Buffer Automatically
(use-package autorevert
  :diminish (auto-revert-mode)
  :config
  (global-auto-revert-mode t))

;; Eglot
(use-package eglot
  :hook
  (prog-mode . eglot-ensure))

;; Flymake
(use-package flymake
  :bind (:map flymake-mode-map
	      ("M-n" . 'flymake-goto-next-error)
	      ("M-p" . 'flymake-goto-prev-error)))

;; Git
(use-package magit
  :ensure t
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; Spellcheck
;; Dependencies for Flyspell
;; - aspell (or hunspell)
;; - And also dictionary files if you chose to use hunspell
;; - ';;.aff' && ';;.dic' (e.g. 'en_US.aff' and 'en_US.dic')
;;
;; Dictionary files should be placed in '/USER_HOME_DIR/Library/Spelling/' or '/Library/Spelling/'.
;;
;; Homebrew itself doesn't provide dictionaries for spell-checkers
;; but you can download compatible dictionaries from other sources,
;; such as, from here (https://cgit.freedesktop.org/libreoffice/dictionaries/tree/).
;;
;;   $ cd ~/Library/Spelling/
;;   $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.aff
;;   $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.dic
(use-package flyspell
  :diminish
  ;;:config
  ;;(setq ispell-program-name "hunspell")
  ;;(setq ispell-local-dictionary "en_US")
  :hook
  (find-file . flyspell-buffer)
  (text-mode . flyspell-mode)
  ;;(org-mode . flyspell-prog-mode))
  (prog-mode . flyspell-prog-mode))

;;; UI Related:
;; Remove tool-bar
(use-package tool-bar
  :config
  (tool-bar-mode 0))

;; Remove scroll-bar
(use-package scroll-bar
  :config
  (scroll-bar-mode 0))

;; Highlight Current Cursor Line
(use-package hl-line
  :config
  (global-hl-line-mode 1))

;; Show Max Column Indicator
(use-package display-fill-column-indicator
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (org-mode . display-fill-column-indicator-mode))

;; Show Line Numbers
(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)

  ;; prevent right shift when carry occurs (90->100)
  (display-line-numbers-width-start t)

  :hook
  (prog-mode . display-line-numbers-mode)
  ;;(markdown-mode . display-line-numbers-mode)

  ;; org-mode should be explicitly enabled
  ;; prog-mode doesn't enable org-mode in this mode
  (org-mode . display-line-numbers-mode))

;; Show Column Number
(use-package simple
  :config
  (column-number-mode 1))

;; Fonts and Transparent Frames
(use-package faces
  :config
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "Berkeley Mono"))

  ;; Fullscreen on Startup
  ;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

  ;; or set default width and height
  ;;(add-to-list 'default-frame-alist (cons 'width 120))
  ;;(add-to-list 'default-frame-alist (cons 'height 70))

  ;; Transparency
  ;; Emacs 29 introduced below, but doesn't work on Macos.
  ;;(set-frame-parameter nil 'alpha-background 90)
  ;;(add-to-list 'default-frame-alist '(alpha-background . 90))

  ;; Rather this works (the old way).
  (set-frame-parameter (selected-frame) 'alpha '(95 95))
  (add-to-list 'default-frame-alist '(alpha 95 95)))

;; Color Theme
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin t)
  (setq catppuccin-flavor 'latte)
  (catppuccin-reload))

;; Show URLs as a Clickable Link
(use-package goto-addr
  :hook
  (prog-mode . goto-address-prog-mode)
  (text-mode . goto-address-prog-mode))

;; Which-key
(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode t))

;; Vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Orderless
(use-package orderless
  :ensure t
  :custom
  (completion--styles '(oderless basic))
  (completion-category-defaults nil)
  (completion--category-overrides '((file (styles partial-completion)))))

;; Marginalia
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;;; init.el ends here
