;;; libj-flyspell.el -*- lexical-binding: t -*-

;;; Commentary:
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

;;; Code:
(use-package flyspell
  :diminish
  :custom
  (ispell-local-dictionary "en_US")
  :hook
  (text-mode . flyspell-mode)
  (prog-mode . flyspell-prog-mode))

(provide 'libj-flyspell)

;;; libj-flyspell.el ends here
