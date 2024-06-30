;;; libj-eglot.el -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:
(use-package eglot
  :hook
  (prog-mode . eglot-ensure))

(provide 'libj-eglot)

;;; libj-eglot.el ends here
