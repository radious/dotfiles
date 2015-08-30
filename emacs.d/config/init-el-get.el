(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(when (eq system-type 'darwin) ;; use makeinfo from homebrew
  (setenv "PATH" (concat "/usr/local/Cellar/texinfo/5.2/bin/:" "/usr/local/bin:" (getenv "PATH")))
  (setq exec-path (append '("/usr/local/Cellar/texinfo/5.2/bin/" "/usr/local/bin") exec-path)))


(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://github.com/dimitri/el-get/raw/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))

(setq
 my:el-get-packages
 '(el-get ; el-get is self hosting
   auto-complete
   color-theme-zenburn
   exec-path-from-shell
   flymake-cursor
   flyspell
   paredit
   rainbow-delimiters
   ;; slime - quicklisp is taking care of it!
))

(when (eq system-type 'darwin) ;; only on my mac workstations
  (setq my:el-get-packages
        (append my:el-get-packages '(geiser quack))))

(el-get 'sync my:el-get-packages)
