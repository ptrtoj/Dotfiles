;;; libj-faces.el -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:
(use-package faces
  :config
  (set-face-attribute 'font-lock-keyword-face nil :weight 'bold)
  (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (add-to-list 'default-frame-alist '(font . "BerkeleyMono Nerd Font")))

(provide 'libj-faces)

;;; libj-faces.el ends here
