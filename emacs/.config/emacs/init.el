(require 'package)
(add-to-list 'package-archives
             '(("melpa" . "https://melpa.org/packages/")
               ("nongnu" . "https://elpa.nongnu.org/nongnu/"))
             t)

(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Ensure packages are installed by default
(setq use-package-always-ensure t)

(use-package emacs
  :ensure nil
  :init
  ;; Turn off gui stuff
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (setq inhibit-startup-message t)
  
  ;; Undecorated frame
  (add-to-list 'default-frame-alist '(undecorated . t))
  
  ;; Font
  (add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-17"))

  ;; Line numbers
  (setq display-line-numbers-type 'relative)
  (global-display-line-numbers-mode +1)

  ;; Dired
  (setq dired-dwim-target t)

  ;; Clipboard
  (setq select-enable-clipboard t)

  ;; Visual line mode (Move by visual line, not logical line)
  (global-visual-line-mode t))

;;; Diff / Whitespace Settings
(use-package whitespace
  :ensure nil
  :hook (diff-mode . (lambda ()
                       (setq-local whitespace-style
                                   '(face
                                     tabs
                                     tab-mark
                                     spaces
                                     space-mark
                                     trailing
                                     indentation::space
                                     indentation::tab 
                                     newline 
                                     newline-mark))
                       (whitespace-mode 1))))

;;; Theme
(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

;;; Evil Mode
(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (setq evil-respect-visual-line-mode t)
  :config
  (evil-mode 1)
  (keymap-global-set "<escape>" 'keyboard-escape-quit)
  ;; Compilation shortcuts
  (define-key evil-normal-state-map (kbd "C-c c") 'compile)
  (define-key evil-normal-state-map (kbd "C-c r") 'recompile))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;;; Language Modes
(use-package elixir-mode)

(use-package typst-ts-mode
  :mode "\\.typ\\'"
  :init
  (setq treesit-language-source-alist
        '((typst "https://github.com/uben0/tree-sitter-typst")))
  :config
  (unless (treesit-language-available-p 'typst)
    (treesit-install-language-grammar 'typst)))
