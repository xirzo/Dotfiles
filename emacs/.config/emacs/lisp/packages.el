(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("gnu" . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Ensure packages are installed by default
(setq use-package-always-ensure t)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; Magit
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)))

;; Evil
(use-package evil
  :ensure t
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
  :ensure t
  :config
  (evil-collection-init))

;; Gruber darker theme
(use-package gruber-darker-theme
  :config
  (load-theme 'gruber-darker t))

;; Language Modes
(use-package elixir-mode
  :ensure t)

;; EAF 
(use-package eaf
  :load-path "~/.config/emacs/site-lisp/emacs-application-framework/"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (require 'eaf-image-viewer)
  (require 'eaf-pdf-viewer)
  (require 'eaf-browser)
  (require 'eaf-markdown-previewer)
  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki

