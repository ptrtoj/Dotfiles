;;; init.el --- Jeon's Extremely Minimal ALT + CTRL + SHIFT -*- lexical-binding: t -*-

;;; Commentary:

;; Personal Reminders:
;; - Check 'describe-personal-keybindings' time to time.

;; Helpful references:
;; - Purcell's emacs configuration, https://github.com/purcell/emacs.d
;; - Riastradh's Lisp Style Rules, https://mumble.net/~campbell/scheme/style.txt
;; - hrs' emacs configuration, https://github.com/hrs/dotfiles/blob/main/emacs/.config/emacs/configuration.org
;; - "My Emacs Init" by T. Ingram", https://taingram.org/init.html

;;; Code:
;; Defaults
(use-package emacs
  :custom
  (user-full-name "Ido Jeon")
  (user-mail-address "jeon@ptrtoj.com") ; from 'startup.el'
  (inhibit-startup-screen 1)		; from 'startup.el'
  (use-short-answers 1)		; 'help' page recommends not setting this to 't'
  (visible-bell 1)
  :bind
  ("C-c e" . (lambda () (interactive) (find-file user-init-file))))

;; Remove Toolbar
(use-package tool-bar
  :config
  (tool-bar-mode 0))

;; Prevent Generating Custom Section in this File
(use-package cus-edit
  :custom
  (custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))

;; Show URLs as a Clickable Link
(use-package goto-addr
  :hook
  (prog-mode . goto-address-prog-mode)
  (text-mode . goto-address-prog-mode))

;; Remove Scrollbar
(use-package scroll-bar
  :config
  (scroll-bar-mode 0))

;; Show Line Numbers
(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)
  (display-line-numbers-width-start t)   ; prevent right shift when carry occurs (90->100)
  :hook
  (prog-mode . display-line-numbers-mode))

;; Increase Frings
(use-package fringe
  :config
  (set-fringe-mode 10))

;; Show Highlight Line
(use-package hl-line
  :config
  (global-hl-line-mode 1))

;; Fill 80 Characters column Line
(use-package display-fill-column-indicator
  :config
  (setq display-fill-column-indicator-column 80)
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (org-mode . display-fill-column-indicator-mode))

;; Recent Files
(use-package recentf
  :bind
  ;; 'C-x C-r' was 'find-file-read-only'
  ("C-x C-r" . recentf-open-files)
  :config
  (recentf-mode 1))

