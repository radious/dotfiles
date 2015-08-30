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

;; Don't use VC
(setq vc-handled-backends 'nil)

;; flymake
(require 'flymake-cursor)  ;; Hoover over error to show help message

;; use pyflakes for Python
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

(add-hook 'python-mode-hook 'flymake-mode)

(provide 'programming-config)
;;; programming-config.el ends here
