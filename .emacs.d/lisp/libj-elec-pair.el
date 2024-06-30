;;; libj-elec-pair.el -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:
(use-package elec-pair
  :hook
  (prog-mode . electric-pair-mode)
  (org-mode . electric-pair-mode))

(provide 'libj-elec-pair)

;;; libj-elec-pair.el ends here
