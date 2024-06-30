;;; libj-vertico.el -*- lexical-binding: t -*-

;;; Commentary:
;; improve minibuffer with
;; Vertico (See: https://github.com/minad/vertico), and
;; Marginalia (See: https://github.com/minad/marginalia)

;;; Code:
(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(provide 'libj-vertico)

;;; libj-vertico.el ends here
