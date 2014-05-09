;;; lisp-config.el --- Local lisp & slime configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2013  Wojciech Wojtyniak

;;; Code:
(when (file-exists-p "~/quicklisp/slime-helper.el")
  (load (expand-file-name "~/quicklisp/slime-helper.el")))
(setq inferior-lisp-program "/usr/local/bin/clisp")

;;; run paredit with slime
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'slime-mode-hook (lambda () (paredit-mode +1)))
;;; Stop SLIME's REPL from grabbing DEL,
;;; which is annoying when backspacing over a '('
;; (defun override-slime-repl-bindings-with-paredit ()
;;   (define-key slime-repl-mode-map
;;     (read-kbd-macro paredit-backward-delete-key) nil))
;; (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(provide 'lisp-config)
;;; lisp-config.el ends here
