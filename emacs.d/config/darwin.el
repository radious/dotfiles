;;;;;;;; OS X specific configuration ;;;;;;;;

(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta) ; right cmd is now meta
  (setq mac-right-option-modifier nil) ; right alt is right alt, no modifiers

  ;;;;;;;; FONT ;;;;;;;;
  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "Menlo")

  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly.
  (set-face-attribute 'default nil :height 120))
