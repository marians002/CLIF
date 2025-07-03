(in-package :clif)

(defnode has-contents () 
  (contents)
  :documentation "A base class for all the elements that have content.")

(defnode has-css-classes () 
  (css-classes)
  :documentation "A base class for all the elements that can have css classes.")

(defnode text (has-contents) 
  ()
  :documentation "A class to represent a block of text."
  :string-obj ("<<text: ~a>>" contents)
  :ctr-name text
  :lambda-list (&rest contents))

(defnode title (has-contents) 
  ()
  :documentation "A class to represent a title."
  :string-obj ("<<title: ~a>>" contents)
  :ctr-name title
  :lambda-list (&rest contents))

(defnode subtitle (has-contents) 
  ()
  :documentation "A class to represent a subtitle."
  :string-obj ("<<subtitle: ~a>>" contents)
  :ctr-name subtitle
  :lambda-list (&rest contents))

(defnode item (has-contents)
  ()
  :documentation "A class to represent an item."
  :string-obj ("<<item: ~a>>" contents)
  :lambda-list (&rest contents))

(defnode ordered-list (has-contents)
  ()
  :documentation "A class to represent an ordered lis."
  :string-obj ("<<list: ~a>>" contents)
  :ctr-name enumerate
  :lambda-list (&rest contents))

(defnode unordered-list (has-contents)
  ()
  :documentation "A class to represent an unordered lis."
  :string-obj ("<<list: ~a>>" contents)
  :ctr-name itemize
  :lambda-list (&rest contents))

(defnode newline ()
  ()
  :documentation "A class to represent an ordered lis."
  :string-obj ("<<newline>>"))

(defnode bold-face (has-contents)
  ()
  :documentation "A class to represent things formated with bold."
  :string-obj ("<<b ~a>>" contents)
  :ctr-name b
  :lambda-list (&rest contents))

(defnode italic-face (has-contents)
  ()
  :documentation "A class to represent things formated with italic."
  :string-obj ("<<it ~a>>" contents)
  :ctr-name it
  :lambda-list (&rest contents))

(defnode tt-face (has-contents)
  ()
  :documentation "A class to represent things formated with monospace."
  :string-obj ("<<tt ~a>>" contents)
  :ctr-name tt
  :lambda-list (&rest contents))

(defnode strike-face (has-contents)
  ()
  :documentation "A class to represent things formated with strike."
  :string-obj ("<<strike ~a>>" contents)
  :ctr-name strike
  :lambda-list (&rest contents))

(defnode underline-face (has-contents)
  ()
  :documentation "A class to represent things formated with underline."
  :string-obj ("<<underline ~a>>" contents)
  :ctr-name underline
  :lambda-list (&rest contents))

(defnode link (has-contents) 
  (target)
  :documentation "A class to represent a link."
  :string-obj ("<<link to (~a): ~a>>" target contents)
  :ctr-type macro
  :lambda-list (target &rest contents))

(defnode action (has-contents)
  (action-id trigger-text target-id
  contents)
  :documentation "A node that shows text when activated."
  :string-obj ("<<Action{~a}. Shows {~a} and transforms to {~a} with id {~a}." action-id trigger-text contents target-id)
  :ctr-type macro
  :lambda-list (action-id trigger-text target-id &rest contents)
 )

(defnode image ()
    (src
     alt-text
     (align :initform nil)
     (size :initform nil))
    :documentation "A node that represents an image with optional alignment and size."
    :string-obj ("<<Image: ~a from ~a with align ~a and size ~a>>" alt-text src align size)
    :ctr-type macro
    :lambda-list (src alt-text &key align size)
    )

(defnode start-sound ()
  (src
   (alt-text :initform "You can listen to some sound in the background"))
  :documentation "A node that represents a sound file with optional alternative text."
  :string-obj ("<<Sound: ~a from ~a>>" alt-text src)
  :ctr-type macro
  :lambda-list (src &key alt-text)
  :ctr-body `(make-instance 'start-sound
               :src ,src
               :alt-text ,(or alt-text "You can listen to some sound in the background")))

(defnode video ()
  (src
   (alt-text :initform "Some video content"))
  :documentation "A node that represents a video file with optional dimensions."
  :string-obj ("<<Video: ~a from ~a>>" alt-text src)
  :ctr-type macro
  :lambda-list (src &key alt-text)
  :ctr-body `(make-instance 'video
               :src ,src
               :alt-text ,(or alt-text "Some video content")))

(defnode change-bg-color ()
 (color)
  :documentation "A node that changes the background color."
  :string-obj ("<<Change background color to ~a>>" color)
  :lambda-list (color))

(defnode change-bg-image ()
  (image-url)
  :documentation "A node that changes the background image with default settings."
  :string-obj ("<<Change background image to ~a>>" image-url)
  :lambda-list (image-url))

(defnode font (has-contents) 
  (new-font)
  :documentation "A class to represent a text with a new font type."
  :string-obj ("<<new font: ~a, Text: ~a>>" new-font contents)
  :ctr-type macro
  :lambda-list (new-font &rest contents))

(defnode whiteboard (has-contents)
  (wb-title author)
  :documentation "A node that creates a whiteboard with title and content."
  :string-obj ("<<Whiteboard: ~a by ~a>> ~a" wb-title author contents)
  :ctr-type macro
  :lambda-list (wb-title author &rest contents)
  :ctr-body `(make-instance 'whiteboard 
               :wb-title ,wb-title
               :author ,author
               :contents (list ,@contents)))

(defnode math-inline ()
  (math)
  :documentation "A node for inline mathematical expressions."
  :string-obj ("<<Math: ~a>>" math)
  :ctr-name math-inline
  :lambda-list (math))

(defnode math-center ()
  (math)
  :documentation "A node for centered mathematical expressions."
  :string-obj ("<<Math centered: ~a>>" math)
  :ctr-name math-center
  :lambda-list (math))

(defnode code-node ()
  (language code)
  :documentation "A node for displaying code with syntax highlighting."
  :string-obj ("<<Code block (~a): ~a>>" language code)
  :ctr-name code-node
  :lambda-list (language code))

(defnode scene (has-contents) 
  (id)
  :documentation "A class to represent a scene."
  :ctr-type macro
  :lambda-list (id &rest contents)
  :ctr-body (let* ((scene-value (gensym)))
              `(let* ((,scene-value (make-instance 'scene :id ',id
                                                   :contents (list ,@contents))))
                 (defparameter ,id ,scene-value)
                 ,scene-value))
  :string-obj (" <<scene (~a):~%~{  ~a~%~}" id contents))

(defnode story (has-contents) 
  (id
   story-title
   (author :initform "Anonimous")
   start)
  :documentation "A class to represent a story."
  :string-obj ("<<story (~a, by ~a):~2%~{~a~2%~}" story-title author contents)
  :ctr-type macro
  :lambda-list (id (&key author story-title start) &rest contents)
  :ctr-body `(defparameter ,id (make-instance 'story
                                              :story-title ,story-title
                                              :author ,author
                                              :start ,start
                                              :contents (list ,@contents))))
