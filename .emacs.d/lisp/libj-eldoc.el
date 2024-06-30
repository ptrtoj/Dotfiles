;;; libj-eldoc.el -*- lexical-binding:t -*-

;;; Commentary:
;; Defaults already behave as below

;;; Code:
(use-package eldoc
  :diminish
  :hook
  (prog-mode . turn-on-eldoc-mode))

(provide 'libj-eldoc)
;;; libj-eldoc.el ends here
