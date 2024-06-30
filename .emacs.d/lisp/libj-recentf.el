;;; libj-recentf.el -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package recentf
  :bind
  ("C-x C-r" . recentf-open-files)
  :config
  (recentf-mode 1))

(provide 'libj-recentf)

;;; libj-recentf.el ends here
