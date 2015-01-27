;; Don't know if this is needed
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)

(require 'evil)
(evil-mode 1)

(load-file "~/.emacs.d/setup-agda.el")
(load-file "~/.emacs.d/setup-coq.el")
