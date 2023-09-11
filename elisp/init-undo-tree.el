;; init-undo-tree.el -*- lexical-binding: t -*-

(use-package undo-tree
  :delight
  :demand t
  :bind (("M-z" . undo-tree-undo)
         ("M-Z" . undo-tree-redo))
  :init
  (setq jcp/undo-tree-dir (concat user-emacs-directory "undo-tree"))
  (unless (file-exists-p jcp/undo-tree-dir)
    (make-directory jcp/undo-tree-dir t))
  (setq undo-tree-history-directory-alist (list (cons "."  jcp/undo-tree-dir)))
  :config
  (global-undo-tree-mode 1))

(provide 'init-undo-tree)
