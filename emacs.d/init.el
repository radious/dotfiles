(when (file-exists-p "~/.emacs-local.d/preload.el")
  (add-to-list 'load-path "~/.emacs-local.d")
  (load-library "preload"))

(add-to-list 'load-path "~/.emacs.d/config")
(load-library "init-el-get") ;; start el-get

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; various configuration
(add-to-list 'load-path "~/.emacs.d/config")
(load-library "general")
(load-library "editing")
(load-library "navigation")
(load-library "darwin")
(load-library "linux")
(load-library "programming-config")
(load-library "lisp-config")

; load local configuration if present
(when (file-exists-p "~/.emacs-local.d/local.el")
    (add-to-list 'load-path "~/.emacs-local.d")
    (load-library "local"))

;; load my favourite theme
;; code is placed here so lack of theme would notify me about errors I might ignore otherwise
(ignore-errors (load-theme 'zenburn t))
