; varia
(tool-bar-mode -1) ; don't want toolbar on my display
(column-number-mode) ; like to see columns
(show-paren-mode 1) ; match my parens!
(setq-default tab-width 4) ; i like it this waytibcrfvvcfrunnfvdbbfknvgdntrdlll

(when (require 'auto-complete-config nil 'noerror) ; need my ac
  (ac-config-default))

; fly-spell
(setq-default ispell-program-name "/usr/local/bin/aspell")
