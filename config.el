;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Zhi Han Lim"
      user-mail-address "zhihanlim43@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Hack" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq org-hide-emphasis-markers t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Org-mode
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory "/mnt/c/Users/ZhiHa/GoogleDrive/HomeBase/")
(setq org-startup-folded `content)

(after! org
  (setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "ONHOLD(h)" "|" "DONE(d)" "CANCELLED(c)")))
  (setq org-log-done 'time)
  (setq org-startup-align-all-tables t))


;; Org-roam
(setq org-roam-directory "/mnt/c/Users/ZhiHa/GoogleDrive/HomeBase/")
(setq org-roam-tag-sources `(prop all-directories))

(setq org-roam-capture-templates
      '(("n" "notes" plain (function org-roam--capture-get-point)
         "%?"
         :file-name "notes/${slug}"
         :head "#+TITLE: ${title}\ntags::"
         :unnarrowed t)
        ("j" "journal tag" plain (function org-roam--capture-get-point)
         "%?"
         :file-name "journal/tags/${slug}"
         :head "#+TITLE: ${title}\ntags::"
         :unnarrowed t)))

;; Org-journal
(require `org-journal)
(setq org-journal-dir "/mnt/c/Users/ZhiHa/GoogleDrive/HomeBase/journal/")
(setq org-journal-file-header "#+TITLE: \n")
(setq org-journal-file-type 'monthly)
(setq org-journal-file-format "%Y-%m-%d.org")
(setq org-journal-date-format "%B %d, %Y (%A)")

(map! :leader
      (:prefix ("j" . "journal") ;; org-journal bindings
        :desc "Create new journal entry" "j" #'org-journal-new-entry
        :desc "Open previous entry" "p" #'org-journal-open-previous-entry
        :desc "Open next entry" "n" #'org-journal-open-next-entry
        :desc "Search journal" "s" #'org-journal-search-forever))

(map!
 (:map calendar-mode-map
   :n "o" #'org-journal-display-entry
   :n "p" #'org-journal-previous-entry
   :n "n" #'org-journal-next-entry
   :n "O" #'org-journal-new-date-entry))

;; Org-roam-server
(use-package org-roam-server
  :load-path "/mnt/c/Users/ZhiHa/GoogleDrive/HomeBase/roam_server/")

;; Deft
(setq deft-directory "/mnt/c/Users/ZhiHa/GoogleDrive/HomeBase/")
(setq deft-extensions '("org"))
(setq deft-recursive t)

;; Avy
(setq avy-timeout-seconds 0.2)

;; Org Encrypt
(map! :leader
      (:prefix ("e" . "encryption") ;; org-journal bindings
        :desc "Encrypt Entry" "e" #'org-encrypt-entry
        :desc "Decrypt Entry" "d" #'org-decrypt-entry))

(setq python-shell-interpreter "python3")

(setq-default epa-file-cache-passphrase-for-symmetric-encryption t)

