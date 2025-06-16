(in-package :clif)

(defnode has-contents () 
  (contents)
  :documentation "A base class for all the elements that have content.")

(defnode has-css-classes () 
  (css-classes)
  :documentation "A base class for all the elements that can have css classes.")

(defnode basic-situation (has-contents) 
  (id)
  :documentation "A class to represent a basic situation in undum."
  :lambda-list (id &rest contents)
  :string-obj ("basicSituation (~a): ~a" id contents))

(defnode link (has-contents has-css-classes) 
  (target)
  :documentation "A class to represent a link in undum."
  :string-obj ("<<link ~a to (~a): ~a>>" css-classes target contents))

(make-html-tag-constructor link (target &rest contents)
  (make-instance 'link
                 :target target
                 :css-classes css-classes
                 :contents actual-contents))

(defnode newline-in-js-class () 
  ()
  :documentation "A class to represent a new line in the js code."
  :ctr-name nline
  :string-obj ("<<newline>>"))

(defnode story-class () 
  (situations initial-situation)
  :documentation "A class to represent a story."
  :ctr-name story)

(defmethod print-object ((node story-class) stream)
  (format stream "<<A story with ~a situations>>"
          (length (situations node))))

(defnode html-h1 (has-contents has-css-classes)  
  ()
  :documentation "A class to represent a <h1> tag in html."
  :string-obj ("<<H1 ~a: ~a>>" css-classes contents))

(make-simple-html-tag-constructor h1 html-h1)

(defnode html-p (has-contents has-css-classes) 
  ()
  :documentation "A class to represent a <p> tag in html."
  :string-obj ("<<p ~a: ~a>>" css-classes contents))

(make-simple-html-tag-constructor p html-p)

(defnode html-br ()
    ()
    :documentation "A class to represent a line break in HTML."
    :string-obj ("<<br>>"))

(defun br ()
  "Creates a new html-br instance."
  (make-instance 'html-br))

(defnode html-ul (has-contents has-css-classes)
  ()
  :documentation "A class to represent a <ul> tag in html."
  :string-obj ("<<ul ~a: ~a>>" css-classes contents))
(make-simple-html-tag-constructor ul html-ul)

(defnode html-ol (has-contents has-css-classes)
  ()
  :documentation "A class to represent a <ol> tag in html."
  :string-obj ("<<ol ~a: ~a>>" css-classes contents))
(make-simple-html-tag-constructor ol html-ol)

(defnode html-li (has-contents has-css-classes)
  ()
  :documentation "A class to represent a <li> tag in HTML."
  :string-obj ("<<li ~a: ~a>>" css-classes contents))

(make-simple-html-tag-constructor li html-li)

(defnode html-button (has-contents has-css-classes)
  (function-name)
  :documentation "A class to represent a button that triggers actions."
  :string-obj ("<<button ~a: ~a>>" css-classes contents))

(make-html-tag-constructor button (function-name &rest contents)
  (make-instance 'html-button
                 :function-name function-name
                 :css-classes css-classes
                 :contents actual-contents))
