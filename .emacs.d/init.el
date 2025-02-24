;;; init.el --- Jeon's Extremely Minimal ALT + CTRL + SHIFT -*- lexical-binding: t -*-

;;; Commentary:
;;;; Outlining 'init.el' file
;; 'outline-regexp' enables only showing 2 levels of headings.
;; (See this stack overflow answer - https://emacs.stackexchange.com/q/60420/40897)
;;
;; Code Example: Paste below at the end of this file
;;
;; Local Variables:
;; outline-minor-mode-cycle: t
;; outline-regexp: ";\\{3,4\\} "
;; eval: (outline-minor-mode)
;; eval: (outline-hide-body)
;; End:

;;;; Dependencies
;; Basically, ~use-package-ensure-system-package~ should handle this(currently disabled),
;; but always check if the dependencies are correctly installed or not.

;; 1. for ~flyspell~
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

;;;; References
;; 1. Purcell's emacs configuration, https://github.com/purcell/emacs.d
;; 2. Riastradh's Lisp Style Rules, https://mumble.net/~campbell/scheme/style.txt
;; 2. hrs' emacs configuration, https://github.com/hrs/dotfiles/blob/main/emacs/.config/emacs/configuration.org
;; 3. "My Emacs Init" by T. Ingram", https://taingram.org/init.html

;;;; To Dos
;; 1. Markdown-mode
;; 2. Ligatures

;;; Code:
;;;; Emacs itself
(use-package emacs
  :custom
  (user-full-name "I Do Jeon")
  (user-mail-address "jeon@ptrtoj.com")	; from 'startup.el'
  (inhibit-startup-screen 1)			; from 'startup.el'
  (use-short-answers 1)					; 'help' page recommends not setting this to 't'
  (visible-bell 1)
  (tab-width 4)
  (c-basic-offset 4))
;; Check 'describe-personal-keybindings' time to time, it shows,
;; commentary at the rightmost column like "was `this function`" for personally adapted keymap.

;; Also, one can bind a keymap to go straight to the 'inti.el' file with below.
;; (Always check the correct parenthesis, before adding again** below should be included as
;; part of above code block, if you choose to use below.
;; Same in other parts of this file.)
;;
;; Code Example: bind 'C-c e' to open 'init.el'
;;
;;   :bind
;;   ("C-c e" . (lambda () (interactive) (find-file user-init-file)))

;;;; Prevent Emacs from Generating 'custom.el'
(use-package cus-edit
  :custom
  (custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
	(load custom-file)))

;;;; Remember Recent Command History
(use-package savehist
  :config
  (savehist-mode 1))

;;;; Remember Last Cursor Postion from File
(use-package saveplace
  :config
  (save-place-mode 1))

;;;; Show URLs as a Clickable Link
(use-package goto-addr
  :hook
  (prog-mode . goto-address-prog-mode)
  (text-mode . goto-address-prog-mode))

;;;; Show Max Column Indicator
(use-package display-fill-column-indicator
  :config
  (setq display-fill-column-indicator-column 80)
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (org-mode . display-fill-column-indicator-mode))

;;;; Highlight Current Line
(use-package hl-line
  :config
  (global-hl-line-mode 1))

;;;; Files
(use-package files
  :config
  (setq safe-local-variable-values
		'((eval outline-hide-body)
		  (outline-minor-mode-cycle . t))))
;;:custom
;; Prevent Emacs Generating Backup
;;(make-backup-files nil))

;;;; Automatically Match Parenthesis
(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode))

;;;; Spellcheck
(use-package flyspell
  :diminish
  ;;:config
  ;;(setq ispell-program-name "hunspell")
  ;;(setq ispell-local-dictionary "en_US")
  :hook
  (emacs-lisp-mode . (lambda () (flyspell-prog-mode) (flyspell-buffer)))
  (prog-mode . flyspell-prog-mode)
  (text-mode . flyspell-buffer))

;;;; Prettify symbols
(use-package prog-mode
  :config
  (global-prettify-symbols-mode 1)
  (setq prettify-symbols-alist '(("lambda" . 955) ; λ
								 ("->" . 8594)    ; →
								 ("=>" . 8658)    ; ⇒
								 ("map" . 8614)   ; ↦
								 )))

;;;; Delete Selection as I Type
(use-package delsel
  :config
  (delete-selection-mode 1))

;;;; Remove tool-bar
(use-package tool-bar
  :config
  (tool-bar-mode 0))

;;;; Fonts and Transparent Frames
(use-package faces
  :config
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "BerkeleyMono Nerd Font"))

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

;;;; Little Margin around Window
(use-package fringe
  :config
  (set-fringe-mode 10))

;;;; Show Line Numbers
(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)

  ;; prevent right shift when carry occurs (90->100)
  (display-line-numbers-width-start t)

  :hook
  (prog-mode . display-line-numbers-mode)
  ;;(markdown-mode . display-line-numbers-mode)
  ;; org-mode should be explicitly enabled
  (org-mode . display-line-numbers-mode))

