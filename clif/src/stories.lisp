(defparameter start nil)
(defparameter inside-the-house nil)
(defparameter good-ending nil)
(defparameter bad-ending nil)
(defparameter story nil)

(setf start (basic-situation
             "start"
             (h1 "In the beginning...")
             (nline)
             (p "You are at the front door of a house. It is closed")
             (nline)
             (p "Do you " (link "inside_the_house" "open the door?")
                " Or do you " (link "bad_ending"  "turn your back and leave?"))))

(setf bad-ending (basic-situation
                  "bad_ending"
                  (p "You leave and will never know what you could have become.")
                  (nline)
                  (p "THE (BAD) END")))

(setf inside-the-house
      (basic-situation
       "inside_the_house"
       (p "Decided to face your demons, you open the door and enter.")
       (nline)
       (p "What you see surprises you! :-o")
       (nline)
       (p "THE (SURPRISING) END")))

(setf story (story (list start inside-the-house bad-ending)
                   "start"))

(with-open-file (f "/tmp/undum-game.js" :direction :output
                  :if-exists :supersede)
   (generate-code story undum f))

(progn
  (defparameter start2 nil)
  (defparameter before-lisp nil)
  (defparameter inside-lisp nil)
  (defparameter ending-without-lisp nil)
  (defparameter story2 nil))

(setf start2 (basic-situation
              "start2"
              (h1 "Había una vez...")
              (nline)
              (p "una PUÑETERA niña :-| que se llamaba Nairam, y no le gustaba Emacs ni el modo org , y por eso, todo lo hacía directo en Lisp *panic noises*. Y un día, decidió tomar una decisión:")

              (nline)
              (p (link "beforelisp" "Hoy aprendería Emacs")
                 ", o quizás " (link "ending-without-lisp" "cambiaba de tesis."))))

(setf before-lisp
      (basic-situation "beforelisp"
       (p "Para aprender Emacs, lo primero que hizo fue: ")
       (nline)
       (p (link "insidelisp"
                "Preguntarle a chatgpt y le dijo que hiciera el tutorial de emacs"))
       (p (link "endingwithoutlisp" 
                "Buscar un libro serio sobre lisp."))))

(setf inside-lisp
      (basic-situation "insidelisp"
       (p "Después de leer el tutorial se dio cuenta de que eso no servía para nada y se deprimió.")
       (nline)
       (p "The (VERY DEPRESSING) END.")))

(setf story2 (story (list start2 before-lisp inside-lisp) "start2"))

(with-open-file (f "/tmp/undum-game.js" :direction :output
                  :if-exists :supersede)
   (generate-code story2 undum f))

(defbasic-situation start-3
  (h1 "Había una vez un niño que hacía historias con clif...")
     (nline)
  (p (link "usa_macros" "usando macros."))

  (p (link "sin_usar_macros" "sin usar macros.") "Y " (br)  " SALTAAAAA")

  (ul (li "item 1") (li "item2") )
  (ol (li "First element") (li "Second element"))

  (p "Mientras decía: el último teorema de fermat dice...  ")

  (nline)

  (show-whiteboard "Math Lesson" "2+2=")
 (add-to-whiteboard "4")
 (button 'add_to_whiteboard "clic para saber que gritó")
 (clear-whiteboard)
 (button 'clear_whiteboard "clic to erase the  whiteboard")
)

(defbasic-situation usa_macros
  (p "Y vivió feliz para siempre :-D.")
  (p "FIN"))

;; (defbasic-situation sin_usar_macros
;;   (p "Y vino el lobo y le dijo: te explico:")

;;   (br)

;;  (show-whiteboard "Y sacó una pizarra."))

;; (defbasic-situation escribir_en_pizarra
;;      (p "Mientras decía: el último teorema de fermat dice...  ")

;;      (add-to-whiteboard "x**n+ y**n = z**n"
;;                         "el lobo escribía en la pizarra.")


;;      (p "Moraleja: usa macros.")

;;      (p "FIN"))

;; (defstory historia-de-los-macros
;;     :initial-situation start3
;;     :situations (start3
;;                  ohhhh
;;                  ouh-yeah
;;                  i-did-it
;;                  oh-no!!!!
;;                  the-happy-end
;;                  the-sad-end
;;                  the-unwritten-end))

(defstory story3
     :initial-situation start-3
     :situations (start-3 usa_macros))

(with-open-file (f "/tmp/undum-game.js" :direction :output
                  :if-exists :supersede)
   (generate-code story3 undum f))
