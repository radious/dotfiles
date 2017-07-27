;;; navigation.el --- Easier navigation among windows  -*- lexical-binding: t; -*-

;;;;;;;; ACE Window ;;;;;;;;
(global-set-key (kbd "M-p") 'ace-window)

; Use home row instead of numbers
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
