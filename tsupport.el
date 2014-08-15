;;; package --- tsupport.el

;;; Commentary:
;; quick mode for tsupport related things.

;;; Code:

(define-derived-mode tsupport-mode text-mode "tsupport" ()
  "Tsupport major mode, editting support templates etc.")

(defun tsupport-regex()
  (rx (group
	   "{" (group "KEYS") "}\n"
	   (group (one-or-more (one-or-more char) "\n"))
	   (group "{" (group "VALUE") "}" ))))
 
(makunbound 'tsupport-font-lock-keywords)
(defconst tsupport-font-lock-keywords
  `(
    ;; Regular expression literals
    (,(tsupport-regex) 2 font-lock-string-face)        ;; KEYS
    (,(tsupport-regex) 3 font-lock-function-name-face) ;; the key strings
    (,(tsupport-regex) 5 font-lock-string-face)))      ;; VALUE


(defun tsupport-mode-setup ()
  "Initialize the mode."

  ;; Set some font-lock-defaults
  (set (make-local-variable 'font-lock-defaults)
       '(tsupport-font-lock-keywords)))

(add-hook 'tsupport-mode-hook 'tsupport-mode-setup)

(provide 'tsupport)
;;; tsupport.el ends here
