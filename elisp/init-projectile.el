;; init-projectile.el -*- lexical-binding: t -*-


(use-package projectile
  :delight '(:eval (format " [%s]" (projectile-project-name)))
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map))
  :init
  (setq projectile-completion-system 'ivy)
  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-project-search-path '(("~/Projects" . 1)))
  :config
  (projectile-global-mode 1))

(use-package counsel-projectile
  :config
  (counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((default counsel-projectile-switch-project-action-dired)))
  (counsel-projectile-mode))

(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read))
  :commands (org-projectile-open-project)
  :config
  (progn
    (setq org-projectile-projects-file
          (concat org-directory "/projects.org"))
    (ensure-file org-projectile-projects-file)
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (push (org-projectile-project-todo-entry) org-capture-templates)))

(provide 'init-projectile)
