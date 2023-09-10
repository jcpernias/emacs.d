;; init-R.el -*- lexical-binding: t -*-

(use-package ess-site
  :ensure ess
  :commands (R ess-version)

  :init
  (setq ess-ask-for-ess-directory nil)
  (setq ess-help-own-frame 'one)
  ;; uses braces around code block language strings:
  (setq markdown-code-block-braces t)

  :config
  (ess-toggle-underscore nil)

  (add-hook 'ess-mode-hook
            (lambda ()
              (ess-set-style 'Rstudio-)
              ;; (local-set-key [(shift return)] 'my-ess-eval)
              (add-hook 'local-write-file-hooks
                        (lambda ()
                          (ess-nuke-trailing-whitespace)))))

  (add-hook 'inferior-ess-mode-hook
            (lambda()
               (setq comint-scroll-to-bottom-on-input t)
               (setq comint-scroll-to-bottom-on-output t)
               (setq comint-move-point-for-output t)
               (local-set-key [C-up] 'comint-previous-input)
               (local-set-key [C-down] 'comint-next-input))))


(use-package poly-markdown
  :defer t)

(use-package poly-R
  :defer t)

(use-package polymode
  :diminish (poly-org-mode
             poly-gfm+r-mode
             poly-markdown-mode
             poly-noweb+r-mode
             poly-markdown+r-mode
             poly-rapport-mode
             poly-html+r-mode
             poly-brew+r-mode
             poly-r+c++-mode
             poly-c++r-mode)
  :mode (("\\.[rR]md\\'" . poly-gfm+r-mode)
         ("\\.[RS]nw\\'" . poly-noweb+R-mode)
         ("\\.md$" . poly-gfm-mode)
         ("\\.Rcpp$" . poly-r+c++-mode)
         ("\\.cppR$" . poly-c++r-mode)))
  ;; :init
  ;; (require 'poly-R)
  ;; (require 'poly-markdown))

(use-package quarto-mode
  :defer t)
  ;; :mode (("\\.Rmd" . poly-quarto-mode)))

(provide 'init-R)
