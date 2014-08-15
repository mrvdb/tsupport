;;; package --- tsupport.el

;;; Commentary:
;; quick mode for tsupport related things.

;;; Code:

(define-derived-mode tsupport-mode text-mode "tsupport" ()
  "Tsupport major mode, editting support templates etc.")

(defun tsupport-tokens()
  (rx (and "{" (group (or "KEYS" "VALUE")) "}")))

(defun tsupport-regex()
  (rx (group
	   "{" (group "KEYS") "}\n"
	   (group (one-or-more (one-or-more char) "\n"))
	   (group "{" (group "VALUE") "}" ))))
 
(makunbound 'tsupport-font-lock-keywords)
(defconst tsupport-font-lock-keywords
  `(
    ;; Regular expression literals
    (,(tsupport-tokens) 1 font-lock-string-face)        ;; KEYS and VALUE
    (,(tsupport-regex) 3 font-lock-function-name-face)) ;; key strings
)

(defun tsupport-mode-setup ()
  "Initialize the mode."

  ;; Set some font-lock-defaults
  (set (make-local-variable 'font-lock-defaults)
       '(tsupport-font-lock-keywords)))

(add-hook 'tsupport-mode-hook 'tsupport-mode-setup)

(provide 'tsupport)
;;; tsupport.el ends here
