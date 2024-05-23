;;; Main init file -*- lexical-binding: t -*-
(add-to-list 'load-path (concat user-emacs-directory "elisp"))


;; Do not clutter init.el with customize settings:
(setq custom-file
      (expand-file-name (concat user-emacs-directory "custom.el")))

(require 'init-use-package)
(when (eq system-type 'darwin)
  (require 'init-exec-path))
(require 'init-themes)
(require 'init-functions)

;; Ask for confirmation when killing emacs
(setq confirm-kill-emacs 'y-or-n-p)

(require 'init-mode-line)

;; Add a newline at the end of files if there is not already one there
(setq require-final-newline t)

;; Delete trailing whitespace before save
(setq delete-trailing-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Use visual line mode in text buffers
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

;; Do not insert tabs
(setq-default indent-tabs-mode nil)

;; Tab stops every 4 columns
(setq default-tab-width 4)

;; Inserted text replaces the selected region
(delete-selection-mode 1)


;; Disable non selected window highlight
(setq-default cursor-in-non-selected-windows nil
      highlight-nonselected-windows nil)

;; Fringes
(setq fringes-outside-margins t)

;; Append the directory names when visiting two files
;; with the same name
(setq uniquify-buffer-name-style 'forward)

;; Do not automatically display async-shell-command output buffer
(add-to-list 'display-buffer-alist
             '("*Async Shell Command*" . (display-buffer-no-window . nil)))


;; Using the clipboard
(setq select-enable-clipboard t
      x-select-enable-clipboard-manager t
      select-enable-primary t
      save-interprogram-paste-before-kill t)

;; Mouse-2 does not move point; it inserts the text at
;; point, regardless of where you clicked or even which
;; of the frame’s windows you clicked on
(setq mouse-yank-at-point t)


;; Disable C-z in graphical environments
(when (display-graphic-p)
  (keymap-global-unset "C-z")
  (keymap-global-unset "C-x C-z"))

;; Rebind toggle-frame-fullscreen
(when (display-graphic-p)
  (keymap-global-unset "<f11>")
  (keymap-global-set "C-c x" 'toggle-frame-fullscreen))

;; Bind zap-up-to-char instead of zap-to-char
(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)
(keymap-global-set "C-c z" 'zap-up-to-char)

;; set keyboard shortcut for restart emacs
(keymap-global-set "C-c r" 'restart-emacs)

;; Some fuctions for quickly changing the width of the current frame:
(defun jcp/set-selected-frame-width (width)
  (set-frame-width (selected-frame) width))

(setq jcp/wide-frame-width 172
      jcp/narrow-frame-width 86)

(defun jcp/widen-frame ()
  "Widens the selected frame"
  (interactive)
  (jcp/set-selected-frame-width jcp/wide-frame-width))

(defun jcp/narrow-frame ()
  "Shrinks the selected frame"
  (interactive)
  (jcp/set-selected-frame-width jcp/narrow-frame-width))

(global-set-key (kbd "C-c w") #'jcp/widen-frame)
(global-set-key (kbd "C-c s") #'jcp/narrow-frame)


;; abbrevs
(setq save-abbrevs t)

;; Backup files
(setq make-backup-files t)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; Save bookmarks every time a bookmark is made or deleted
(setq bookmark-save-flag 1)

;; Enable show-paren mode
(show-paren-mode 1)

;; electric pair mode
(electric-pair-mode 1)
(add-function
 :before-until electric-pair-inhibit-predicate
 (lambda (c)
   (and (eq major-mode 'org-mode)
        (eq c ?<))))

;; Compile
(setq compilation-scroll-output t)

;; apropos
(setq apropos-do-all t)

;; shell
(when (eq system-type 'darwin)
  (setq explicit-shell-file-name "zsh"))

;; save-place
(save-place-mode 1)
(setq save-place-forget-unreadable-files nil)

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-split-window-function 'split-window-horizontally
      ediff-diff-options "-w")

(require 'init-compile)
(require 'init-undo-tree)
(require 'init-avy)
(require 'init-winum)
(require 'init-dired)
(require 'init-spelling)
(require 'init-hippie-expand)
(require 'init-yasnippet)
(require 'init-recentf)
(require 'init-which-key)
(require 'init-org)
(require 'init-git)
(require 'init-ivy)
(require 'init-projectile)
(require 'init-tex)
(require 'init-markdown)
(require 'init-yaml)
(require 'init-csv)
(require 'init-gift)
(require 'init-R)


;; Variables configured via the interactive 'customize' interface
(when (file-exists-p custom-file)
  (load custom-file))

;; Init emacs start
(server-start)



(provide 'init)
