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
(straight-use-package 'jedi)
(straight-use-package 'pylint)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(straight-use-package 'yaml-mode)
(straight-use-package 'ace-window)
(straight-use-package 'go-mode)
(straight-use-package 'go-autocomplete)
(straight-use-package 'glsl-mode)
(straight-use-package 'rust-mode)

;; THEME
(load-theme 'spolsky)

;; MODES
(require 'ido)
(ido-mode t)
(global-auto-complete-mode t)
(elpy-enable)
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
;;(add-to-list 'python-shell-completion-native-disabled-interpreters
;;	     "jupyter")
(global-linum-mode t)
(tool-bar-mode -1)
(toggle-truncate-lines t)

(setq elpy-rpc-backend "jedi")

;; BINDINGS
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key "\M-n" (lambda() (interactive) (scroll-up 4)))
(global-set-key "\M-p" (lambda() (interactive) (scroll-down 4)))

;; ORG MODE
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-todo-keyword-faces
      '(("IN-PROGRESS" . "orange")
	("POSTPONED" . "blue")
	("ABANDONED" . "darkgreen")))
(setq org-agenda-window-setup 'current-window)
(org-toggle-sticky-agenda t)
(add-hook 'org-mode-hook 'yas-minor-mode)

;; GO
(setenv "GOPATH" "/home/max/go")
(add-to-list 'exec-path "/home/max/go/bin")
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

(with-eval-after-load 'go-mode
   (require 'go-autocomplete))

;; STARTUP
(setq inhibit-startup-screen t)
(find-file "~/worknotes.org")

(desktop-save-mode 1)
