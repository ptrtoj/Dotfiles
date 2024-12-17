;;; init.el --- Jeon's Personal Emacs Configuration

;;; Commentary:

;;; Code:
;;; Emacs Itself
(use-package emacs
  :custom
  (user-full-name "WooHyoung Jeon")
  (user-mail-address "jeon@ptrtoj.com")
  (use-short-answers t)
  (inhibit-startup-screen t)
  (visible-bell t))

;;; Set up Package Manager
;; Moved 'package-refresh-contents' to 'auto-package-update' config section
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

;; Automatically Update Packages
(use-package auto-package-update
  :ensure t
  :bind
  ("C-c u p" . package-refresh-contents)
  ("C-c u g" . auto-package-update-now-async)
  :custom
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-delete-old-versions t))

;;; Diminish
(use-package diminish
  :ensure t)

;;; Eglot
(use-package eglot
  :hook
  (prog-mode . eglot-ensure))

;;; Flymake
(use-package flymake
  :bind (:map flymake-mode-map
	      ("M-n" . 'flymake-goto-next-error)
	      ("M-p" . 'flymake-goto-prev-error)))

;;; Fix MacOS Shell Path Problem
(use-package exec-path-from-shell
  :ensure t
  :custom
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;; Editor Config
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;;; Which-key
(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode t))

;;; Company
(use-package company
  :ensure t
  :config
  (setq company-tooltip-align-annotations t)
  :hook
  (after-init . global-company-mode))

;;; Magit
(use-package magit
  :ensure t
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;; Vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;;; Orderless
(use-package orderless
  :ensure t
  :custom
  (completion--styles '(oderless basic))
  (completion-category-defaults nil)
  (completion--category-overrides '((file (styles partial-completion)))))

;;; Marginalia
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;;; Prevent Emacs Generating 'custom.el'
(use-package cus-edit
  :custom
  (custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))

;;; Files
(use-package files
  :config
  (setq safe-local-variable-values
  '((eval outline-hide-body)
   (outline-minor-mode-cycle . t)))
  :custom
  ;; Prevent Emacs Generating Backup
  (make-backup-files nil))

;;; Recent Files
(use-package recentf
  ;; 'C-x C-r' was 'find-file-read-only'
  ;; :bind
  ;; ("C-x C-r" . recentf-open-files)
  :config
  (recentf-mode 1))

;;; Remember Recent Command History
(use-package savehist
  :config
  (savehist-mode 1))

;;; Remember Last Cursor Postion from File
(use-package saveplace
  :config
  (save-place-mode 1))

;;; Highlight Current Cursor Line
(use-package hl-line
  :config
  (global-hl-line-mode 1))

;;; Delete Selection as I Type
(use-package delsel
  :config
  (delete-selection-mode 1))

;;; Automatically Match Parenthesis
(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode)
  (org-mode . electric-pair-mode))

;;; [X] Revert Buffer Automatically
;; Dropped. Don't think I *REALLY* need this feature, yet.
;; However, I want to diminish the minor mode section.
;; (use-package autorevert
;;   :diminish (auto-revert-mode)
;; :config
;; (global-auto-revert-mode t))

;;; Clean Whitespaces
(use-package whitespace
  ;; show whitespace with colors
  ;;:custom
  ;;(whitespace-style '(face tabs tab-mark trailing))
  ;;(custom-set-faces '(whitespace-tab ((t (:foreground "#020202")))))
  :hook
  ;;(prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;;; Spellcheck
;; Dependencies for Flyspell
;; - aspell (or hunspell)
;; - And also dictionary files if you chose to use hunspell
;; - '*.aff' && '*.dic' (e.g. 'en_US.aff' and 'en_US.dic')
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

;;; Fonts and Transparent Frames
(use-package faces
  :config
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  ;;(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "BerkeleyMono Nerd Font"))

  ;; fullscreen on startup
  ;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

  ;; or set default width and height
  ;;(add-to-list 'default-frame-alist (cons 'width 120))
  ;;(add-to-list 'default-frame-alist (cons 'height 70))

  ;; transparency
  ;; Emacs 29 introduced below, but doesn't work on Macos.
  ;;(set-frame-parameter nil 'alpha-background 90)
  ;;(add-to-list 'default-frame-alist '(alpha-background . 90))

  ;; Rather this works (the old way).
  (set-frame-parameter (selected-frame) 'alpha '(95 95))
  (add-to-list 'default-frame-alist '(alpha 95 95)))

;; [DOES NOT WORK] Blur the background
;;(set-face-background 'default "mac:windowBackgroundColor")
;;(set-face-stipple 'default "alpha:30%"))

;;; Disable Tool Bar
(use-package tool-bar
  :config
  (tool-bar-mode -1))

;;; Disable Scroll Bar
(use-package scroll-bar
  :config
  (scroll-bar-mode 0))

;;; Show Line Numbers
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

;; [X] Show Column Number
;; (use-package simple
;;   :config
;;   (column-number-mode 1))

;;; Show Max Column Indicator
(use-package display-fill-column-indicator
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (org-mode . display-fill-column-indicator-mode))

;;; Show URLs as a Clickable Link
(use-package goto-addr
  :hook
  (prog-mode . goto-address-prog-mode)
  (text-mode . goto-address-prog-mode))

;;; Treesitter
(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode t))

(use-package tree-sitter-langs
  :ensure t)

;;; Window Movement - Ace Window
(use-package ace-window
  :ensure t
  :bind
  ("M-o" . ace-window))

;;; Color Theme
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin t)
  (setq catppuccin-flavor 'latte)
  (catppuccin-reload))

;;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :bind
  ("C-x t T" . treemacs-select-directory)
  :config
  (treemacs-fringe-indicator-mode 'always)
  (when treemacs-python-executable
    (treemacs-git-commit-diff-mode t))

  (pcase (cons (not (null (executable-find "git")))
	       (not (null treemacs-python-executable)))
	       (`(t . t)
		(treemacs-git-mode 'deferred))
	       (`(t . _)
		(treemacs-git-mode 'simple))))

;;; Nerd Icons
(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "BerkeleyMono Nerd Font"))

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package treemacs-nerd-icons
  :ensure t
  :config
  (treemacs-load-theme "nerd-icons"))

;;; Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 20)))
  (setq dashboard-display-icons-p t)
  (setq dashboard-icon-type 'nerd-icons))

;; Local Variables:
;; outline-minor-mode-cycle: t
;; outline-regexp: ";;; "
;; eval: (outline-minor-mode)
;; eval: (outline-hide-body)
;; End:
;;; init.el ends here
