;;; libj-pkg.el -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
;;; Initiate Use-Package
(use-package package
  :bind
  ("C-c u p" . package-refresh-contents)
  :config
  (add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents)))

;;;; Auto Update Packages
(use-package auto-package-update
  :ensure t
  :bind
  ("C-c u g" . auto-package-update-now)
  :custom
  (setq auto-package-update-prompt-before-update t)
  (setq auto-package-update-delete-old-versions t))

(provide 'libj-pkg)

;;; libj-pkg.el ends here
