;;; libj-shell-path.el -*- lexical-binding: t -*-

;;; Commentary:
;; fix macos shell path problems

;;; Code:
(use-package exec-path-from-shell
  :ensure t
  :custom
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(provide 'libj-shell-path)

;;; libj-shell-path.el ends here
