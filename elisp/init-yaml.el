;; init-yaml.el -*- lexical-binding: t -*-

(use-package yaml-mode
  :mode "\\.yml\\'"
  :config
  (add-hook 'yaml-mode-hook
      (lambda ()
         (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

(provide 'init-yaml)