;; Remove Whitespace
(use-package whitespace
  :diminish
  :custom
  (whitespace-style '(face tabs space-before-tab indentation empty space-after-tab tab-mark missing-newline-at-eof))
  ;;(custom-set-faces '(whitespace-tab ((t (:foreground "#020202")))))
  :hook
  (prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;; Save History
(use-package savehist
  :config
  (savehist-mode 1))

;; Save Place
(use-package saveplace
  :config
  (save-place-mode 1))

;; Delete as I Type
(use-package delsel
  :config
  (delete-selection-mode 1))

;; Match Parens
(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode))

;; Eglot
(use-package eglot
  :hook
  (prog-mode . eglot-ensure))

;; Flymake
(use-package flymake
  :bind (:map flymake-mode-map
		("M-n" . 'flymake-goto-next-error)
		("M-p" . 'flymake-goto-prev-error)))

;; Which Key (Github: https://github.com/justbur/emacs-which-key )
(use-package which-key
  :diminish
  :config
  (which-key-mode t))

;; Colortheme
(use-package custom
  :config
  (load-theme 'modus-operandi))

;; Package Manager
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
;; maybe redundant, works well without below
;;	(package-initialize)
;;	(unless package-archive-contents
;;	  (package-refresh-contents)))

;; Hide a few minor modes
(use-package diminish
  :ensure t)

;; Fix MacOS Shell Path (Github: https://github.com/purcell/exec-path-from-shell )
(use-package exec-path-from-shell
  :ensure t
  :custom
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; Treesitter
(use-package tree-sitter
  :ensure t
  :diminish
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :ensure t)

;; Eldoc & Box (Github: https://github.com/casouri/eldoc-box )
(use-package eldoc
  :diminish)

(use-package eldoc-box
  :ensure t)
;; Switching to triger 'eldoc-box-help-at-point' as needed.
;; TODO: bind a key
;; BTW, 'M-x e-he' will bring the same function
;;:config
;;(add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-at-point-mode 1)
;;(add-hook 'elisp-mode-hook #'eldoc-box-hover-at-point-mode 1))

;; Vertico (Github: https://github.com/minad/vertico )
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;; Marginalia (Github: https://github.com/minad/marginalia )
(use-package marginalia
   :ensure t
   :init
   (marginalia-mode))

;;  Autocomplete in Point (Corfu: Github: https://github.com/minad/corfu )
(use-package corfu
  :ensure t
  :config
  (setq corfu-auto 1)
  :init
  (global-corfu-mode))

;; Orderless (Github: https://github.com/oantolin/orderless )
(use-package orderless
  :ensure t
  :custom
  (completion--styles '(oderless basic))
  (completion-category-defaults nil)
  (completion--category-overrides '((file (styles partial-completion)))))

;; Magit (Webpage: https://magit.vc )
(use-package magit
  :ensure t
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; DANGER AREA (Curretnly, not using these) ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fonts
;;   (use-package faces
;;     :config
;;     (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
;;     (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
;;     (add-to-list 'default-frame-alist '(font . "Berkeley Mono"))

;;     ;; Fullscreen on Startup
;;     ;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

;;     ;; or set default width and height
;;     (add-to-list 'default-frame-alist (cons 'width 170))
;;     (add-to-list 'default-frame-alist (cons 'height 90))

;;     ;; Transparency
;;     ;; Emacs 29 introduced below, but doesn't work on Macos.
;;     ;;(set-frame-parameter nil 'alpha-background 90)
;;     ;;(add-to-list 'default-frame-alist '(alpha-background . 90))

;;     ;; Rather this works (the old way).
;;     (set-frame-parameter (selected-frame) 'alpha '(95 95))
;;     (add-to-list 'default-frame-alist '(alpha 95 95)))

;; Auto Update (Github: https://github.com/rranelli/auto-package-update.el )
;; (use-package auto-package-update
;;   :ensure t
;;   :bind
;;   ("C-c u p" . package-refresh-contents)		; provided from 'package' itself
;;   ("C-c u g" . auto-package-update-now-async)	; provided from 'auto-package-update' package
;;   :custom
;;   (setq auto-package-update-interval 15)
;;   (setq auto-package-update-prompt-before-update t)
;;   (setq auto-package-update-delete-old-versions t))

;; Orgmode Auto Tangle on Save (Github: https://github.com/yilkalargaw/org-auto-tangle )
;; (use-package org-auto-tangle
;;   :ensure t
;;   :after org
;;   :hook (org-mode . org-auto-tangle-mode))

;; Color Theme (Github: https://github.com/catppuccin/emacs )
;; (use-package catppuccin-theme
;;   :ensure t
;;   :config
;;   (load-theme 'catppuccin t)
;;   ;; (setq catppuccin-flavor 'latte)	; light-theme
;;   ;; (setq catppuccin-flavor 'mocha)
;;   ;; (setq catppuccin-flavor 'macchiato)
;;   (setq catppuccin-flavor 'frappe)
;;   (catppuccin-reload))

;; Files
;; (use-package files
;;	:config
;;	(setq safe-local-variable-values
;;		'((eval outline-hide-body)
;;		  (outline-minor-mode-cycle . t))))
;;:custom
;; Prevent Emacs Generating Backup
;;(make-backup-files nil))

;; Spellcheck
;; Dependencies
;; Basically, ~use-package-ensure-system-package~ should handle this(currently disabled),
;; but always check if the dependencies are correctly installed or not.

;;    - ~aspell~ (or ~hunspell~)
;;    - And dictionary files, such as ~.aff~ & ~.dic~ (e.g. ~en_US.aff~ and ~en_US.dic~)
;; Dictionary files should be placed in ~/USER_HOME_DIR/Library/Spelling/~ or ~/Library/Spelling/~.
;; However, ~homebrew~ itself doesn't provide dictionaries for spell-checkers,
;; so you have to download compatible dictionaries from other sources,
;; such as, https://cgit.freedesktop.org/libreoffice/dictionaries/tree/
;;
;; Code Example: download '*.aff' & '*.dic'
;;
;; $ cd ~/Library/Spelling/
;; $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.aff
;; $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.dic
;; (use-package flyspell
;;	:diminish
;;	;;:config
;;	;;(setq ispell-program-name "hunspell")
;;	;;(setq ispell-local-dictionary "en_US")
;;	:hook
;;	(emacs-lisp-mode . (lambda () (flyspell-prog-mode) (flyspell-buffer)))
;;	(prog-mode . flyspell-prog-mode)
;;	(text-mode . flyspell-buffer))

;; Prettify symbols
;; (use-package prog-mode
;;	:config
;;	(global-prettify-symbols-mode 1)
;;	(setq prettify-symbols-alist '(("lambda" . 955) ; λ
;;								 ("->" . 8594)    ; →
;;								 ("=>" . 8658)    ; ⇒
;;								 ("map" . 8614)   ; ↦
;;								 )))

;; Personal Helper Functions
;; (Defun libj/ui ()
;;	"Uncomment region and indent"
;;	(interactive)
;;	(when (use-region-p)
;;	(uncomment-region (region-beginning) (region-end))
;;	(indent-region (region-beginning) (region-end))))

;; (defun libj/uic ()
;;	"Apply libj/ui and comment again"
;;	(interactive)
;;	(when (use-region-p))
;;	(libj/ui)
;;	(comment-region (region-beginning) (region-end)))

;;  Show Column Number
;; (use-package simple
;;	:config
;;	(column-number-mode 1))

;;  Revert Buffer Automatically
;; (use-package autorevert
;;	:diminish (auto-revert-mode)
;;	:config
;;	(global-auto-revert-mode t))

;; Also, there are
;; - Try, https://github.com/larstvei/Try
;; - Ensure System Package, https://github.com/waymondo/use-package-ensure-system-package
;; - Helpful, https://github.com/Wilfred/helpful
;; - Benchmark Init Time, https://github.com/dholm/benchmark-init-el

;; 'outline-regexp' enables only showing 2 levels of headings.
;; (See this stack overflow answer - https://emacs.stackexchange.com/q/60420/40897)

;;; init.el ends here
