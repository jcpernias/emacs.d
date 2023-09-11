;; init-dired.el -*- lexical-binding: t -*-

;; case insensitive sort in dired
;; (require 'ls-lisp)
;; (setq ls-lisp-use-insert-directory-program nil)
;; (setq ls-lisp-ignore-case 't)
;; (setq ls-lisp-use-string-collate nil)


(let (gls (executable-find "gls"))
  (when gls (setq insert-directory-program gls)))

(use-package diredfl
  :hook (dired-mode . diredfl-global-mode))

(with-eval-after-load 'dired
  (require 'dired-x)
  ;; Set dired-x global variables here.  For example:
  (setq dired-x-hands-off-my-keys nil)
  (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.[^.]")
  (when (eq system-type 'darwin)
    (setq dired-guess-shell-alist-user '(("\\.pdf\\'" "open -a Skim")))))


(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.  For example:
            (dired-omit-mode 1)
            ;; Disable printing from dired
            (keymap-unset dired-mode-map "P")))


(autoload 'dired-jump "dired-x"
  "Jump to Dired buffer corresponding to current buffer." t)

(autoload 'dired-jump-other-window "dired-x"
  "Like \\[dired-jump] (dired-jump) but in other window." t)

(keymap-global-set "C-x C-j" 'dired-jump)
(keymap-global-set "C-x 4 C-j" 'dired-jump-other-window)

;; Disable printig from dired
;; (add-hook 'dired-mode-hook
;;           (lambda()
;;             (keymap-unset dired-mode-map "P")))


(provide 'init-dired)
