;;;;;;;; TAB ;;;;;;;;
(setq-default indent-tabs-mode nil)     ;; insert spaces instead of tabs
(setq-default tab-width 2)              ;; short tabs, monitors are small
;; (setq indent-line-function 'insert-tab) ;; insert tab when tab key is hit

;;;;;;;; FONT ;;;;;;;;
(when (eq system-type 'darwin)

  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "Menlo")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly.
  (set-face-attribute 'default nil :height 120))

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

;;;;;;;; BAKUCP ;;;;;;;;
;; Backup remote files locally to stop autosave pain
(setq tramp-backup-directory "~/.emacs-backup")
(unless (file-directory-p tramp-backup-directory)
  (make-directory tramp-backup-directory))
(if (file-accessible-directory-p tramp-backup-directory)
    (setq tramp-auto-save-directory tramp-backup-directory)
  (error "Cannot write to ~/.emacs-backup"))
;; Don't backup su and sudo files
(setq backup-enable-predicate
      (lambda (name)
        (and (normal-backup-enable-predicate name)
             (not
              (let ((method (file-remote-p name 'method)))
                (when (stringp method)
                  (member method '("su" "sudo"))))))))
