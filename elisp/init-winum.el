;; init-winum -*- lexical-binding: t -*-

(use-package winum
  :init
  (setq window-numbering-scope 'visible
        winum-reverse-frame-list nil
        winum-auto-assign-0-to-minibuffer t
        winum-assign-func 'my-winum-assign-func
        winum-auto-setup-mode-line t
        winum-format " %s "
        winum-mode-line-position 1
        winum-ignored-buffers '(" *which-key*")
        winum-ignored-buffers-regexp '(" \\*Treemacs-.*"))

  :config
  (winum-mode))

(provide 'init-winum)
