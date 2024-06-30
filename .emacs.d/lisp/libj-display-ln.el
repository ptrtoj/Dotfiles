;;; libj-display-ln.el -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package display-line-numbers
  :custom
  (display-line-numbers-type 'relative)
  (display-line-numbers-width-start t)
  :hook
  (prog-mode . display-line-numbers-mode)
  (markdown-mode . display-line-numbers-mode))

(provide 'libj-display-ln)

;;; libj-display-ln.el ends here
