;;; libj-yasnippet.el -*- lexical-binding: t -*-

;;; Commentary:
;; See: https://github.com/joaotavora/yasnippet
;; See: https://github.com/AndreaCrotti/yasnippet-snippets

;;; Code:
(use-package yasnippet
  :ensure t
  :diminish (yas-minor-mode)
  :config
  (yas-reload-all)
  :hook
  (prog-mode . yas-minor-mode))

(use-package yasnippet-snippets
  :ensure t)

(provide 'libj-yasnippet)

;;; libj-yasnippet.el ends here
