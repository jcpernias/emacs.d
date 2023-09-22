;; init-compile.el -*- lexical-binding: t -*-

(use-package ansi-color
  :hook (compilation-filter . ansi-color-compilation-filter))

(provide 'init-compile)
