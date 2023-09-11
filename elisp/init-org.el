;; init-org.el -*- lexical-binding: t -*-


;; htmlize exports the contents of an Emacs buffer to HTML
;; preserving display properties such as colors, fonts, underlining,
;; etc.
(use-package htmlize)


(use-package org
  :ensure t
  :mode ("\\.org$" . org-mode)
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)
         ("C-c b" . org-switchb))
  :init
  (setq org-export-backends '(ascii html md beamer))

  :config
  ;; Org directory
  (let ((dir "~/Documents/org"))
    (make-directory dir :parents)
    (setq org-directory dir))

  ;; Org notes file
  (setq org-default-notes-file (concat org-directory "/notes.org"))
  (jcp/ensure-file org-default-notes-file)

  ;; Org agenda file list
  (setq org-agenda-files
        (mapcar (lambda (x) (concat org-directory x))
                '("/notes.org"
                  "/work.org"
                  "/teaching.org"
                  "/home.org")))

  (dolist (path org-agenda-files)
    (jcp/ensure-file path))

  (setq org-src-fontify-natively t
        org-src-tab-acts-natively t
        org-list-allow-alphabetical t
        org-use-speed-commands t
        org-log-done t)

  (set-face-attribute 'org-level-1 nil :height 1.75)
  (set-face-attribute 'org-level-2 nil :height 1.5)
  (set-face-attribute 'org-level-3 nil :height 1.25)
  (set-face-attribute 'org-level-4 nil :height 1.1)
  (set-face-attribute 'org-document-title nil :height 2.0)

  ;; Htmlize with css. See the documentation of this variable:
  (setq org-html-htmlize-output-type 'css)
  (add-to-list 'safe-local-variable-values
               '(org-html-head-include-scripts . nil))

  ;; activate block snippets
  (require 'org-tempo)

  ;; active Babel languages
  (require 'ob-R)
  (require 'ob-latex)
  (add-to-list 'org-babel-noweb-error-langs "latex")

  (defun my-org-confirm-babel-evaluate (lang body)
    (not (string-match "^\\(R\\|emacs-lisp\\)$" lang)))
  (setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

  ;; Non-nil means ask for confirmation before executing Emacs Lisp
  ;; links.  Elisp links can be dangerous. Therefore we advise against
  ;; setting this variable to nil.  Just change it to ‘y-or-n-p’ if
  ;; you want to confirm with a single keystroke rather than having to
  ;; type "yes".
  (setq org-confirm-elisp-link-function 'y-or-n-p)

  (setq org-file-apps
        '((auto-mode . emacs)
          ("\\.mm\\'" . default)
          ("\\.x?html?\\'" . default)
          ("\\.pdf\\'" . "open -a Preview %s")
          ;; ("\\.pdf\\'" . "evince %s")
          ))
  ;; Do not center latex images by default
  (setq org-latex-images-centered nil)
  ;; Use texi2dvi to compile latex files
  (setq org-latex-pdf-process (quote ("LATEX=%latex texi2dvi -b -V %f"))))

(use-package org-bullets
  :ensure t
  :hook
  (org-mode . org-bullets-mode))

(provide 'init-org)
