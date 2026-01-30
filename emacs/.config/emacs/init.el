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

;; Compilation mode colorj
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(elixir-mode evil-collection exec-path-from-shell gleam-ts-mode
		 gruber-darker-theme haskell-ts-mode magit
		 typst-preview typst-ts-mode))
 '(package-vc-selected-packages
   '((typst-ts-mode :url
		    "https://codeberg.org/meow_king/typst-ts-mode.git"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
