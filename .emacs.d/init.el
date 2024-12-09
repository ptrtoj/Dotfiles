;;; init.el --- Jeon's Personal Emacs Configuration
;;; Commentary:
;; BTW, semicolons matter, see: "D.7 Tips on Writing Comments"
;; (https://www.gnu.org/software/emacs/manual/html_node/elisp/Comment-Tips.html)

;;; Code:

;; [Quoted from the linked document]

;; Using multiple top-level code sections has the advantage that
;; it avoids introducing an additional nesting level but it also means
;; that the section named ‘Code’ does not contain all the code, which
;; is awkward.
;;
;; To avoid that, you should put no code at all inside that section;
;; that way it can be considered a separator instead of a section heading.

;; [Dependencies]

;; for Flyspell
;; - aspell (or hunspell)
;; - And also dictionary files if you chose to use hunspell
;; - '*.aff' && '*.dic' (e.g. 'en_US.aff' and 'en_US.dic')
;;
;; Dictionary files should be placed in '/USER_HOME_DIR/Library/Spelling/' or '/Library/Spelling/'.
;;
;; Homebrew itself doesn't provide dictionaries for Hunspell,
;; but you can download compatible dictionaries from other sources,
;; such as, from here (https://cgit.freedesktop.org/libreoffice/dictionaries/tree/).
;;
;;   $ cd ~/Library/Spelling/
;;   $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.aff
;;   $ wget https://github.com/ropensci/hunspell/raw/master/inst/dict/en_US.dic

;;; Emacs Itself
(use-package emacs
  :custom
  (user-full-name "WooHyoung Jeon")
  (user-mail-address "jeon@ptrtoj.com")
  (use-short-answers t)
  (inhibit-startup-screen t)
  (visible-bell t)
  ;; from 'Vertico'
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
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
  )

;;; Prevent Emacs Generating 'custom.el'
(use-package cus-edit
  :custom
  (custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))

;;; Prevent Emacs Generating Backup Files
;; Dropped. Backup files are actually helpful.
;; (use-package files
;;   :custom
;;   (make-backup-files nil))

;;; Remember Recent Files
;; Dropped. It isn't hard to open wanted file, and also there's 'Dired'.
;; 'C-x C-r' was 'find-file-read-only'
;; (use-package recentf
;;   :bind
;;   ("C-x C-r" . recentf-open-files)
;;   :config
;;   (recentf-mode 1))

;;; Remember Recent Command History
(use-package savehist
  :config
  (savehist-mode 1))

;;; Remember Last Cursor Postion from File
(use-package saveplace
  :config
  (save-place-mode 1))

;;; Delete Selection as I Type
(use-package delsel
  :config
  (delete-selection-mode 1))

;;; Automatically Match Parenthesis
(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode)
  (org-mode . electric-pair-mode))

;;; Clean Whitespaces
(use-package whitespace
  ;; show whitespace with colors
  ;;:custom
  ;;(whitespace-style '(face tabs tab-mark trailing))
  ;;(custom-set-faces '(whitespace-tab ((t (:foreground "#020202")))))
  :hook
  ;;(prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;;; Revert Buffer Automatically
;; Dropped. Don't think I *REALLY* need this feature, yet.
;; However, I want to diminish the minor mode section.
(use-package autorevert
  :diminish (auto-revert-mode))
;; :config
;; (global-auto-revert-mode t))

;;; Provide Documents
(use-package eldoc
  :diminish)

;;; Spellcheck
(use-package flyspell
  :diminish
  ;;:config
  ;;(setq ispell-program-name "hunspell")
  ;;(setq ispell-local-dictionary "en_US")
  :hook
  (text-mode . flyspell-mode)
  (prog-mode . flyspell-prog-mode))
;;(org-mode . flyspell-prog-mode))

;;; Dynamic Abbreviation
(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
	 ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'tags-table-mode))

;;; Disable Tool Bar
(use-package tool-bar
  :config
  (tool-bar-mode -1))

;;; Disable Scroll Bar
;; I found out that actually I use scrollbar, too.
;; (use-package scroll-bar
;;   :config
;;   (scroll-bar-mode 0))

;;; Fonts and Transparent Frames
(use-package faces
  :config
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  ;;(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "Berkeley Mono"))
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

;; Show Column Number
(use-package simple
  :config
  (column-number-mode 1))

;;; Show Max Column Indicator
(use-package display-fill-column-indicator
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (org-mode . display-fill-column-indicator-mode))

;;; Highlight Current Cursor Line
(use-package hl-line
  :config
  (global-hl-line-mode 1))

;;; Show URLs as a Clickable Link
(use-package goto-addr
  :hook
  (prog-mode . goto-address-prog-mode)
  (text-mode . goto-address-prog-mode))

;;; Set up Package Manager
;; Moved 'package-refresh-contents' to 'auto-package-update' config section
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

;;; Automatically Update Packages
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

;;; Fix MacOS Shell Path Problem
(use-package exec-path-from-shell
  :ensure t
  :custom
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;; Which-key
(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode t))

;;; Magit
(use-package magit
  :ensure t
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;; Vertico
;; https://github.com/minad/vertico
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;;; Orderless
;; https://github.com/oantolin/orderless
(use-package orderless
  :ensure t
  :custom
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch))
  ;; (orderless-component-separator #'orderless-escapable-split-on-space)
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;;; Marginalia
;; https://github.com/minad/marginalia
(use-package marginalia
  :ensure t
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle))
  :init
  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the package.
  (marginalia-mode))

;;; Currently, doesn't feel like I also need 'Embark' and 'Consult'.

;;; Corfu
;; https://github.com/minad/corfu
(use-package corfu
  :ensure t
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  :hook ((prog-mode . corfu-mode)
	 (shell-mode . corfu-mode)
	 (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.  This is recommended since Dabbrev can
  ;; be used globally (M-/).  See also the customization variable
  ;; `global-corfu-modes' to exclude certain modes.
  :init
  (global-corfu-mode)

  :config
  (setq corfu-auto t)
  (setq completion-styles '(basic)))

;;; Cape
;; https://github.com/minad/cape
(use-package cape
  :ensure t
  ;; Bind prefix keymap providing all Cape commands under a mnemonic key.
  ;; Press C-c p ? to for help.
  :bind ("C-c p" . cape-prefix-map) ;; Alternative key: M-<tab>, M-p, M-+
  ;; Alternatively bind Cape commands individually.
  ;; :bind (("C-c p d" . cape-dabbrev)
  ;;        ("C-c p h" . cape-history)
  ;;        ("C-c p f" . cape-file)
  ;;        ...)
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  ;; (add-hook 'completion-at-point-functions #'cape-history)
  ;; ...
)

;;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
	  treemacs-deferred-git-apply-delay        0.5
	  treemacs-directory-name-transformer      #'identity
	  treemacs-display-in-side-window          t
	  treemacs-eldoc-display                   'simple
	  treemacs-file-event-delay                2000
	  treemacs-file-extension-regex            treemacs-last-period-regex-value
	  treemacs-file-follow-delay               0.2
	  treemacs-file-name-transformer           #'identity
	  treemacs-follow-after-init               t
	  treemacs-expand-after-init               t
	  treemacs-find-workspace-method           'find-for-file-or-pick-first
	  treemacs-git-command-pipe                ""
	  treemacs-goto-tag-strategy               'refetch-index
	  treemacs-header-scroll-indicators        '(nil . "^^^^^^")
	  treemacs-hide-dot-git-directory          t
	  treemacs-indentation                     2
	  treemacs-indentation-string              " "
	  treemacs-is-never-other-window           nil
	  treemacs-max-git-entries                 5000
	  treemacs-missing-project-action          'ask
	  treemacs-move-files-by-mouse-dragging    t
	  treemacs-move-forward-on-expand          nil
	  treemacs-no-png-images                   nil
	  treemacs-no-delete-other-windows         t
	  treemacs-project-follow-cleanup          nil
	  treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
	  treemacs-position                        'left
	  treemacs-read-string-input               'from-child-frame
	  treemacs-recenter-distance               0.1
	  treemacs-recenter-after-file-follow      nil
	  treemacs-recenter-after-tag-follow       nil
	  treemacs-recenter-after-project-jump     'always
	  treemacs-recenter-after-project-expand   'on-distance
	  treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
	  treemacs-project-follow-into-home        nil
	  treemacs-show-cursor                     nil
	  treemacs-show-hidden-files               t
	  treemacs-silent-filewatch                nil
	  treemacs-silent-refresh                  nil
	  treemacs-sorting                         'alphabetic-asc
	  treemacs-select-when-already-in-treemacs 'move-back
	  treemacs-space-between-root-nodes        t
	  treemacs-tag-follow-cleanup              t
	  treemacs-tag-follow-delay                1.5
	  treemacs-text-scale                      nil
	  treemacs-user-mode-line-format           nil
	  treemacs-user-header-line-format         nil
	  treemacs-wide-toggle-width               70
	  treemacs-width                           35
	  treemacs-width-increment                 1
	  treemacs-width-is-initially-locked       t
	  treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
		 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
	("M-0"       . treemacs-select-window)
	("C-x t 1"   . treemacs-delete-other-windows)
	("C-x t t"   . treemacs)
	("C-x t d"   . treemacs-select-directory)
	("C-x t B"   . treemacs-bookmark)
	("C-x t C-t" . treemacs-find-file)
	("C-x t M-t" . treemacs-find-tag)))

;; (use-package treemacs-projectile
;;   :after (treemacs projectile)
;;   :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

;; (use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
;;   :after (treemacs persp-mode) ;;or perspective vs. persp-mode
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Perspectives))

;; (use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
;;   :after (treemacs)
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Tabs))

(treemacs-start-on-boot)

;;; Color Theme
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin t)
  (setq catppuccin-flavor 'latte)
  (catppuccin-reload))

;;; Icon Theme
(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-dired
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))
;;; init.el ends here
