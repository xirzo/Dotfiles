; Turn off gui stuff
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(add-to-list 'default-frame-alist '(undecorated . t))
(setq inhibit-startup-message t)

; Line numbers
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode +1)

; Dired multiple windows move
(setq dired-dwim-target t)

; Show whitespaces
(add-hook 'diff-mode-hook (lambda ()
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
                            (whitespace-mode 1)))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")  t)
(package-initialize)

(setq use-package-always-ensure t)

(setq evil-want-keybinding nil)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'evil-collection)
  (package-install 'evil-collection))

(unless (package-installed-p 'gruber-darker-theme)
  (package-install 'gruber-darker-theme))

(load-theme 'gruber-darker t)

(require 'evil)
(evil-mode 1)
(keymap-global-set "<escape>" 'keyboard-escape-quit)

(require 'evil-collection)
(evil-collection-init)

; TODO: setup keybindings
; (keymap-global-set "C-o" 'execute-extended-command )

(setq select-enable-clipboard t)


(add-to-list 'default-frame-alist
             '(font . "Iosevka Nerd Font-17"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7"
     default))
 '(package-selected-packages '(evil-collection gruber-darker-theme)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
