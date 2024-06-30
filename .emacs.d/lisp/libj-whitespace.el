;;; libj-whitespace.el -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package whitespace
  :diminish
  ;; :custom
  ;; (whitespace-style '(face tabs tab-mark trailing))
  ;; (custom-set-faces '(whitespace-tab ((t (:foreground "#eeeeee")))))
  :hook
  ;; (prog-mode . whitespace-mode)
  (before-save . whitespace-cleanup))

(provide 'libj-whitespace)

;;; libj-whitespace.el ends here
