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

;;; Defaults
;;;; Emacs Itself
(use-package emacs
  :custom
  (user-full-name "WooHyoung Jeon")
  (user-mail-address "jeon@ptrtoj.com")
  (use-short-answers t)
  (inhibit-startup-screen t)
  (visible-bell t))

;;;; Prevent Emacs Generating 'custom.el'
(use-package cus-edit
  :custom
  (custom-file (concat user-emacs-directory "custom.el"))
  (when (file-exists-p custom-file)
    (load custom-file)))

;;;; Prevent Emacs Generating Backup Files
;; Dropped. Backup files are actually helpful.
;; (use-package files
;;   :custom
;;   (make-backup-files nil))

;;;; Remember Recent Files
;; Dropped. It isn't hard to open wanted file, and also there's 'Dired'.
;; 'C-x C-r' was 'find-file-read-only'
;; (use-package recentf
;;   :bind
;;   ("C-x C-r" . recentf-open-files)
;;   :config
;;   (recentf-mode 1))

;;;; Remember Recent Command History
(use-package savehist
  :config
  (savehist-mode 1))

;;;; Remember Last Cursor Postion from File
(use-package saveplace
  :config
  (save-place-mode 1))

;;;; Delete Selection as I Type
(use-package delsel
  :config
  (delete-selection-mode 1))

;;;; Automatically Match Parenthesis
(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode)
  (org-mode . electric-pair-mode))

;;;; Clean Whitespaces
(use-package whitespace
  ;; show whitespace with colors
  ;;:custom
  ;;(whitespace-style '(face tabs tab-mark trailing))
  ;;(custom-set-faces '(whitespace-tab ((t (:foreground "#020202")))))
  :hook
  ;;(prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

;;;; Revert Buffer Automatically
;; Dropped. Don't think I *REALLY* need this feature, yet.
;; (use-package autorevert
;;     :diminish (auto-revert-mode)
;;     :config
;;     (global-auto-revert-mode t))

;;;; Spellcheck
;; [Requirements]
;; - aspell (or hunspell)
;; - And also dictionary files if you chose to use hunspell
;; - '*.aff' && '*.dic' (e.g. 'en_US.aff' and 'en_US.dic')

;; Dictionary files should be placed in '/USER_HOME_DIR/Library/Spelling/' or '/Library/Spelling/'.

;; Homebrew itself doesn't provide dictionaries for Hunspell,
;; but you can download compatible dictionaries from other sources,
;; such as, from here (https://cgit.freedesktop.org/libreoffice/dictionaries/tree/).

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

;;;; UI
;;;;; Disable Tool Bar
(use-package tool-bar
  :config
  (tool-bar-mode -1))

;;;;; Disable Scroll Bar
(use-package scroll-bar
  :config
  (scroll-bar-mode 0))

;;;;; Fonts and Transparent Frames
(use-package faces
  :config
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  ;;(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "Berkeley Mono"))
  ;; fullscreen on startup
  ;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
  ;; or set default width and height
  (add-to-list 'default-frame-alist (cons 'width 120))
  (add-to-list 'default-frame-alist (cons 'height 70))

  ;; transparency
  ;; Emacs 29 introduced below, but doesn't work on Macos.
  ;;(set-frame-parameter nil 'alpha-background 90)
  ;;(add-to-list 'default-frame-alist '(alpha-background . 90))

  ;; Rather this works (the old way).
  (set-frame-parameter (selected-frame) 'alpha '(95 95))
  (add-to-list 'default-frame-alist '(alpha 95 95)))

;; [DO NOT WORK] Blur the background
;;(set-face-background 'default "mac:windowBackgroundColor")
;;(set-face-stipple 'default "alpha:30%"))

;;;;; Show Line Numbers
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

;;;; Show Column Number
(use-package simple
  :config
  (column-number-mode 1))

;;;;; Show Max Column Indicator
(use-package display-fill-column-indicator
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (org-mode . display-fill-column-indicator-mode))

;;;;; Highlight Current Cursor Line
(use-package hl-line
  :config
  (global-hl-line-mode 1))

;;;;; Show URLs as a Clickable Link
(use-package goto-addr
  :hook
  (prog-mode . goto-address-prog-mode)
  (text-mode . goto-address-prog-mode))

;;; 3rd Party Plugins
;;;; Set up Package Manager
;; Moved 'package-refresh-contents' to 'auto-package-update' config section
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

;;;; Automatically Update Packages
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

;;; Color Theme
(use-package catppuccin-theme
  :ensure t
  :config
  (load-theme 'catppuccin t)
  (setq catppuccin-flavor 'latte)
  (catppuccin-reload))
;;; init.el ends here
