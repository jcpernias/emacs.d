;;; init-recentf.el -*- lexical-binding: t -*-

(add-hook 'after-init-hook 'recentf-mode)

(setq-default
 recentf-max-saved-items 1000
 recentf-exclude `("/tmp/" "/ssh:" ,(concat package-user-dir "/.*-autoloads\\.el\\'")))


(provide 'init-recentf)
