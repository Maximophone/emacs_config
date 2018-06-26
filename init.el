(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 4))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; PACKAGES
(straight-use-package 'sublime-themes)
(straight-use-package 'auto-complete)
(straight-use-package 'elpy)
(straight-use-package 'yasnippet)
(straight-use-package 'ace-window)
(straight-use-package 'go-mode)
(straight-use-package 'go-autocomplete)

;; THEME
(load-theme 'spolsky)

;; MODES
(require 'ido)
(ido-mode t)
(global-auto-complete-mode t)
(elpy-enable)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(global-linum-mode t)
(tool-bar-mode -1)

(global-set-key (kbd "M-o") 'ace-window)

(toggle-truncate-lines t)

;; ORG MODE
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-todo-keyword-faces
      '(("IN-PROGRESS" . "orange")
	("POSTPONED" . "blue")
	("ABANDONED" . "darkgreen")))
(setq org-agenda-window-setup 'current-window)

;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (replace-regexp-in-string
;;                           "[ \t\n]*$"
;;                           ""
;;                           (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq eshell-path-env path-from-shell) ; for eshell users
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/home/max/go")

(add-to-list 'exec-path "/home/max/go/gocode/bin")

(defun my-go-mode-hook ()
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding                                                      
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

;; (require 'go-autocomplete)
