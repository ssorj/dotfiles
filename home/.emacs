(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file :noerror)

(load-theme 'deeper-blue)
(set-face-attribute 'default nil :family "GitLab Mono" :height 130)
(set-face-bold-p 'bold nil)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)
(column-number-mode t)
(global-subword-mode t)
(which-function-mode t)

(setq inhibit-startup-message t)
(setq uniquify-buffer-name-style 'forward)

(put 'downcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq-default truncate-lines t)

;; Keyboard shortcuts

(global-set-key (kbd "C-c t") #'toggle-truncate-lines)
(global-set-key (kbd "C-c c") #'comment-region)
(global-set-key (kbd "C-c u") #'uncomment-region)
(global-set-key (kbd "C-c s") #'sort-lines)
(global-set-key (kbd "C-c p") #'ispell-word)

;; Whitespace

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq whitespace-check-indent-whitespace nil)

;; Backups

(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; Backward delete word (not kill)
;; https://www.emacswiki.org/emacs/BackwardDeleteWord

(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word. With argument, do this that many times."
  (interactive "p")
  (if (use-region-p)
      (delete-region (region-beginning) (region-end))
    (delete-region (point) (progn (forward-word arg) (point)))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word. With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(global-set-key (read-kbd-macro "<M-DEL>") 'backward-delete-word)

;; Python

(setq python-indent-guess-indent-offset t)
(setq python-indent-guess-indent-offset-verbose nil)

;; C and C++

(setq-default indent-tabs-mode nil
              c-basic-offset 4
              c-default-style "linux")
(add-hook 'c-mode-hook (lambda () (c-toggle-comment-style -1)))

;; Markdown

(load-file "~/.emacs.d/markdown-mode.el")
(autoload 'markdown-mode "markdown-mode")
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; ;; AsciiDoc

;; (load-file "~/.emacs.d/doc-mode.el")
;; (autoload 'doc-mode "doc-mode")
;; (add-to-list 'auto-mode-alist '("\\.adoc\\'" . doc-mode))

;; Shell

(setenv "PAGER" "cat")
(shell "sh")
(defun sh () (interactive) (shell "sh"))
(defun sh2 () (interactive) (shell "sh2"))
(defun sh3 () (interactive) (shell "sh3"))
(defun sh4 () (interactive) (shell "sh4"))
(setq-default same-window-buffer-names '("sh" "sh2" "sh3" "sh4"))

(set-face-attribute 'comint-highlight-prompt nil :inherit nil)
(setq ansi-color-names-vector ["black" "tomato" "PaleGreen2" "gold1" "DeepSkyBlue1" "MediumOrchid1" "cyan" "white"])
(setq ansi-color-map (ansi-color-make-color-map))
