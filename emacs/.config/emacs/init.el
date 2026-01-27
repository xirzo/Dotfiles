(load (expand-file-name "lisp/packages.el" user-emacs-directory))

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
  (global-visual-line-mode nil))

;(use-package typst-ts-mode
;  :mode "\\.typ\\'"
;  :init
;  (setq treesit-language-source-alist
;        '((typst "https://github.com/uben0/tree-sitter-typst")))
;  :config
;  (unless (treesit-language-available-p 'typst)
;    (treesit-install-language-grammar 'typst)))
;
;(use-package eaf
;  :load-path "~/.config/emacs/lisp/emacs-application-framework"
;  :custom
;  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
;  (eaf-browser-continue-where-left-off t)
;  (eaf-browser-enable-adblocker t)
;  (browse-url-browser-function 'eaf-open-browser)
;  :config
;  (defalias 'browse-web #'eaf-open-browser)
;
;  (require 'eaf-pdf-viewer)
;  (require 'eaf-browser)
;
;  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;  (eaf-bind-key nil "M-q" eaf-browser-keybinding) ;; unbind, see more in the Wiki
;  ) 
;
;(use-package websocket)
;(use-package typst-preview
;  :load-path "~/.config/emacs/lisp/typst-preview/"
;  :init
;  (setq typst-preview-autostart t)
;  (setq typst-preview-open-browser-automatically t)
;
;  :custom
;  (typst-preview-browser "eaf-browser")
;  (typst-preview-invert-colors "auto")
;  (typst-preview-executable "/usr/sbin/tinymist")
;  (typst-preview-partial-rendering t)
;  
;  :config
;  (define-key typst-preview-mode-map (kbd "C-c C-j") 'typst-preview-send-position))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(evil-collection gruber-darker-theme magit)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
