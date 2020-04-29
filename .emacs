(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Keyboard shortcuts
(global-set-key "\C-c\C-c" 'compile)
(global-set-key "\C-xw" 'whitespace-cleanup)
(global-set-key "\C-xt" 'toggle-truncate-lines)
(global-set-key "\C-xc" 'comment-region)
(global-set-key "\C-xu" 'uncomment-region)

;; Disable annoying stuff
(setq inhibit-startup-message t)
(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Whitespace
(setq-default indent-tabs-mode nil
              c-basic-offset 4
              c-default-style "linux")

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(load-file "~/.emacs.d/doc-mode.el")
(load-file "~/.emacs.d/markdown-mode.el")

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(autoload 'doc-mode "doc-mode")

(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.adoc\\'" . doc-mode))

;; (c-subword-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(menu-bar-mode nil)
 '(same-window-buffer-names (quote ("sh" "sh2" "sh3" "sh4")))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(whitespace-check-indent-whitespace nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "VL Gothic" :foundry "unknown" :slant normal :weight normal :height 150 :width normal))))
 '(markdown-code-face ((t nil))))

(setenv "PAGER" "cat")

(shell "sh")
(put 'downcase-region 'disabled nil)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; https://emacs.stackexchange.com/questions/28909/how-i-can-open-shell-in-current-buffer/28924#28924
;; (add-to-list 'display-buffer-alist
;;              '(,(rx bos "sh[0-9]")
;;                display-buffer-same-window))