;;;; Clean White spaces
(use-package whitespace
  ;; show whitespace with colors
  :custom
  (whitespace-style '(face tabs tab-mark trailing))
  (custom-set-faces '(whitespace-tab ((t (:foreground "#020202")))))
  :hook
  (prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;;;; Package Manager
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))
;; maybe redundant, works well without below
;; 	(package-initialize)
;; 	(unless package-archive-contents
;; 	  (package-refresh-contents)))

;;;; Fix MacOS Shell Path Problem
;; Github: https://github.com/purcell/exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :custom
  (when (memq window-system '(mac ns x))
	(exec-path-from-shell-initialize)))

;;;; Which-key
;; Github: https://github.com/justbur/emacs-which-key
(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode t))

;;;; Vertico
;; Github: https://github.com/minad/vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;;;; Marginalia
;; Github: https://github.com/minad/marginalia
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;;;; Orderless
;; Github: https://github.com/oantolin/orderless
(use-package orderless
  :ensure t
  :custom
  (completion--styles '(oderless basic))
  (completion-category-defaults nil)
  (completion--category-overrides '((file (styles partial-completion)))))

;;;; Eglot
(use-package eglot
  :hook
  (prog-mode . eglot-ensure))

;;;; Flymake
(use-package flymake
  :bind (:map flymake-mode-map
			  ("M-n" . 'flymake-goto-next-error)
			  ("M-p" . 'flymake-goto-prev-error)))

;;;; Corfu
;; Github: https://github.com/minad/corfu
(use-package corfu
  :ensure t
  :config
  (setq corfu-auto 1)
  :init
  (global-corfu-mode))

;;;; Color Theme
;; Github: https://github.com/catppuccin/emacs
;; Takes over 500ms to load below
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin t)
  (setq catppuccin-flavor 'latte)
  (catppuccin-reload))

;; If you want minimum load time, switch to ~modus-operandi~.
;; (use-package custom
;;   :config
;;   (load-theme 'modus-operandi))

;;; Archive
(defun libj/ui ()
  "Uncomment region and indent"
  (interactive)
  (when (use-region-p)
  (uncomment-region (region-beginning) (region-end))
  (indent-region (region-beginning) (region-end))))

(defun libj/uic ()
  "Apply libj/ui and comment again"
  (interactive)
  (when (use-region-p))
  (libj/ui)
  (comment-region (region-beginning) (region-end)))

;;;; Recent Files
;; (use-package recentf
;;   :bind
;;   ;; 'C-x C-r' was 'find-file-read-only'
;;   ("C-x C-r" . recentf-open-files)
;;   :config
;;   (recentf-mode 1))

;;;; Show Column Number
;; (use-package simple
;;   :config
;;   (column-number-mode 1))

;;;; Revert Buffer Automatically
;; (use-package autorevert
;;   :diminish (auto-revert-mode)
;;   :config
;;   (global-auto-revert-mode t))

;;;; Remove scroll-bar
;; (use-package scroll-bar
;;   :config
;;   (scroll-bar-mode 0))

;;;; Benchmark init time
;; Github: https://github.com/dholm/benchmark-init-el
;; Can view the load time 'M-x benchmark-init/show-durations-tabulated' or 'M-x benchmark-init/show-durations-tree'.
;; (use-package benchmark-init
;;   :ensure t
;;   :config
;;   ;; To disable collection of benchmark data after init is done.
;;   (add-hook 'after-init-hook 'benchmark-init/deactivate))

;;;; Org
;; (use-package org
;;   :config
;;   (setq org-ellipsis " ⤵"))

;;;; Auto update
;; Github: https://github.com/rranelli/auto-package-update.el
;; (use-package auto-package-update
;;   :ensure t
;;   :bind
;;   ("C-c u p" . package-refresh-contents)	; provided from 'package' itself
;;   ("C-c u g" . auto-package-update-now-async)	; provided from 'auto-package-update' package
;;   :custom
;;   (setq auto-package-update-prompt-before-update t)
;;   (setq auto-package-update-delete-old-versions t))

;;;; Ensure System Package
;; Github: https://github.com/waymondo/use-package-ensure-system-package
;; (use-package use-package-ensure-system-package)

;;;; Magit
;; Webpage: https://magit.vc
;; (use-package magit
;;   :ensure t
;;   :custom
;;   (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;;; Eldoc Box
;; Github: https://github.com/casouri/eldoc-box
;; (use-package eldoc-box
;;   :ensure t)
;; ;; Switching to triger 'eldoc-box-help-at-point' as needed.
;; ;; TODO: bind a key
;; ;; BTW, 'M-x e-he' will bring the same function
;; ;; :config
;; ;; (add-hook 'eglot-managed-mode-hook #'eldoc-box-hover-at-point-mode 1)
;; ;; (add-hook 'elisp-mode-hook #'eldoc-box-hover-at-point-mode 1))

;;;; Helpful
;; Github: https://github.com/Wilfred/helpful
;; (use-package helpful
;;   :ensure t
;;   :bind
;;   ("C-h F" . helpful-function)
;;   ("C-h f" . helpful-callable)
;;   ("C-h h" . helpful-at-point)
;;   ("C-h k" . helpful-key)
;;   ("C-h v" . helpful-variable)
;;   ("C-h x" . helpful-command))

;; Also, there are
;; - Try, https://github.com/larstvei/Try
;; - Diminish, https://github.com/emacsmirror/diminish

;;; init.el ends here
