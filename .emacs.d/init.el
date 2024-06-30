;;; init.el -*- lexical-binding: t -*-

;;; Commentary:
;; Jeon's Extermely Minimal `ALT` + `CTRL` + `SHIFT`

;;; Code:
;;; Defaults
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

;;;; Load other settings
(add-to-list 'load-path "~/.emacs.d/lisp/")

;;;; use-package related
(require 'libj-pkg)
(require 'libj-diminish)

;;; basic features
(put 'downcase-region 'disabled nil)	; allow downcase-region
(require 'libj-keys)			; key bindings
(require 'libj-delsel)			; delete selection as i type
(require 'libj-column-indicator)	; 80th-column indicator
(require 'libj-display-ln)		; show current line number
(require 'libj-elec-pair)		; auto insert parenthesis
(require 'libj-files)			; do not make `~` backup files
(require 'libj-flyspell)		; spellcheck
(require 'libj-hl-line)			; highlight current cursor line
(require 'libj-goto-addr)		; show URL as clickable links
(require 'libj-recentf)			; remember recent files
(require 'libj-savehist)		; save command history
(require 'libj-saveplace)		; save last cursor point in file
(require 'libj-simple)			; show column number also
(require 'libj-subword)			; treat 'some-var-name' as one word
(require 'libj-whitespace)		; remove trailing whitespaces before save
(require 'libj-faces)			; fonts
(require 'libj-tool-bar)		; remove tool-bar
(require 'libj-which-key)		; show key shortcuts
(require 'libj-vertico)			; for a better minibuffer
(require 'libj-shell-path)		; fix macos shell path problem
(require 'libj-magit)			; git

;;; ide-like
;;(require 'eldoc)         ; same as default

;;;; autocomplete
(require 'libj-company)

;;;; lsp
(require 'libj-eglot)

;;;; snippets
(require 'libj-yasnippet)

;;; language specifics
(require 'libj-cc-vars)
(require 'libj-markdown-mode)

;;; init.el ends here
