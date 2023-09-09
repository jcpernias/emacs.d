;; init-spelling -*- lexical-binding: t -*-

;; Use aspell
(setq ispell-program-name "aspell")

(when (executable-find ispell-program-name)
  ;; Add spell-checking in comments for all programming language modes
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)

  (with-eval-after-load 'flyspell
    ;; (add-to-list 'flyspell-prog-text-faces 'nxml-text-face)
    ;; (keymap-unset flyspell-mode-map "C-;")
    (keymap-unset flyspell-mode-map "C-.")
    (keymap-set flyspell-mode-map "C-+" 'flyspell-correct-at-point)
    (keymap-set flyspell-mouse-map "<down-mouse-3>" 'flyspell-correct-word)
    (keymap-unset flyspell-mouse-map "<mouse-3>")))

(provide 'init-spelling)
