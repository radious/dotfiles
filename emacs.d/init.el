(when (file-exists-p "~/.emacs-local.d/preload.el")
  (add-to-list 'load-path "~/.emacs-local.d")
  (load-library "preload"))

(add-to-list 'load-path "~/.emacs.d/config")
(load-library "init-el-get") ;; start el-get

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; various configuration
(add-to-list 'load-path "~/.emacs.d/config")
(load-library "editing")
(load-library "darwin")
(load-library "programming-config")
(load-library "lisp-config")

;; load my favourite theme
(ignore-errors (load-theme 'zenburn t))

; load local configuration if present
(when (file-exists-p "~/.emacs-local.d/local.el")
    (add-to-list 'load-path "~/.emacs-local.d")
    (load-library "local"))

;; varia
(tool-bar-mode -1) ; don't want toolbar on my display
(column-number-mode) ; like to see columns
(show-paren-mode 1) ; match my parens!
