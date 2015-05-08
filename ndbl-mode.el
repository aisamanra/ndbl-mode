;; ndbl-mode.el --- a simple major mode for editing GIDL files.

;; Version: 20150507.0001
;; Author: Getty Ritter
;; Url: http://github.com/aisamanra/ndbl-mode

(setq ndbl-font-lock
  '(( "\"\\([^\\]\\|\\\\[\\\"]\\)*\""
      . font-lock-string-face )
    ( "\\([^ \n\t\r=]+\\)="
      1 font-lock-variable-name-face )
    ( "=" . font-lock-builtin-face )))

(defvar ndbl-syntax-table nil "Syntax table for `ndbl-mode'.")
(setq ndbl-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?# "< b" table)
    (modify-syntax-entry ?\n "> b" table)

    table))

(define-derived-mode ndbl-mode prog-mode
  "NDBL mode is a major mode for editing NDBL files"
  :syntax-table ndbl-syntax-table

  (setq font-lock-defaults '(ndbl-font-lock))
  (setq mode-name "NDBL mode")
  (setq comment-start "#")
  (setq comment-end ""))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ndbl\\'" . ndbl-mode))

(provide 'ndbl-mode)

;;; ndbl-mode.el ends here
