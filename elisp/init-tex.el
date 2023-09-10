;; init-tex.el -*- lexical-binding: t -*-

;; RefTeX
(use-package reftex
  :commands (reftex-mode turn-on-reftex)
  :config
  (setq reftex-enable-partial-scans t)
  (setq reftex-save-parse-info t)
  (setq reftex-use-multiple-selection-buffers t)

  ;; Make TeX and RefTex aware of Snw and Rnw files
  (setq reftex-file-extensions
        '(("Snw" "Rnw" "nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
  (setq reftex-plug-into-AUCTeX t))

;; AUCTeX
(use-package tex-site
  :defer t
  :ensure auctex
  :hook
  (((LaTeX-mode latex-mode) . turn-on-reftex)
   (LaTeX-mode . auto-fill-mode)
   (LaTeX-mode . visual-line-mode)
   (LaTeX-mode . LaTeX-math-mode)
   (LaTeX-mode . turn-on-bib-cite))
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq TeX-PDF-mode t)
  (setq ess-swv-plug-into-AUCTeX-p t)

  (setq TeX-auto-global "~/local/var/auctex/")
  (setq TeX-auto-local ".Auto/")
  (setq TeX-style-private (expand-file-name "~/.emacs.d/auctex-styles"))
  (setq TeX-electric-sub-and-superscript t)

  ;; Fontification of macros
  (setq font-latex-match-reference-keywords
        '(
          ;; changes
          ("added" "[{")
          ("deleted" "[{")
          ("replaced" "[{{")
          ("comment" "[{")
          ("highlight" "[{")
          ))

  ;; Default pdf viewer
  (setq TeX-view-program-list
        '(("Preview" "open -a Preview %o")
          ("Skim" "open -a Skim %o")))
  (setq TeX-view-program-selection '((output-pdf "Skim")))

  ;; Turn on source correlation
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
  (setq TeX-source-correlate-start-server t)

  ;; Make TeX and RefTex aware of Snw and Rnw files
  (setq TeX-file-extensions
        '("Snw" "Rnw" "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo")))

(provide 'init-tex)
