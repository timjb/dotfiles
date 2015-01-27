(add-to-list 'load-path "/usr/local/Cellar/coq/8.4/lib/emacs/site-lisp/")
(setq auto-mode-alist (cons '("\.v$" . coq-mode) auto-mode-alist))
(autoload 'coq-mode "/usr/local/Cellar/coq/8.4/lib/emacs/site-lisp/coq.el" "Major mode for editing Coq vernacular." t)

(load-file (expand-file-name "~/Software/ProofGeneral-4.2/generic/proof-site.el"))
