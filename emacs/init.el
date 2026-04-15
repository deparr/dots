;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

  ;; (setq custom-file "~/.emacs.d/custom.el") ;; unsure of what this is used for
(use-package emacs
  :init
  (setq custom-file "~/.emacs.d/custom.el")

  ; (cua-mode 1) ;; not sure if I'd want this
  (recentf-mode t)
  (blink-cursor-mode 0) ;; no blink
  (delete-selection-mode t)
  (electric-pair-mode t)

  (setq gc-cons-threshold (* 100 1000 1000))
  (setq gc-cons-percentage 0.6)

  (run-with-timer 0 3600 (lambda () (malloc-trim 0)))
  (midnight-mode t) ;; offload buffers nightly

  (global-auto-revert-mode t)
  (setq global-auto-revert-non-file-buffers t)

  ;; (winner-mode t) ;; undo/redo layout changes
  (auto-save-mode -1) ;; disable auto-save

  ;; kill vterm buffers without asking
  (setq kill-buffer-query-functions nil)

  ;; copy on selection
  (setq mouse-drag-copy-region t)


  (which-key-mode t)

  (setq-default
    indent-tabs-mode nil
    tab-width 4)

  (setq
    make-backup-files nil ; no ~ backup files
    auto-save-default nil ; no #autosave# files
    ring-bell-function 'ignore)
  (setq even-window-sizes nil)

  :custom
  (use-short-answers t) ;; y or n
  (inhibit-startup-message t) ;; no startup screen
  (initial-scratch-message nil) ;; remove startup message
  (dired-mouse-drag-files t) ;; drag and drop from emacs

  :hook
  (prog-mode . hl-line-mode)
  (prog-mode . display-line-numbers-mode)
  (prog-mode . show-paren-mode)

  :bind
  ("C--" . text-scale-decrease)
  ("C-=" . text-scale-increase))

(use-package treesit-auto
  :ensure t
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode)
  :custom
  (treesit-auto-install 'prompt))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)   ; required for evil-collection
  (setq evil-want-C-u-scroll t)     ; C-u scrolls up like in Vim
  (setq evil-undo-system 'undo-redo) ; uses Emacs 28+ native undo
  :config
  (evil-mode 1))

;; Evil bindings for common Emacs modes (magit, dired, help, etc.)
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; gc/gcc to comment lines (like vim-commentary)
(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))

(use-package magit
  :ensure t)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :init
  (load-theme 'sanityinc-tomorrow-night t)
  :config
  ;; Better font rendering on Linux
  (setq x-use-underline-position-properties t)
  (setq underline-minimum-offset 1)

  ;; Pixel-precise font rendering
  (setq frame-resize-pixelwise t)
  (setq window-resize-pixelwise t)

  ;; Font settings
  (set-face-attribute 'default nil
                      :font "IBM Plex Mono Text"
                      :height 120
                      ;; :height 180
                      :weight 'regular)

  ;; Use different weights for emphasis
  (set-face-attribute 'bold nil :weight 'semibold)
  (set-face-attribute 'italic nil :slant 'italic)

  ;; Ensure proper emoji rendering with fallback
  (set-fontset-font t 'symbol "Noto Color Emoji" nil 'prepend)
  (set-fontset-font t 'unicode "Noto Color Emoji" nil 'append)

  ;; Make mode-line half height
  (set-face-attribute 'mode-line nil :height 120)
  (set-face-attribute 'mode-line-inactive nil :height 120)

  (menu-bar-mode 0)
  (scroll-bar-mode 0)
  (tool-bar-mode 0)
  (fringe-mode 0))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic)))

(use-package vterm
  :defer t
  :custom
  (vterm-max-scrollback 5000)
  (vterm-timer-delay 0.01)
  (vterm-buffer-name-string "vterm %s")
  (vterm-shell "zsh"))

(use-package eglot
  :custom
  ;; shutdown eglot servers after buffer is closed
  (eglot-autoshutdown t))

(use-package rust-mode
  :ensure t
  :mode "\\.rs\\'"
  :hook
  (rust-ts-mode . eglot-ensure))

(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :custom
  (go-ts-mode-indent-offset 4)
  :config
  (setq-default tab-width 4)
  :hook
  (go-ts-mode . eglot-ensure))

(use-package python-mode
  :ensure t
  :config
  (setenv "PYTHONENCODING" "utf-8")
  (setq python-indent-offset 4)
  :hook
  (python-ts-mode . eglot-ensure))
