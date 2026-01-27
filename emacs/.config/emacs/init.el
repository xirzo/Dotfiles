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
  (define-key evil-normal-state-map (kbd "C-c r") 'recompile)
  ;; Russian Keybindings
  (cl-loop for (rus . eng) in
           '((?й . ?q) (?ц . ?w) (?у . ?e) (?к . ?r) (?е . ?t) (?н . ?y) (?г . ?u) (?ш . ?i) (?щ . ?o) (?з . ?p) (?х . ?\[) (?ъ . ?\])
             (?ф . ?a) (?ы . ?s) (?в . ?d) (?а . ?f) (?п . ?g) (?р . ?h) (?о . ?j) (?л . ?k) (?д . ?l) (?ж . ?\;) (?э . ?\')
             (?я . ?z) (?ч . ?x) (?с . ?c) (?м . ?v) (?и . ?b) (?т . ?n) (?ь . ?m) (?б . ?\,) (?ю . ?\.))
           do
           (define-key evil-normal-state-map (char-to-string rus) (char-to-string eng))
           (define-key evil-motion-state-map (char-to-string rus) (char-to-string eng))
           (define-key evil-visual-state-map (char-to-string rus) (char-to-string eng))))

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

(use-package eaf
  :load-path "~/.config/emacs/lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (defalias 'browse-web #'eaf-open-browser)

  (require 'eaf-pdf-viewer)
  (require 'eaf-browser)

  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding) ;; unbind, see more in the Wiki
  ) 

(use-package websocket)
(use-package typst-preview
  :load-path "~/.config/emacs/lisp/typst-preview/"
  :init
  (setq typst-preview-autostart t)
  (setq typst-preview-open-browser-automatically t)

  :custom
  (typst-preview-browser "eaf-browser")
  (typst-preview-invert-colors "auto")
  (typst-preview-executable "/usr/sbin/tinymist")
  (typst-preview-partial-rendering t)
  
  :config
  (define-key typst-preview-mode-map (kbd "C-c C-j") 'typst-preview-send-position))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(eaf elixir-mode evil-collection gruber-darker-theme reverse-im
	 typst-preview typst-ts-mode websocket)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
