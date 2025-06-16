(load "src/load-clif.lisp")  ; Asegúrate de que la ruta es correcta
(load "src/stories.lisp")
(in-package :clif)
   (setf story2 (story (list start2 usa_macros sin_usar_macros) "start2"))

   (with-open-file (f "/tmp/undum-game.js" :direction :output
                     :if-exists :supersede)
      (generate-code story2 undum f))

(format t "HERE")

