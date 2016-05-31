;;; general.el --- General configuration             -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Wojciech Wojtyniak

;; Author: Wojciech Wojtyniak
;; General configuration

;;; Code:

;; Disable tool-bar in graphic mode and menu-bar in console mode
(if (display-graphic-p)
    (tool-bar-mode 0)
  (menu-bar-mode 0))

;; varia
(column-number-mode) ; like to see columns
(show-paren-mode 1) ; match my parens!

(provide 'general)
;;; general.el ends here
