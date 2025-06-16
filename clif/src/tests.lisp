(let* ((bs1 (basic-situation 'test1
                             "hello world,"
                             " my first situation"
                             ", with 3 lines"))
       (bs2 (basic-situation 'test2
                             "<h1>Un juego con una sola situación</h1>"
                             "<p>Esta es una única situación, con texto.</p>."
                             "<p>Presiona <a href='ultimo'>aquí para terminar...</a></p>")))
  (bformat t "testing the constructor for basic-situation")
  (format t "~s~%" bs1)
  (format t "~a~%" bs2))

(let* ((l1 (link "test1" "click here to go to 'test1"))
       (l2 (link "test2" :transient "click here to go to 'test2"))
       (l3 (link "test2" :transient "click here to go" " to 'test2" " with list"))
       (l4 (link "test2" :transient "click here to go" :another_class " to 'test2" " with list")))
  (bformat t "testing the constructor for link")
  (format t "~a~%" l1)
  (format t "~a~%" l2)
  (format t "~a~%" l3)
  (format t "~a~%" l4))

(let* ((l1 (nline)))
  (bformat t "testing the constructor for newline-in-js-class")
 (format t "~a~%" l1))

(let* ((bs1 (basic-situation "start"
                             "<h1>Un juego con una sola situación</h1>"
                             (nline)
                             "<p>Esta es una única situación, con texto.</p>"
                             (nline)
                             "<p>Presiona " (link 'ultimo "aquí para terminar.") "</p>"))
       (bs2 (basic-situation "ultimo"
                             "<p class='transient'>Felicitaciones</p>"
                             (nline)
                             "<p>Has terminado tu primera aventura</p>"
                             "<p>FIN</p>"))
       (story1 (story (list bs1 bs2) "start")))
  (bformat t "Testing story")
  (format t "~a~%" story1))

(let* ((l1 (h1 "This is a test for a header"))
       (l2 (h1 "This is a test" " for a header" " with list as contents"))
       (l3 (h1 :transient "This is a test"))
       (l4 (h1 :transient "This is a test" :with_2_classes " with css-classes")))
  (bformat t "testing the constructor for p")
  (format t "~a~%" l1)
  (format t "~a~%" l2)
  (format t "~a~%" l3)
  (format t "~a~%" l4))

(let* ((l1 (p "This is a test for a paragraph"))
       (l2 (p "This is a test" " for a paragraph" " with a list as content"))
       (l3 (p :transient "This is a test"))
       (l4 (p :transient "This is a test" :with_2_classes " with css-classes")))
  (bformat t "testing the constructor for p")
  (format t "~a~%" l1)
  (format t "~a~%" l2)
  (format t "~a~%" l3)
  (format t "~a~%" l4))

(let* ()

  (bformat t "testing initialize-undum. check /tmp/clif.html")
  (with-open-file (f "/tmp/clif.html" :direction :output
                     :if-exists :supersede)
    (initialize-undum t undum f)))

(generate-code 4 undum t)

(generate-code "hello world!" undum t)

(generate-code 'hello-world undum t)

(generate-code (list 'hello-world 1 "two") undum t)
(generate-code nil undum t)

(generate-code nil undum t)

(let* ((bs1 (basic-situation 'test1
                             "hello world,"
                             " my first situation"
                             ", with 3 lines"))
       (bs2 (basic-situation 'test2
                             "<h1>Un juego con una sola situación</h1>"
                             "<p>Esta es una única situación, con texto.</p>."
                             "<p>Presiona <a href='ultimo'>aquí para terminar...</a></p>")))
  (bformat t "testing generate-code for basic situation")
  (generate-code bs1 undum t)
  (terpri) (terpri)
  (generate-code bs2 undum t))

(let* ((l1 (link "test1" "click here to go to 'test1"))
          (l2 (link "test2" :transient "click here to go to 'test2"))
          (l3 (link "test3" :transient "click here to go" " to 'test2" " with list"))
          (l4 (link "test4" :transient "click here to go" :another_class " to 'test2" " with list")))
  (bformat t "testing the code-generation for link")
  (generate-code l1 undum t) (terpri)
  (generate-code l2 undum t) (terpri)
  (generate-code l3 undum t) (terpri)
  (generate-code l4 undum t) (terpri))

(generate-code (nline) undum t)

(let* ((bs1 (basic-situation "start"
                             "<h1>Un juego con una sola situación</h1>"
                             (nline)
                             "<p>Esta es una única situación, con texto.</p>"
                             (nline)
                             "<p>Presiona " (link 'ultimo "aquí para terminar.") "</p>"))
       (bs2 (basic-situation "ultimo"
                             "<p class='transient'>Felicitaciones</p>"
                             (nline)
                             "<p>Has terminado tu primera aventura</p>"
                             (nline)
                             "<p>FIN</p>")))
  (bformat t "testing generate-code for story")
  (generate-code bs1 undum t)
  (terpri) (terpri)
  (generate-code bs2 undum t))

(let* ((bs1 (basic-situation "startup"
                             "<h1>Un juego con una sola situación</h1>"
                             (nline)
                             "<p>Esta es una única situación, con texto.</p>"
                             (nline)
                             "<p>Presiona " (link 'ultimo "aquí para terminar.") "</p>"))
       (bs2 (basic-situation "ultimo"
                             "<p class='transient'>Felicitaciones</p>"
                             (nline)
                             "<p>Has terminado tu primera aventura</p>"
                             (nline)
                             "<p>FIN</p>"))
       (story1 (story (list bs1 bs2) "startup")))

  (bformat t "testing generate-code for story")
  (generate-code story1 undum t))

(let* ((bs1 (basic-situation "start"
                             "<h1>Un juego con una sola situación</h1>"
                             (nline)
                             "<p>Esta es una única situación, con texto.</p>"
                             (nline)
                             "<p>Presiona " (link "ultimo" "aquí para terminar.") "</p>"))
       (bs2 (basic-situation "ultimo"
                             "<p class='transient'>Felicitaciones</p>"
                             (nline)
                             "<p>Has terminado tu primera aventura</p>"
                             (nline)
                             "<p>FIN</p>"))
       (story1 (story (list bs1 bs2) "start")))

  (bformat t "testing generate-code to a file for a story")
  (with-open-file (f "/tmp/undum-game.js" :direction :output
                     :if-exists :supersede)
      (generate-code story1 undum f)))

(let* ((l1 (h1 "This is a test for a header"))
       (l2 (h1 "This is a test" " for a header" " with list as contents"))
       (l3 (h1 :transient "This is a test"))
       (l4 (h1 :transient "This is a test" :with_2_classes " with css-classes")))
  (bformat t "testing the constructor for h1")
  (generate-code l1 undum t)
  (terpri)
  (generate-code l2 undum t)
  (terpri)
  (generate-code l3 undum t)
  (terpri)
  (generate-code l4 undum t))

(let* ((l1 (p "This is a test for a paragraph"))
       (l2 (p "This is a test" " for a paragraph" " with list as contents"))
       (l3 (p :transient "This is a test"))
       (l4 (p :transient "This is a test" :with_2_classes " with css-classes")))
  (bformat t "testing the code generation for <p>")
  (generate-code l1 undum t)
  (terpri)
  (generate-code l2 undum t)
  (terpri)
  (generate-code l3 undum t)
  (terpri)
  (generate-code l4 undum t))

(let* ((test-paragraph (p "First line" (br) "Second line")))
  (bformat t "Testing br tag")
  (generate-code test-paragraph undum t))

(let* (;; Test basic list items
       (simple-item (li "Simple list item"))
       (styled-item (li :highlight "Styled list item"))
       (multi-content (li "First part" " second part"))
       (nested-item (li (p "Paragraph inside list item")))
       
       ;; Test unordered lists
       (simple-list (ul (li "Item 1") (li "Item 2")))
       (styled-list (ul :menu (li "Home") (li "About") (li "Contact")))
       (nested-list (ul (li "Top level" (ul (li "Nested 1") (li "Nested 2"))))))

  
  (bformat t "Testing individual list items")
  (generate-code simple-item undum t) (terpri)
  (generate-code styled-item undum t) (terpri)
  (generate-code multi-content undum t) (terpri)
  (generate-code nested-item undum t) (terpri)
  
  (bformat t "~%Testing unordered lists")
  (generate-code simple-list undum t) (terpri)
  (generate-code styled-list undum t) (terpri)
  (generate-code nested-list undum t) (terpri)
  )

(defbasic-situation test-Situation
  (p "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.  ")
  (nline)
  (p "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.  Lorem ipsum dolor sit amet, consectetuer adipiscing elit."))
(defbasic-situation S-Sit
(p "STARTING SITUATION")
(nline)
(p "Lorem ipsum dolor sit amet, consectetuer adipiscing elit.  Lorem ipsum dolor sit amet, consectetuer adipiscing elit."))

(defstory historia-de-los-macros
  :initial-situation S-Sit
  :situations (S-Sit
              test-Situation))

(let* (start
       last
       story1) 
  (bformat t "testing a full story")
  (setf start (basic-situation
               "start"
               (h1 "A game with only one situation, but with h1 and p and css")
               (nline)
               (p "This is the only situation, with text.")
               (nline)
               (p :transient "And this should dissapear...  :-o")
               (nline)
               (p :transient "Click" (link "last"" here to end..."))))

  (setf last (basic-situation
              "last"
              (p "Congratulations.")
               (nline)
              (p "You finished your first adventure.")
               (nline)
              (p "THE END")))
  (setf story1 (story (list start last) "start"))
  (format t "~a~%" start)
  (format t "~a~%" last)
  (with-open-file (f "/tmp/undum-game.js"
                     :direction :output
                     :if-exists :supersede)
    (generate-code story1 undum f)))

(let* (start
       last)
  (bformat t "testing a full story")
  (setf start (basic-situation
               'start
               (list "<h1>Un juego con una sola situación</h1>"
                     "<p>Esta es una única situación, con texto.</p>."
                     "<p>Presiona" (link 'ultimo "aquí para terminar...")"</p>")))

  (setf last (basic-situation
              'last
              (list "<p class='transient'>Felicitaciones.</p>."
                    "<p>Has terminado tu primera aventura.</p>"
                    "<p>FIN</p>")))
  (format t "~a~%" start)
  (format t "~a~%" last))
