;; init-markdown.el -*- lexical-binding: t -*-

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (;; ("README\\.md\\'" . gfm-mode)
         ;; ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :init
  (setq markdown-enable-math t)

  :config
  (setq markdown-asymmetric-header t)
  (setq markdown-code-block-braces t)
  (setq markdown-command
        (concat
         "/usr/local/bin/pandoc"
         " --from=markdown --to=html"
         " --standalone --mathjax --highlight-style=pygments")))

(provide 'init-markdown)
