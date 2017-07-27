
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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
; (load-library "lisp-config")

; load local configuration if present
(when (file-exists-p "~/.emacs-local.d/local.el")
    (add-to-list 'load-path "~/.emacs-local.d")
    (load-library "local"))

;; load my favourite theme
;; code is placed here so lack of theme would notify me about errors I might ignore otherwise
(ignore-errors (load-theme 'zenburn t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((ispell-dictionary . "pl")
     (epa-file-encrypt-to . wojciech+notatki@wojtyniak\.com)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
