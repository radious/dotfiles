;; mu4e configuration
(provide 'my-mail)
(require 'mu4e)

(setq
 mu4e-mu-binary "/usr/local/bin/mu"
 mu4e-maildir       "~/Maildir" ;; top-level Maildir
 mu4e-get-mail-command "mbsync -a"
 mu4e-update-interval 300
 ;; mu4e-view-show-images t
 message-kill-buffer-on-exit t
 mu4e-use-fancy-chars t
 mu4e-headers-include-related t
 mu4e-attachment-dir  "~/Downloads"
 mail-user-agent 'mu4e-user-agent
 mu4e-change-filenames-when-moving t
 mu4e-compose-format-flowed t
 mu4e-enable-mode-line t
 spaceline-mu4e-alert-segment-p t
 mu4e-alert-interesting-mail-query "flag:unread AND (maildir:\"/fb/inbox\")" ; OR maildir:\"/wojtyniak/inbox\")"
 mu4e-split-view 'vertical
 fill-flowed-display-column nil
 mu4e-user-mail-address-list '("wojciech@wojtyniak.com" "wojtyniak@fb.com"))

(add-to-list 'mu4e-view-actions '("View in browser" . mu4e-action-view-in-browser) t)
(add-hook 'mu4e-compose-mode-hook 'flyspell-mode)
(add-hook 'mu4e-view-mode-hook 'visual-line-mode)

;; Configure sending mail.
(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/local/bin/msmtp"
      user-full-name "Wojciech Wojtyniak")

;; Use the correct account context when sending mail based on the from header.
(setq message-sendmail-envelope-from 'header)
(add-hook 'message-send-mail-hook 'choose-msmtp-account)
(defun mu4e-message-maildir-matches (msg rx)
  (when rx
    (if (listp rx)
        ;; if rx is a list, try each one for a match
        (or (mu4e-message-maildir-matches msg (car rx))
            (mu4e-message-maildir-matches msg (cdr rx)))
      ;; not a list, check rx
      (string-match rx (mu4e-message-field msg :maildir)))))

;; Choose account label to feed msmtp -a option based on From header
;; in Message buffer; This function must be added to
;; message-send-mail-hook for on-the-fly change of From address before
;; sending message since message-send-mail-hook is processed right
;; before sending message.
(defun choose-msmtp-account ()
  (if (message-mail-p)
      (save-excursion
        (let*
            ((from (save-restriction
                     (message-narrow-to-headers)
                     (message-fetch-field "from")))
             (account
              (cond
               ((string-match "wojtyniak@fb.com" from) "fb")
               ((string-match "wojciech@wojtyniak.com" from) "wojtyniak"))))
          (setq message-sendmail-extra-arguments (list '"-a" account))))))

(setq wojtyniak-context
      (make-mu4e-context
       :name "wojtyniak"
       :enter-func (lambda () (mu4e-message "Switching to wojciech@wojtyniak.com account"))
       :match-func (lambda (msg)
                     (when msg
                       (mu4e-message-maildir-matches msg "^/wojtyniak")))
       :vars '((user-mail-address . "wojciech@wojtyniak.com")
               (mu4e-drafts-folder . "/wojtyniak/Drafts")
               (mu4e-sent-folder . "/wojtyniak/Sent Items")
               (mu4e-trash-folder . "/wojtyniak/Trash")
               (mu4e-refile-folder . "/wojtyniak/Archive")
               (mu4e-compose-signature . "Wojciech Wojtyniak"))))
(setq fb-context
      (make-mu4e-context
       :name "fb"
       :enter-func (lambda () (mu4e-message "Switching to wojtyniak@fb.com account"))
       :match-func (lambda (msg)
                     (when msg
                       (mu4e-message-maildir-matches msg "^/fb")))
       :vars '((user-mail-address . "wojtyniak@fb.com")
               (mu4e-drafts-folder . "/fb/Drafts")
               (mu4e-sent-folder . "/fb/Sent Items")
               (mu4e-trash-folder . "/fb/Archive")
               (mu4e-refile-folder . "/fb/Archive")
               (mu4e-compose-signature . "Wojciech Wojtyniak
Production Engineering Security
Facebook"))))

(setq mu4e-contexts
      (list wojtyniak-context fb-context))

