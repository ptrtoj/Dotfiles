(org-babel-load-file (expand-file-name "README.org" user-emacs-directory))

;; Also, if you're using basic ~init.el~, you can hide subheadings with below.
;; 'outline-regexp' enables only showing 2 levels of headings.
;; See: https://emacs.stackexchange.com/q/60420/40897.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Local Variables:
;; outline-minor-mode-cycle: t
;; outline-regexp: ";\\{3,4\\} "
;; eval: (outline-minor-mode)
;; eval: (outline-hide-body)
;; End:
