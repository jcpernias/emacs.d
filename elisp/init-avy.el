;; init-avy.el -*- lexical-binding: t -*-

(use-package avy
  :bind (("C-c ." . avy-goto-char)
         ("C-c '" . avy-goto-char-2)
         ("M-g g" . avy-goto-line)
         ("M-g w" . avy-goto-word-1)
         ("C-c C-j" . avy-resume))
  :config
  (avy-setup-default))

(provide 'init-avy)
