;; Testing without below. [2024-12-27 23:27]
;; See: https://github.com/hrs/dotfiles/blob/main/emacs/.config/emacs/init.el
;; 'Robin Schwartz' added below but it seems I do not need these.
; Configure package.el to include MELPA.
;(require 'package)
;(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
;(package-initialize)

;(defun package--save-selected-packages (&rest opt) nil)

(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

;; Also, if you're using basic ~init.el~,
;; you can hide subheadings with below.
;; And, 'outline-regexp' enables only show 2 levels of headings
;; See: https://emacs.stackexchange.com/q/60420/40897 from Stack Exchange
  ;; Local Variables:
  ;; outline-minor-mode-cycle: t
  ;; outline-regexp: ";\\{3,4\\} "
  ;; eval: (outline-minor-mode)
  ;; eval: (outline-hide-body)
  ;; End:
