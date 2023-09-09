;; init-git.el -*- lexical-binding: t -*-

;; Magit
(use-package magit
  :bind (("C-x g" . magit-status)
         ("C-c g" . magit-dispatch)
         ("C-c f" . magit-file-dispatch))
  :config
  (add-to-list 'magit-no-confirm 'stage-all-changes)
  (setq magit-push-always-verify nil)
  ;; Disable diff before commit
  ;; (global-magit-file-mode)
  (setq vc-handled-backends (delq 'Git vc-handled-backends)))

(provide 'init-git)
