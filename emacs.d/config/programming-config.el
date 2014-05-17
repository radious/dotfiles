;;; programming-config.el ---                        -*- lexical-binding: t; -*-

;; Copyright (C) 2014  Wojciech Wojtyniak

;;; Code:

;; Ediff should be vertical and not create a new frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

(provide 'programming-config)
;;; programming-config.el ends here
