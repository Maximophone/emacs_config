;;; maru-mode.el --- sample major mode for editing MARU code. -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2019, by Maxime Fournes

;; Author: Maxime Fournes (fournes.maxime@gmail.com
;; Version: 0.0.1
;; Created: 18 Jul 2019
;; Keywords: languages
;; Homepage: 

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the GNU General Public License version 2.

;;; Commentary:

;; short description here

;; full doc on how to use here

;;; Code:

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq maru-font-lock-keywords
      (let* (
            ;; define several category of keywords
	     (x-keywords '("break" "fn" "if" "else" "for" "while" "return" "test" "class" "in" "include" ))
	     (x-constants '("true" "false" ))
             (x-functions '("append" "assert" "print" "printl" "repr" "type" "len" "range"))

            ;; generate regex string for each category of keywords
	     (x-keywords-regexp (regexp-opt x-keywords 'words))
	     (x-constants-regexp (regexp-opt x-constants 'words))
	     (x-functions-regexp (regexp-opt x-functions 'words)))

        `(
	  (,x-constants-regexp . font-lock-constant-face)
          (,x-functions-regexp . font-lock-function-name-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

(defvar maru-mode-syntax-table nil "Syntax table for `maru-mode'.")

(setq maru-mode-syntax-table
      (let ( (synTable (make-syntax-table)))
        ;; python style comment: “# …”
        (modify-syntax-entry ?# "<" synTable)
        (modify-syntax-entry ?\n ">" synTable)
        synTable))

;;;###autoload
(define-derived-mode maru-mode javascript-mode "maru mode"
  "Major mode for editing LSL (Linden Scripting Language)…"

  ;; code for syntax highlighting
  (setq font-lock-defaults '((maru-font-lock-keywords)))

  (set-syntax-table maru-mode-syntax-table)
  (setq-local comment-start "# ")
  (setq-local comment-end "")
  )

;; add the mode to the `features' list
(provide 'maru-mode)

;;; maru-mode.el ends here
