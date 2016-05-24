(require 'cl-lib)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(let ((extra-paths (cl-remove-if-not 'file-directory-p '("/usr/local/Cellar/texinfo/5.2/bin/" "/usr/local/bin" "/Library/TeX/texbin/"))))
  (setenv "PATH "(mapconcat 'identity (append extra-paths (list (getenv "PATH"))) ":" ))
  (setq exec-path (append extra-paths exec-path)))

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://github.com/dimitri/el-get/raw/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

(setq
 my:el-get-packages
 '(el-get ; el-get is self hosting
   ace-window
   auto-complete
   color-theme-zenburn
   crontab-mode
   exec-path-from-shell
   flymake-cursor
   flyspell
   go-mode
   paredit
   rainbow-delimiters
   toml-mode
   yaml-mode
   ;; slime - quicklisp is taking care of it!
))

;; Breaks sometimes, comented for future reference
;; (when (executable-find "latex")
;;   (setq my:el-get-packages
;;         (append my:el-get-packages '(auctex))))

(when (eq system-type 'darwin) ;; only on my mac workstations
  (setq my:el-get-packages
        (append my:el-get-packages '(geiser quack))))

(el-get 'sync my:el-get-packages)
