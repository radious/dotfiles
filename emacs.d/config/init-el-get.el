(add-to-list 'load-path "~/.emacs.d/el-get/el-get")


(when (eq system-type 'darwin) ;; use makeinfo from homebrew
  (setenv "PATH" (concat "/usr/local/Cellar/texinfo/5.2/bin/:" "/usr/local/binL:" (getenv "PATH"))))

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
   flyspell
   geiser
   paredit
   quack
   rainbow-delimiters
   slime
))

(el-get 'sync my:el-get-packages)
