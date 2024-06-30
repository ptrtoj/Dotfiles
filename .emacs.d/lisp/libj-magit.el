;;; libj-magit.el -*- lexical-binding: t -*-

;;; Commentary:
;; See: https://magit.vc

;;; Code:
(use-package magit
  :ensure t
  :custom
  ;; prevent magit opens new window
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(provide 'libj-magit)

;;; libj-magit.el ends here
