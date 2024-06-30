;;; libj-column-indicator.el -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package display-fill-column-indicator
  :hook
  (prog-mode . display-fill-column-indicator-mode)
  (markdown-mode . display-fill-column-indicator-mode))

(provide 'libj-column-indicator)

;;; libj-column-indicator.el ends here
