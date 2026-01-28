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

;; TODO: bind russian keys to evil

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
  (define-key evil-normal-state-map (kbd "C-c r") 'recompile)

  ;; Soruce for cyrillic keybindings:
  ;; https://github.com/artempyanykh/evil-russian

  ;; normal state map
  (define-key evil-normal-state-map "ф" 'evil-append)
  (define-key evil-normal-state-map "Ф" 'evil-append-line)
  (define-key evil-normal-state-map "с" 'evil-change)
  (define-key evil-normal-state-map "С" 'evil-change-line)
  (define-key evil-normal-state-map "в" 'evil-delete)
  (define-key evil-normal-state-map "В" 'evil-delete-line)
  (define-key evil-normal-state-map "ш" 'evil-insert)
  (define-key evil-normal-state-map "Ш" 'evil-insert-line)
  (define-key evil-normal-state-map "О" 'evil-join)
  (define-key evil-normal-state-map "ь" 'evil-set-marker)
  (define-key evil-normal-state-map "щ" 'evil-open-below)
  (define-key evil-normal-state-map "Щ" 'evil-open-above)
  (define-key evil-normal-state-map "з" 'evil-paste-after)
  (define-key evil-normal-state-map "З" 'evil-paste-before)
  (define-key evil-normal-state-map "й" 'evil-record-macro)
  (define-key evil-normal-state-map "к" 'evil-replace)
  (define-key evil-normal-state-map "К" 'evil-replace-state)
  (define-key evil-normal-state-map "ы" 'evil-substitute)
  (define-key evil-normal-state-map "Ы" 'evil-change-whole-line)
  (define-key evil-normal-state-map "ч" 'evil-delete-char)
  (define-key evil-normal-state-map "Ч" 'evil-delete-backward-char)
  (define-key evil-normal-state-map "н" 'evil-yank)
  (define-key evil-normal-state-map "Н" 'evil-yank-line)
  (define-key evil-normal-state-map "п8" 'what-cursor-position)
  (define-key evil-normal-state-map "пф" 'what-cursor-position)
  (define-key evil-normal-state-map "пш" 'evil-insert-resume)
  (define-key evil-normal-state-map "пО" 'evil-join-whitespace)
  (define-key evil-normal-state-map "пй" 'evil-fill)
  (define-key evil-normal-state-map "пг" 'evil-downcase)
  (define-key evil-normal-state-map "пГ" 'evil-upcase)
  (define-key evil-normal-state-map "па" 'find-file-at-point)
  (define-key evil-normal-state-map "пА" 'evil-find-file-at-point-with-line)
  (define-key evil-normal-state-map "п," 'evil-rot13)
  (define-key evil-normal-state-map "Б" 'evil-shift-left)
  (define-key evil-normal-state-map "Ю" 'evil-shift-right)

  ;; Motion state map
  (define-key evil-motion-state-map "и" 'evil-backward-word-begin)
  (define-key evil-motion-state-map "И" 'evil-backward-WORD-begin)
  (define-key evil-motion-state-map "у" 'evil-forward-word-end)
  (define-key evil-motion-state-map "У" 'evil-forward-WORD-end)
  (define-key evil-motion-state-map "а" 'evil-find-char)
  (define-key evil-motion-state-map "А" 'evil-find-char-backward)
  (define-key evil-motion-state-map "П" 'evil-goto-line)
  (define-key evil-motion-state-map "р" 'evil-backward-char)
  (define-key evil-motion-state-map "Р" 'evil-window-top)

  (define-key evil-motion-state-map "о" 'evil-next-visual-line)
  (define-key evil-motion-state-map "л" 'evil-previous-visual-line)
  (define-key evil-motion-state-map "0" 'evil-beginning-of-line)
  ;; (define-key evil-motion-state-map "п;" 'evil-end-of-line) ;; to not clash with regular ;
  (define-key evil-motion-state-map ";" 'evil-end-of-line)

  (define-key evil-motion-state-map "д" 'evil-forward-char)
  (define-key evil-motion-state-map "Л" 'evil-lookup)
  (define-key evil-motion-state-map "Д" 'evil-window-bottom)
  (define-key evil-motion-state-map "Ь" 'evil-window-middle)
  (define-key evil-motion-state-map "т" 'evil-search-next)
  (define-key evil-motion-state-map "Т" 'evil-search-previous)
  (define-key evil-motion-state-map "е" 'evil-find-char-to)
  (define-key evil-motion-state-map "Е" 'evil-find-char-to-backward)
  (define-key evil-motion-state-map "ц" 'evil-forward-word-begin)
  (define-key evil-motion-state-map "Ц" 'evil-forward-WORD-begin)
  (define-key evil-motion-state-map "пв" 'evil-goto-definition)
  (define-key evil-motion-state-map "пу" 'evil-backward-word-end)
  (define-key evil-motion-state-map "пУ" 'evil-backward-WORD-end)
  (define-key evil-motion-state-map "пп" 'evil-goto-first-line)

  (define-key evil-motion-state-map "по" 'evil-next-visual-line)
  (define-key evil-motion-state-map "пл" 'evil-previous-visual-line)
  (define-key evil-motion-state-map "п0" 'evil-beginning-of-visual-line)

  (define-key evil-motion-state-map "п_" 'evil-last-non-blank)
  (define-key evil-motion-state-map "п:" 'evil-first-non-blank-of-visual-line)
  (define-key evil-motion-state-map "Х" 'evil-backward-paragraph)
  (define-key evil-motion-state-map "Ъ" 'evil-forward-paragraph)
  (define-key evil-motion-state-map (kbd "C-ц") 'evil-window-map)
  (define-key evil-motion-state-map (kbd "C-и") 'evil-scroll-page-up)
  (define-key evil-motion-state-map (kbd "C-в") 'evil-scroll-down)
  (define-key evil-motion-state-map (kbd "C-у") 'evil-scroll-line-down)
  (define-key evil-motion-state-map (kbd "C-а") 'evil-scroll-page-down)
  (define-key evil-motion-state-map (kbd "C-щ") 'evil-jump-backward)
  (define-key evil-motion-state-map (kbd "C-н") 'evil-scroll-line-up)
  (define-key evil-motion-state-map "яе" 'evil-scroll-line-to-top)
  (define-key evil-motion-state-map "яя" 'evil-scroll-line-to-center)
  (define-key evil-motion-state-map "яи" 'evil-scroll-line-to-bottom)
  (define-key evil-motion-state-map "м" 'evil-visual-char)
  (define-key evil-motion-state-map "М" 'evil-visual-line)
  (define-key evil-motion-state-map (kbd "C-м") 'evil-visual-block)
  (define-key evil-motion-state-map "пм" 'evil-visual-restore)
  (define-key evil-motion-state-map "яд" 'evil-scroll-column-right)
  (define-key evil-motion-state-map "яр" 'evil-scroll-column-left)
  (define-key evil-motion-state-map "яД" 'evil-scroll-right)
  (define-key evil-motion-state-map "яР" 'evil-scroll-left)

  ;; Text objects (outer)
  (define-key evil-outer-text-objects-map "ц" 'evil-a-word)
  (define-key evil-outer-text-objects-map "Ц" 'evil-a-WORD)
  (define-key evil-outer-text-objects-map "ы" 'evil-a-sentence)
  (define-key evil-outer-text-objects-map "з" 'evil-a-paragraph)
  (define-key evil-outer-text-objects-map "и" 'evil-a-paren)
  (define-key evil-outer-text-objects-map "И" 'evil-a-curly)
  (define-key evil-outer-text-objects-map "Б" 'evil-an-angle)
  (define-key evil-outer-text-objects-map "Ю" 'evil-an-angle)
  (define-key evil-outer-text-objects-map "е" 'evil-a-tag)

  ;; Text object (inner)
  (define-key evil-inner-text-objects-map "ц" 'evil-inner-word)
  (define-key evil-inner-text-objects-map "Ц" 'evil-inner-WORD)
  (define-key evil-inner-text-objects-map "ы" 'evil-inner-sentence)
  (define-key evil-inner-text-objects-map "з" 'evil-inner-paragraph)
  (define-key evil-inner-text-objects-map "и" 'evil-inner-paren)
  (define-key evil-inner-text-objects-map "И" 'evil-inner-curly)
  (define-key evil-inner-text-objects-map "Б" 'evil-inner-angle)
  (define-key evil-inner-text-objects-map "Ю" 'evil-inner-angle)
  (define-key evil-inner-text-objects-map "е" 'evil-inner-tag)

  ;; Visual state map
  (define-key evil-visual-state-map "Ф" 'evil-append)
  (define-key evil-visual-state-map "Ш" 'evil-insert)
  (define-key evil-visual-state-map "щ" 'exchange-point-and-mark)
  (define-key evil-visual-state-map "Щ" 'evil-visual-exchange-corners)
  (define-key evil-visual-state-map "К" 'evil-change)
  (define-key evil-visual-state-map "г" 'evil-downcase)
  (define-key evil-visual-state-map "Г" 'evil-upcase)
  (define-key evil-visual-state-map "ф" evil-outer-text-objects-map)
  (define-key evil-visual-state-map "ш" evil-inner-text-objects-map)

  ;; Operator pending state map
  (define-key evil-operator-state-map "ф" evil-outer-text-objects-map)
  (define-key evil-operator-state-map "ш" evil-inner-text-objects-map)

  ;; Undo
  (define-key evil-normal-state-map "г" 'undo)
  (define-key evil-normal-state-map (kbd "C-к") 'redo)

  ;; Window map
  (define-key evil-window-map "и" 'evil-window-bottom-right)
  (define-key evil-window-map "с" 'evil-window-delete)
  (define-key evil-window-map "р" 'evil-window-left)
  (define-key evil-window-map "Р" 'evil-window-move-far-left)
  (define-key evil-window-map "о" 'evil-window-down)
  (define-key evil-window-map "О" 'evil-window-move-very-bottom)
  (define-key evil-window-map "л" 'evil-window-up)
  (define-key evil-window-map "Л" 'evil-window-move-very-top)
  (define-key evil-window-map "д" 'evil-window-right)
  (define-key evil-window-map "Д" 'evil-window-move-far-right)
  (define-key evil-window-map "т" 'evil-window-new)
  (define-key evil-window-map "щ" 'delete-other-windows)
  (define-key evil-window-map "з" 'evil-window-mru)
  (define-key evil-window-map "к" 'evil-window-rotate-downwards)
  (define-key evil-window-map "К" 'evil-window-rotate-upwards)
  (define-key evil-window-map "ы" 'evil-window-split)
  (define-key evil-window-map "Ы" 'evil-window-split)
  (define-key evil-window-map "е" 'evil-window-top-left)
  (define-key evil-window-map "м" 'evil-window-vsplit)
  (define-key evil-window-map "ц" 'evil-window-next)
  (define-key evil-window-map "Ц" 'evil-window-prev)
  (define-key evil-window-map "Б" 'evil-window-decrease-width)
  (define-key evil-window-map "Ю" 'evil-window-increase-width)
  (define-key evil-window-map (kbd "C-и") 'evil-window-bottom-right)
  (define-key evil-window-map (kbd "C-с") 'evil-window-delete)
  (define-key evil-window-map (kbd "C-S-р") 'evil-window-move-far-left)
  (define-key evil-window-map (kbd "C-S-о") 'evil-window-move-very-bottom)
  (define-key evil-window-map (kbd "C-S-л") 'evil-window-move-very-top)
  (define-key evil-window-map (kbd "C-S-д") 'evil-window-move-far-right)
  (define-key evil-window-map (kbd "C-т") 'evil-window-new)
  (define-key evil-window-map (kbd "C-щ") 'delete-other-windows)
  (define-key evil-window-map (kbd "C-з") 'evil-window-mru)
  (define-key evil-window-map (kbd "C-у") 'evil-window-rotate-downwards)
  (define-key evil-window-map (kbd "C-S-у") 'evil-window-rotate-upwards)
  (define-key evil-window-map (kbd "C-ы") 'evil-window-split)
  (define-key evil-window-map (kbd "C-S-ы") 'evil-window-split)
  (define-key evil-window-map (kbd "C-е") 'evil-window-top-left)
  (define-key evil-window-map (kbd "C-м") 'evil-window-vsplit)
  (define-key evil-window-map (kbd "C-ц") 'evil-window-next)
  (define-key evil-window-map (kbd "C-S-Ц") 'evil-window-prev)
  (define-key evil-window-map (kbd "C-а") 'ffap-other-window))

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
  (require 'eaf)
  (require 'eaf-browser)
  (require 'eaf-image-viewer)
  (require 'eaf-pdf-viewer)
  (require 'eaf-markdown-previewer)

  (defalias 'browse-web #'eaf-open-browser)
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki

;; Typst treesitter mode
(use-package typst-ts-mode
  :vc (:url "https://codeberg.org/meow_king/typst-ts-mode.git"))

;; Typst live preview and websocket
(use-package websocket)

(use-package typst-preview
  ;; :load-path "path/to/typst-preview.el" ;; if installed manually
  :init
  (setq typst-preview-autostart t)
  (setq typst-preview-open-browser-automatically t)
  :custom
  (typst-preview-browser "eaf-browser")
  (typst-preview-invert-colors "auto")
  (typst-preview-executable "tinymist")
  (typst-preview-partial-rendering t)
  :config
  (define-key typst-preview-mode-map (kbd "C-c C-j") 'typst-preview-send-position))

