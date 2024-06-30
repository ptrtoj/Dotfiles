;;; libj-company.el -*- lexical-binding: t -*-

;;; Commentary:
;; See: https://company-mode.github.io

;;; Code:
;; Helper Function
(defun jeon/company-add-yas-backend (backends)
  "Add yas data to company.
  \\='BACKENDS\\=' argument gets old company backends list"
  (if (and (listp backends) (memq 'company-yasnippet backends))
      backends
    (append (if (consp backends)
		backends
	      (list backends))
	    '(:with company-yasnippet))))

(use-package company
  :ensure t
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  :bind
  (:map company-active-map
	("M-/" . company-complete))
  :init
  (global-company-mode)
  :config
  (setq company-backends (mapcar #'jeon/company-add-yas-backend company-backends)))

(provide 'libj-company)

;;; libj-company.el ends here
