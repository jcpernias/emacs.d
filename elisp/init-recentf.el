;;; init-recentf.el -*- lexical-binding: t -*-

(use-package recentf
      :bind ("C-x C-r" . recentf-open)
      :config
      (setq recentf-max-menu-items 20
            recentf-max-saved-items 500
       )
      :hook (after-init . recentf-mode))


(provide 'init-recentf)
