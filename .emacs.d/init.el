;;; init.el -*- lexical-binding: t -*-

;;; Commentary:
;; Jeon's Extermely Minimal `ALT` + `CTRL` + `SHIFT`

;;; Code:
;; Defaults
(use-package emacs
  :custom
  (user-full-name "WooHyoung Jeon")
  (user-mail-address "jeon@ptrtoj.com")
  ;; yes-or-no to y-or-n
  (setopt use-short-answers t))

;; do not make custom parts in this file, rather put them to 'custom.el'
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; initialize use-package
(use-package package
  :bind
  ("C-c u p" . package-refresh-contents)
  :config
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

;; automatically update packages
(use-package auto-package-update
  :ensure t
  :bind
  ("C-c u g" . auto-package-update-now)
  :custom
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-delete-old-versions t))

;; diminish
(use-package diminish
  :ensure t)

;;;; basic features
;; key bindings
(use-package bind-keys
  :bind
  ("C-c k" . describe-personal-keybindings))

;; delete selection as i type
(use-package delsel
  :config
  (delete-selection-mode 1))

;; 80th-column indicator
(use-package display-fill-column-indicator
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (markdown-mode . display-fill-column-indicator-mode))

;; show current line number
(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)
  (display-line-numbers-width-start t)
  :hook
  (prog-mode . display-line-numbers-mode)
  (markdown-mode . display-line-numbers-mode))

;; auto insert parenthesis
(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode)
  (org-mode . electric-pair-mode))

;; do not make `~` backup files
(use-package files
  :custom
  (make-backup-files nil))

;;;; spellcheck
;; System dependency:
;; - hunspell
;; - or aspell

;; And also
;; Dictionary files (*.aff and *.dic) should be placed in
;; ~/Library/Spelling/ or /Library/Spelling/.  Homebrew itself
;; provides no dictionaries for Hunspell, but you can download
;; compatible dictionaries from other sources, such as
;; https://cgit.freedesktop.org/libreoffice/dictionaries/tree/ .
;; commands:
;; $ cd ~/Library/Spelling/
;; $ wget https://cgit.freedesktop.org/libreoffice/dictionaries/tree/en/en_US.dic
;; $ wget https://cgit.freedesktop.org/libreoffice/dictionaries/tree/en/en_US.aff
(use-package flyspell
  :diminish
  :custom
  (ispell-local-dictionary "en_US")
  :hook
  (text-mode . flyspell-mode)
  (prog-mode . flyspell-prog-mode))

;; highlight current cursor line
(use-package hl-line
  :config
  (global-hl-line-mode 1))

;; show URL as clickable links
(use-package goto-addr
  :diminish
  :config
  (goto-address-mode 1))

;; remember recent files
(use-package recentf
  :bind
  ("C-x C-r" . recentf-open-files)
  :config
  (recentf-mode 1))

;; save command history
(use-package savehist
  :config
  (savehist-mode 1))

;; save last cursor point in file
(use-package saveplace
  :config
  (save-place-mode 1))

;; show column number also
(use-package simple
  :config
  (column-number-mode 1))

;; remove trailing whitespaces before save
(use-package whitespace
  :diminish
  ;; :custom
  ;; (whitespace-style '(face tabs tab-mark trailing))
  ;; (custom-set-faces '(whitespace-tab ((t (:foreground "#eeeeee")))))
  :hook
  ;; (prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;; fonts
(use-package faces
  :config
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "BerkeleyMono Nerd Font")))
  ;;(add-to-list 'default-frame-alist (cons 'width 120))
  ;;(add-to-list 'default-frame-alist (cons 'height 70)))

;; remove tool-bar
(use-package tool-bar
  :config
  (tool-bar-mode -1))

;; show key shortcuts
(use-package which-key
  :ensure t
  :diminish
  :custom
  (which-key-mode 1))

;; for a better minibuffer
;; improve minibuffer with
;; Vertico (See: https://github.com/minad/vertico), and
;; Marginalia (See: https://github.com/minad/marginalia)
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;; fix macos shell path problem
(use-package exec-path-from-shell
  :ensure t
  :custom
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; git
;; See: https://magit.vc
(use-package magit
  :ensure t
  :custom
  ;; prevent magit opens new window
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;; vim keybindings
;; (use-package evil
;;   :ensure t
;;   :init
;;   (evil-mode))

;;; ide-like
;;(require 'eldoc)         ; same as default

;;;; autocomplete
;; Helper Function
(defun jeon/company-add-yas-backend (backends)
  "Add yas data to company.
  \\='BACKENDS\\=' argument gets old company backends list"
  (if (and (listp backends) (memq 'company-yasnippet backends))
      backends
    (append (if (consp backends)
		backends
	      (list backends))
	    '(:with company-yasnippet))))

(use-package company
  :ensure t
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  :bind
  (:map company-active-map
	("M-/" . company-complete))
  :init
  (global-company-mode)
  :config
  (setq company-backends (mapcar #'jeon/company-add-yas-backend company-backends)))

;;;; lsp
(use-package eglot
  :hook
  (prog-mode . eglot-ensure))

;;;; snippets
;; See: https://github.com/joaotavora/yasnippet
;; See: https://github.com/AndreaCrotti/yasnippet-snippets
(use-package yasnippet
  :ensure t
  :diminish (yas-minor-mode)
  :config
  (yas-reload-all)
  :hook
  (prog-mode . yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t)

;;; language specifics
;; C
;; (use-package cc-vars
;;   :custom
;;   (c-default-style "linux"))

;; markdown mode
;; See: https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :ensure t
  :mode
  ("README\\.md\\'" . gfm-mode)
  :custom
  (setq markdown-command "pandoc"))

;;; init.el ends here
