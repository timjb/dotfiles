;; Load Agda mode
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
;; Set Agda path
(custom-set-variables '(agda2-include-dirs
  (quote ("."
          (expand-file-name "~/Library/Agda/lib-0.8.1/src")
          (expand-file-name "~/Projects/categories")))))

;; Custom Agda keybindings
(add-hook 'evil-insert-state-entry-hook (lambda () (set-input-method "Agda")))
(add-hook 'evil-insert-state-exit-hook (lambda () (set-input-method nil)))
(global-set-key (kbd "C-c ,") 'agda2-goal-and-context)
(global-set-key (kbd "C-c .") 'agda2-goal-and-context-and-inferred)
(global-set-key (kbd "C-c C-@") 'agda2-give)

