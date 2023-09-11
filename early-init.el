;;; Early init file -*- lexical-binding: t -*-

;; Adjust garbage collection thresholds during startup and thereafter
(let ((normal-gc-cons-threshold (* 40 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
	    (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;; Prevent early package inicialization
(setq package-enable-at-startup nil)

;; Remap macOS keys
(when (eq system-type 'darwin)
  (setq mac-function-modifier 'super
	mac-option-modifier 'none
	mac-command-modifier 'meta)
  ;; unset keybinding for printing
  (keymap-global-unset "s-p"))

;; Do not show start up screen
(setq inhibit-startup-screen t)

;; Do not show initial message in scratch buffer
(setq initial-scratch-message nil)

;; Disable scrollbars
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
(if (fboundp 'horizontal-scroll-mode)
    (horizontal-scroll-mode -1))

;; Disable the toolbar
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

;; Disable the menu bar
;; (if (fboundp 'menu-bar-mode)
;;     (menu-bar-mode -1))


;; Which computer is this?
(defvar jcp/laptop-p (string-equal "Christine.local" (system-name))
  "At laptop?")

(defvar jcp/office-p (string-equal "Duke.local" (system-name))
  "At office computer?")

(defvar jcp/home-p (string-equal "Victoria.local" (system-name))
  "At home computer?")

;; Choose device specific defaults

;; (setq jcp/default-font-family "Fira Code Retina")
;; Laptop defaults
(setq jcp/default-font-family "Source Code Pro"
      jcp/default-font-height 150
      jcp/default-frame-height 50
      jcp/default-frame-width 100)

;; Office computer defaults
(if jcp/office-p
    (setq jcp/default-font-height 160
          jcp/default-frame-height 60
          jcp/default-frame-width 110))

;; Home computer defaults
(if jcp/home-p
    (setq jcp/default-frame-height 52
          jcp/default-frame-width 110))

;; Set default font
(set-face-attribute 'default nil :font "Source Code Pro" :height 150 :weight 'normal)

;; Set default frame geometry
(setq default-frame-alist
      '((height . 50)
        (width . 100)
        (vertical-scroll-bars . nil)
        (horizontal-scroll-bars . nil)))
