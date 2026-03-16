(load (expand-file-name "lisp/packages.el" user-emacs-directory))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-saves/" t)))

(make-directory "~/.emacs.d/auto-saves/" t)

(setq kill-buffer-delete-auto-save-files t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; Compilation mode color
(add-hook 'compilation-filter-hook 'ansi-color-compilation-filter)
;; (setq compilation-auto-jump-to-first-error t)
;; (setq compilation-scroll-output 'first-error)

;; Source: https://stackoverflow.com/questions/11043004/emacs-compile-buffer-auto-close
(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings."
  (when (and
	 (buffer-live-p buffer)
	 (string-match "compilation" (buffer-name buffer))
	 (string-match "finished" string)
	 )
    (run-with-timer 1 nil
		    (lambda (buf)
		      (bury-buffer buf)
		      (switch-to-prev-buffer (get-buffer-window buf) 'kill)
		      ;; delete window if it was opened by the compilation process
		      ;; (have two windows with the same buffer)
		      (when
			  (and (equal 2 (length (window-list)))
			       (eq (window-buffer (car (window-list))) (window-buffer (cadr (window-list)))))
			(delete-window (selected-window))
			)
		      )
		    buffer)))
  (add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)
;; Source end

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(async company company-box direnv elixir-mode evil evil-collection
	   evil-mc evil-multiedit exec-path-from-shell f gleam-ts-mode
	   glsl-mode gruber-darker-theme haskell-ts-mode ht ivy
	   kanagawa-themes lsp-mode lsp-ui lv magit markdown-mode
	   multiple-cursors spinner typst-preview typst-ts-mode
	   wfnames yaml))
 '(package-vc-selected-packages
   '((typst-ts-mode :url
		    "https://codeberg.org/meow_king/typst-ts-mode.git"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
