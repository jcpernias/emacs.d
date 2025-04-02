;; init-avy.el -*- lexical-binding: t -*-

(use-package avy
  :bind (("M-g M-c" . avy-goto-char)
         ("M-g M-s" . avy-goto-char-2)
         ("M-g M-l" . avy-goto-line)
         ("M-g M-w" . avy-goto-word-1)
         ("C-c C-j" . avy-resume))
  :config
  (avy-setup-default))

(provide 'init-avy)
