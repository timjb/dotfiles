;; Packaging
(package-initialize)
(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)

;; Don't know if this is needed
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Use vim keybindings
(require 'evil)
(evil-mode 1)

;; Haskell binaries (e.g. 'agda')
(setq exec-path (append exec-path '("~/.cabal/bin")))

(load-file "~/.emacs.d/setup-agda.el")
(load-file "~/.emacs.d/setup-coq.el")
