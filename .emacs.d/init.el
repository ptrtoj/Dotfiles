;;; init.el -*- coding: utf-8; lexical-binding: t -*-

;;; Commentary:
;; Jeon's Extermely Minimal `ALT` + `CTRL` + `SHIFT`

;; Semicolons matter (See: "D.7 Tips on Writing Comments", https://www.gnu.org/software/emacs/manual/html_node/elisp/Comment-Tips.html)

;;; Code:
;;; Pre
;; do not make custom parts in this file, rather put them to 'custom.el'
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;;; Use-package
;;;; Initialize
(use-package package
  :bind
  ("C-c u p" . package-refresh-contents)
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

;;;; Auto Update
(use-package auto-package-update
  :ensure t
  :bind
  ("C-c u g" . auto-package-update-now)
  :custom
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-delete-old-versions t))

;;;; Diminish
;; hide unnecessary minor mode notifications
(use-package diminish
  :ensure t
  :config
  (diminish 'outline-minor-mode)
  (diminish 'auto-revert-mode))

;;; Defaults
;;;; Emacs
(use-package emacs
  :custom
  (user-full-name "WooHyoung Jeon")
  (user-mail-address "jeon@ptrtoj.com")
  ;; yes-or-no to y-or-n
  (use-short-answers t)
  ;; do not show welcome screen
  (inhibit-startup-screen t)
  ;; vertico recommends below
  :init
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
		  (replace-regexp-in-string
		   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
		   crm-separator)
		  (car args))
	  (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
	'(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Support opening new minibuffers from inside existing minibuffers.
  (setq enable-recursive-minibuffers t)

  ;; Emacs 28 and newer: Hide commands in M-x which do not work in the current
  ;; mode.  Vertico commands are hidden in normal buffers. This setting is
  ;; useful beyond Vertico.
  (setq read-extended-command-predicate #'command-completion-default-include-p))

;;;; No Backup Files
;; do not make `~` backup files
(use-package files
  :custom
  (make-backup-files nil))

;;;; Recent Files
(use-package recentf
  :bind
  ("C-x C-r" . recentf-open-files)
  :config
  (recentf-mode 1))

;;;; Save Command History
(use-package savehist
  :config
  (savehist-mode 1))

;;;; Save Last Position
(use-package saveplace
  :config
  (save-place-mode 1))

;;;; Vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;;;; Orderless
(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

;;;; Marginalia
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

;;;; [TODO] Consult
;; check later

;;;; [TODO] Embark
;; check later

;;; Editing
;;;; Delsel
;; delete selection as I type
(use-package delsel
  :config
  (delete-selection-mode 1))

;;;; Auto Insert Parenthesis
(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode)
  (org-mode . electric-pair-mode))

;;;; Whitespace
;; remove trailing white-spaces before save
(use-package whitespace
  ;;:diminish
  ;; show whitespace with colors
  ;;:custom
  ;;(whitespace-style '(face tabs tab-mark trailing))
  ;;(custom-set-faces '(whitespace-tab ((t (:foreground "#eeeeee")))))
  :hook
  ;; (prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;;;; Spellcheck
;; System dependency:
;; - hunspell
;; And also dictionary files ('*.aff' and '*.dic', e.g. 'en_US.aff' and 'en_US.dic')
;; should be placed in '~/Library/Spelling/' or '/Library/Spelling/'.
;; Homebrew itself doesn't provide dictionaries for Hunspell,
;; but you can download compatible dictionaries from other sources, such as
;; https://cgit.freedesktop.org/libreoffice/dictionaries/tree/.
;; commands:
;; $ cd ~/Library/Spelling/
;; $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.aff
;; $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.dic
(use-package flyspell
  :diminish
  :config
  (setq ispell-program-name "hunspell")
  (setq ispell-local-dictionary "en_US")
  :hook
  (text-mode . flyspell-mode)
  (prog-mode . flyspell-prog-mode))

;;; UI
;;;; Remove Tool Bar
(use-package tool-bar
  :config
  (tool-bar-mode -1))

;;;; Fonts
(use-package faces
  :config
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "BerkeleyMono Nerd Font"))
  ;;(add-to-list 'default-frame-alist (cons 'width 120))
  ;;(add-to-list 'default-frame-alist (cons 'height 70)))
  )

;;;; Line Number
(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)
  ;; prevent right shift when carry occurs (90->100)
  (display-line-numbers-width-start t)
  :hook
  (prog-mode . display-line-numbers-mode)
  (markdown-mode . display-line-numbers-mode))

;;;; Column Number
;; also show column number
(use-package simple
  :config
  (column-number-mode 1))

;;;; Column Indicator
;; show 80th-column
(use-package display-fill-column-indicator
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (markdown-mode . display-fill-column-indicator-mode))

;;;; Current Line
(use-package hl-line
  :config
  (global-hl-line-mode 1))

;;;; Show URL as Clickable Links
(use-package goto-addr
  :hook
  (prog-mode . goto-address-prog-mode)
  (text-mode . goto-address-prog-mode))

;;;; Color Theme
(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))

;;;; Modeline
;; run: M-x nerd-icons-install-fonts
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;;; Icons for Minibuffer
;; doom-modeline installs nerd-icons
(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  :hook
  (marginalia-mode . nerd-icons-completion-marginalia-setup))

;;;; Icons for Dired
(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

;;; Key Bindings
;;;; Which Key
(use-package which-key
  :ensure t
  :diminish
  :custom
  (which-key-mode 1))

;;;; Personal Keys
(use-package bind-keys
  :bind
  ("C-c k" . describe-personal-keybindings))

;;;; Vim Keys
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-vsplit-window-right t)
  :config
  (evil-mode 1))

;;; Git
(use-package magit
  :ensure t
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;; Programming
;;;; LSP
(use-package eglot
  :hook
  (c-mode . eglot-ensure))

;;;; Eldoc
(use-package eldoc
  :diminish
  ;;hook
  ;;(emacs-lisp-mode . eldoc-mode)
  ;;(lisp-interaction-mode . eldoc-mode)
  ;;(ielm-mode-hook . eldoc-mode)
  )

;;;; Treesitter
(use-package tree-sitter
  :ensure t
  :init
  (global-tree-sitter-mode)
  :hook
  (tree-sitter-after-on . tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t
  :after (tree-sitter))

;;;; Snippets
;; yasnippet helper function
(defun jeon/company-add-yas-backend (backends)
  "Add yas data to company.
  \\='BACKENDS\\=' argument gets old company backends list"
  (if (and (listp backends) (memq 'company-yasnippet backends))
      backends
    (append (if (consp backends)
		backends
	      (list backends))
	    '(:with company-yasnippet))))

;; yasnippet
(use-package yasnippet
  :ensure t
  :diminish (yas-minor-mode)
  :config
  (yas-reload-all)
  :hook
  (prog-mode . yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t)

;;;; Auto Complete
(use-package company
  :ensure t
  :diminish
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

(use-package company-box
  :ensure t
  :diminish
  :hook
  (company-mode . company-box-mode))

;;;; Fix MacOS Shell Path Problem
(use-package exec-path-from-shell
  :ensure t
  :custom
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;; For Outline Mode
;;(See: https://www.reddit.com/r/emacs/comments/a6tu8y/outlineminormode_for_emacs_maybe_useful/ )
(use-package outline
  :diminish
  :hook
  (outline-minor-mode . (lambda ()
			  (define-key
			   outline-minor-mode-map
			   (kbd "<tab>")
			   '(menu-item "" nil :filter
				       (lambda
					 (&optional _)
					 (when (outline-on-heading-p)
					   'outline-cycle))))
			  (define-key outline-minor-mode-map (kbd "<backtab>")
				      '(lambda()
					 (interactive)
					 (save-excursion
					   (goto-char (point-min))
					   (outline-show-all)
					   (outline-hide-leaves))))
			  (define-key outline-minor-mode-map (kbd "C-S-<tab>")
				      '(lambda()
					 (interactive)
					 (save-excursion
					   (goto-char (point-min))
					   (outline-hide-body)))))))

(use-package disp-table
  :config
  (set-display-table-slot standard-display-table
			  'selective-display
			  (string-to-vector " ↪ More...")))

;; Local Variables:
;; outline-regexp: "^;;[;]+ "
;; eval: (outline-minor-mode 1)
;; eval: (outline-hide-sublevels 4)
;; End:
;;; init.el ends here
