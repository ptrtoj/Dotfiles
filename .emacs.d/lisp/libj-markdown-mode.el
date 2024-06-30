;;; libj-markdown-mode.el -*- lexical-binding: t -*-

;;; Commentary:
;; See: https://jblevins.org/projects/markdown-mode/

;;; Code:
(use-package markdown-mode
  :ensure t
  :mode
  ("README\\.md\\'" . gfm-mode)
  :custom
  (setq markdown-command "pandoc"))

(provide 'libj-markdown-mode)

;;; libj-markdown-mode.el ends here
