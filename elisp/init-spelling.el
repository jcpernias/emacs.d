;; init-spelling.el -*- lexical-binding: t -*-

;; Use aspell
(setq ispell-program-name "aspell"
      ispell-dictionary "english")

(when (executable-find ispell-program-name)
  ;; Add spell-checking in comments for all programming language modes
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'text-mode-hook 'flyspell-mode))

(with-eval-after-load 'flyspell
  (setq flyspell-issue-message-flag nil)
  ;; (add-to-list 'flyspell-prog-text-faces 'nxml-text-face)
  ;; (keymap-unset flyspell-mode-map "C-;")
  (keymap-unset flyspell-mode-map "C-.")
  (keymap-set flyspell-mode-map "C-+" 'flyspell-correct-at-point)
  (keymap-set flyspell-mouse-map "<down-mouse-3>" 'flyspell-correct-word)
  (keymap-unset flyspell-mouse-map "<mouse-3>"))

(provide 'init-spelling)
