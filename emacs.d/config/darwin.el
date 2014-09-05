;;;;;;;; OS X specific configuration ;;;;;;;;

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta) ; right cmd is now meta
  (setq mac-right-option-modifier nil) ; right alt is right alt, no modifiers
  (set-face-attribute 'default nil :height 120))
