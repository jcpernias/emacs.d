;; init-mode-line.el -*- lexical-binding: t -*-

;; Line and column numbers in the modeline
(setq line-number-mode t
      column-number-mode t)

(use-package mode-line-bell
  :hook (after-init . mode-line-bell-mode))

(use-package delight
  :config
  (delight '((abbrev-mode " Abv" abbrev)
             (eldoc-mode nil "eldoc")
             (overwrite-mode " Ov" t)
             (flyspell-mode " Spell" flyspell)
             (auto-revert-mode nil autorevert)
             (lisp-interaction-mode "li" :major)
             (emacs-lisp-mode "el" :major))))

(provide 'init-mode-line)
