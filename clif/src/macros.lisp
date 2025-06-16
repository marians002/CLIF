(in-package :clif)

(defmacro make-html-tag-constructor (ctr-name (&rest lambda-list) &body body)
  "In the lambda list there should be an argument named contents, and it should be a list."
  `(defun ,ctr-name ,lambda-list
     (let* (css-classes
            actual-contents)
       ;; let's separate teh css-classes from the contents
       (loop for elt in contents
             doing
             (if (keywordp elt)
                 ;; if it is a keyword, let's store it as a downcase string 
                 (push (string-downcase (symbol-name elt)) css-classes)
                 ;; else
                 (push elt actual-contents)))
       ;; now let's reverse the css-classes and actual-contents
       (setf css-classes (reverse css-classes))
       (setf actual-contents (reverse actual-contents))
       ;; let's create the class
       ;; that should do it the final user
       ,@body)))

(defmacro make-simple-html-tag-constructor (ctr-name class-name)
  `(make-html-tag-constructor ,ctr-name (&rest contents)
     (make-instance ',class-name
                    :css-classes css-classes
                    :contents actual-contents)))

(defmacro generate-code-for-html-tag (class-name &body body)
  "Creates the strings for css-classes and contents."
  `(defmethod generate-code ((node ,class-name) (lang undum-language) stream)
     (let* ((css-classes
             (if (css-classes node)
                 ;; then
                 (with-output-to-string (s)
                   (format s "~{~a~^ ~}"
                           (css-classes node)))
                 ;; else
                 ""))
            (contents (gcodenil contents)))
       ,@body)))

(defmacro generate-code-for-simple-html-tag (class-name html-tag)
  "Writes the generate-code method for simple-html-tag (only contents and css-classes)."
  `(defmethod generate-code ((node ,class-name) (lang undum-language) stream)
     (format stream "<~a class='~a'>~a</~a>"
             ,html-tag
             (if (css-classes node)
                 (with-output-to-string (s)
                   (format s "~{~a~^ ~}"
                           (css-classes node)))
                 ;; else
                 "")
             (gcodenil contents)
             ,html-tag)))

(defmacro defbasic-situation (name &body instructions)
  (let* ((situation-id (substitute #\_ #\- 
	(string-downcase
	(symbol-name name)))))
     `(defparameter ,name (basic-situation ,situation-id
			  ,@instructions))))

(defmacro defstory (name &key initial-situation situations)
  "Defines a complete story with its situations and initial situation."
    `(defparameter ,name 
      (story (list ,@situations) 
      ,(substitute #\_ #\- (string-downcase (symbol-name initial-situation))))))
