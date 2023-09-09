;; init-dired.el -*- lexical-binding: t -*-

;; case insensitive sort in dired
(require 'ls-lisp)
(setq ls-lisp-use-insert-directory-program nil)
(setq ls-lisp-ignore-case 't)
(setq ls-lisp-use-string-collate nil)


;; Dired-x
(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            (setq dired-x-hands-off-my-keys nil)
            (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.[^.]")
            (when (eq system-type 'darwin)
              (setq dired-guess-shell-alist-user '(("\\.pdf\\'" "open -a Skim"))))))

(add-hook 'dired-mode-hook
          (lambda ()
            ;; Set dired-x buffer-local variables here.
            (dired-omit-mode 1)))

(autoload 'dired-jump "dired-x"
  "Jump to Dired buffer corresponding to current buffer." t)

(autoload 'dired-jump-other-window "dired-x"
  "Like \\[dired-jump] (dired-jump) but in other window." t)

(keymap-global-set "C-x C-j" 'dired-jump)
(keymap-global-set "C-x 4 C-j" 'dired-jump-other-window)

;; Disable printig from dired
(add-hook 'dired-mode-hook
          (lambda()
            (keymap-unset dired-mode-map "P")))


(provide 'init-dired)
