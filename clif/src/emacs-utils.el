;; key to insert (load everything.lisp) in the repl
(define-key lisp-mode-map (kbd "M-m M-o M-l")
  (lambda ()
    (interactive)
    (insert "(load \"src/load-clif.lisp\") (in-package :clif)")))
