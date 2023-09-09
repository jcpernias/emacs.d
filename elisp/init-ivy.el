;; init-ivy.el -*- lexical-binding: t -*-

;; Ivy: see https://www.reddit.com/r/emacs/comments/910pga/tip_how_to_use_ivy_and_its_utilities_in_your/?utm_source=share&utm_medium=web2x

(use-package ivy
  :defer 0.1
  :delight
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :bind (("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-x l" . counsel-locate)
         ("C-c p" . counsel-compile)
         ("C-h f" . counsel-describe-function)
         ("C-h v" . counsel-describe-variable)
         ("C-h l" . counsel-find-library)
         ("C-h y" . counsel-info-lookup-symbol)
         ("C-h u" . counsel-unicode-char)
         ("C-s" . counsel-grep-or-swiper)
         ("C-r" . counsel-grep-or-swiper-backward)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("C-x B" . ivy-switch-buffer-other-window)
         ("C-x B" . ivy-switch-buffer-other-window))

  :init
  (setq ivy-use-selectable-prompt t)
  :config
  (ivy-mode))

(use-package swiper
   :after ivy)

(use-package counsel
  :delight
  :after swiper
  :config (counsel-mode))

(use-package ivy-rich
  :after counsel
  :init
  (setq ivy-virtual-abbreviate 'full
	ivy-rich-path-style 'abbrev)
  :config
  (ivy-rich-mode 1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))


(provide 'init-ivy)
