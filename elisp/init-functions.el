;; init-functions.el -*- lexical-binding: t -*-

(defun jcp/ensure-file (path)
  "Create an empty file PATH if not exists yet"
  (unless (file-exists-p path)
    (make-empty-file path t)))

(provide 'init-functions)
