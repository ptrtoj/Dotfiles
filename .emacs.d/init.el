(use-package emacs
  :custom
  (user-full-name "WooHyoung Jeon")
  (user-mail-address "jeon@ptrtoj.com")
  (use-short-answers t)
  (inhibit-startup-screen t)
  (visible-bell t))

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(use-package recentf
  :bind
  ;; "C-x C-r" was originally binded to 'find-file-read-only'
  ("C-x C-r" . recentf-open-files)
  :config
  (recentf-mode 1))

(use-package savehist
  :config
  (savehist-mode 1))

(use-package saveplace
  :config
  (save-place-mode 1))

(use-package autorevert
  :diminish (auto-revert-mode)
  :config
  (global-auto-revert-mode t))

(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

(use-package auto-package-update
  :ensure t
  :bind
  ;; "C-c u" prefix was unbinded
  ("C-c u p" . package-refresh-contents)
  ("C-c u g" . auto-package-update-now-async)
  :custom
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-delete-old-versions t))

(use-package diminish
  :ensure t)

(use-package subword
  ;; subword enables superword-mode
  :diminish (superword-mode)
  :config
  (global-superword-mode t))

(use-package delsel
  :config
  (delete-selection-mode 1))

(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode)
  (org-mode . electric-pair-mode))

(use-package whitespace
  ;; show whitespace with colors
  ;;:custom
  ;;(whitespace-style '(face tabs tab-mark trailing))
  ;;(custom-set-faces '(whitespace-tab ((t (:foreground "#020202")))))
  :hook
  ;;(prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;; Check spell errors.

;; - aspell (or hunspell)
;; - And also dictionary files if you chose to use hunspell
;; - '*.aff' && '*.dic' (e.g. 'en_US.aff' and 'en_US.dic')

;; Dictionary files should be placed in ~/USER_HOME_DIR/Library/Spelling/~ or ~/Library/Spelling/~.

;; Homebrew itself doesn't provide dictionaries for Hunspell,
;; but you can download compatible dictionaries from other sources, such as [[https://cgit.freedesktop.org/libreoffice/dictionaries/tree/][this]].

;;   $ cd ~/Library/Spelling/
;;   $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.aff
;;   $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.dic

(use-package flyspell
  :diminish
  ;;:config
  ;;(setq ispell-program-name "hunspell")
  ;;(setq ispell-local-dictionary "en_US")
  :hook
  (text-mode . flyspell-mode)
  (prog-mode . flyspell-prog-mode))
  ;;(org-mode . flyspell-prog-mode))

(use-package abbrev
  :diminish)

(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode t))

(use-package bind-keys
  :bind
  ;; "C-c k" was unbinded
  ("C-c k" . describe-personal-keybindings))

;; (use-package evil
;;   :ensure t
;;   :custom
;;   (evil-want-C-u-scroll t)
;;   (evil-vsplit-window-right t)
;;   (evil-want-C-i-jump nil)
;;   (evil-split-window-below t)
;;   (evil-vsplit-window-right t)
;;   :config
;;   (evil-mode 1))

;; OrgMode
(defun libj/org-tangle-on-save ()
  (when (string-equal (buffer-file-name)
		      (expand-file-name "~/Git/Dotfiles/.emacs.d/README.org"))
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(use-package org
  :custom
  (org-todo-keywords
   '((sequence "TODO" "WIP" "TESTING" "|" "DONE" "DROP")))
  (org-todo-keyword-faces '(("TODO" . "red")
			    ("WIP" . "orange")
			    ("TESTING" . "blue")
			    ("DONE" . "green")
			    ("DROP" . "gray")))
  :hook
  (after-save . libj/org-tangle-on-save))

(use-package eglot
  :hook
  (c-mode . eglot-ensure))

(use-package eldoc
  :diminish
  :hook
  (emacs-lisp-mode . eldoc-mode)
  (lisp-interaction-mode . eldoc-mode))

  ;;(ielm-mode-hook . eldoc-mode))

(use-package eldoc-box
  :ensure t
  :after eldoc
  :hook
  (eglot-managed-mode . eldoc-box-hover-at-point-mode)
  :config
  ;;(set-face-attribute 'eldoc-box-body nil :font "Fira Sans")
  (set-face-attribute 'eldoc-box-border nil :background "white"))

(use-package flymake
  :bind (:map flymake-mode-map
	      ("M-n" . 'flymake-goto-next-error)
	      ("M-p" . 'flymake-goto-prev-error))
  :custom
  (flymake-mode-line-lighter "F"))

(use-package tree-sitter
  :ensure t
  :diminish
  :init
  (global-tree-sitter-mode)
  :hook
  (tree-sitter-after-on . tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :ensure t
  :after (tree-sitter))

(defun libj/company-add-yas-backend (backends)
  "Add yas data to company.
\\='BACKENDS\\=' argument gets old company backends list"
  (if (and (listp backends) (memq 'company-yasnippet backends))
      backends
    (append (if (consp backends)
		backends
	      (list backends))
	    '(:with company-yasnippet))))

(use-package yasnippet
  :ensure t
  :diminish (yas-minor-mode)
  :config
  (yas-reload-all)
  :hook
  (prog-mode . yas-minor-mode))

;; actual snippets
(use-package yasnippet-snippets
  :ensure t)

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
  (setq company-backends (mapcar #'libj/company-add-yas-backend company-backends)))

(use-package company-box
  :ensure t
  :diminish
  :hook
  (company-mode . company-box-mode))

(use-package exec-path-from-shell
  :ensure t
  :custom
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package tool-bar
  :config
  (tool-bar-mode -1))

(use-package scroll-bar
  :config
  (scroll-bar-mode 0))

(use-package faces
  :config
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "Berkeley Mono")))
;; fullscreen on startup
;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
;; or set default width and height
;; (add-to-list 'default-frame-alist (cons 'width 120))
;; (add-to-list 'default-frame-alist (cons 'height 70))

;; transparency
;; Emacs 29 introduced below, but doesn't work on Macos.
;;(set-frame-parameter nil 'alpha-background 90)
;;(add-to-list 'default-frame-alist '(alpha-background . 90))
;; Rather this works (the old way).
;;(set-frame-parameter (selected-frame) 'alpha '(95 95))
;;(add-to-list 'default-frame-alist '(alpha 95 95)))
;; [DO NOT WORK] Blur the background
;;(set-face-background 'default "mac:windowBackgroundColor")
;;(set-face-stipple 'default "alpha:30%"))

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

(use-package display-fill-column-indicator
  :hook
  (prog-mode . display-fill-column-indicator-mode))

(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'latte)
  (catppuccin-reload))

;; This assumes you've installed the package via MELPA.
(use-package ligature
  :ensure t
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
				       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
				       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
				       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
				       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
				       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
				       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
				       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
				       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
				       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
				       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
				       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
				       "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))
