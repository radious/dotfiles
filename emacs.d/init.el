; initialize packages
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

; keys for OS X
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta) ; right cmd is now meta
  (setq mac-right-option-modifier nil) ; right alt is right alt, no modifiers
  (set-face-attribute 'default nil :height 120))

; various configuration
(add-to-list 'load-path "~/.emacs.d/config")
(load-library "lisp-config")
(load-library "varia")
(ignore-errors (load-theme 'zenburn t))

; load other if present
(when (file-exists-p "~/.emacs-local.d/local.el")
    (add-to-list 'load-path "~/.emacs-local.d")
    (load-library "local"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((markdown-mode t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
