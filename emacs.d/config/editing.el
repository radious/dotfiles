;;;;;;;; TAB ;;;;;;;;
(setq-default indent-tabs-mode nil)     ;; insert spaces instead of tabs
(setq-default tab-width 2)              ;; short tabs, monitors are small
;; (setq indent-line-function 'insert-tab) ;; insert tab when tab key is hit

;;;;;;;; INDENTING ;;;;;;;;
(define-key global-map (kbd "C-j") 'newline)

;;;;;;;; SPELLCHECKING ;;;;;;;;
(setq-default ispell-program-name "/usr/local/bin/aspell") ;; use aspell
(add-hook 'org-mode-hook 'flyspell-mode) ;; flyspell for orgmode by default

;;;;;;;; AUTOCOMPLETE ;;;;;;;;
(when (require 'auto-complete-config nil 'noerror) ; need my ac
  (ac-config-default))

;;;;;;;; GLOBAL HOOKS ;;;;;;;;
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ;; highlight parentheses
(add-hook 'before-save-hook 'delete-trailing-whitespace) ;; delete trailing whitespaces

;;;;;;;; TRAMP ;;;;;;;;
(setq tramp-default-method "ssh")

;;;;;;;; REMOTE LOCALS ;;;;;;;;
;; Enable local dir settings on remote hosts, I want to trust them
