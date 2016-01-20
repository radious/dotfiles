;;; programming-config.el ---                        -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Wojciech Wojtyniak

;;; Code:

;; Ediff should be vertical and not create a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)


;; Load go mode
(let ((goroot "/usr/local/opt/go/libexec/misc/emacs/"))
  (when (file-readable-p goroot)
    (add-to-list 'load-path goroot)
    (add-to-list 'ac-modes 'go-mode)
    (require 'go-mode-load)))

(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook 'electric-pair-mode)

;; Don't use VC
(setq vc-handled-backends 'nil)

;; flymake
(require 'flymake-cursor)  ;; Hoover over error to show help message

(provide 'programming-config)
;;; programming-config.el ends here
