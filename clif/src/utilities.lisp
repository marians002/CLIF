(in-package :clif)

(defun mkstr (&rest args)
  "Returns a string with the concatenation of the args"
  (string-upcase
   (with-output-to-string (s)
     (dolist (a args) (princ a s)))))

(defun symb (&rest args)
  "Returns a symbol formed by the concatenation of the args."
  (values (intern (apply #'mkstr args))))

(defun flatten (x)
  "Flattens a structure."
  (labels ((rec (x acc)
             (cond ((null x) acc)
                   ((atom x) (cons x acc))
                   (t (rec (car x) (rec (cdr x) acc))))))
    (rec x nil)))

(defun make-keyword (&rest args)
  (values (intern (apply #'mkstr args) :keyword)))

(defun format-boxed (stream format-str &rest format-args)
  (let* ((string-to-print
          (if format-args
              (apply 'format `(nil ,format-str ,@format-args))
              (funcall 'format nil format-str)))
         (length (cl:+ 2 (length string-to-print)))
         (=-line (make-string length :initial-element #\=)))
    (format stream "~a~% ~a~%~a~2%"
            =-line string-to-print =-line)))

(setf (symbol-function 'bformat) #'format-boxed)

(defparameter *whiteboard-content* nil)

(defun render-whiteboard ()
	 (when *whiteboard-content*
	   (let ((title (getf *whiteboard-content* :title))
		 (content (reverse (getf *whiteboard-content* :content)))
		 (author (getf *whiteboard-content* :author)))
	     (format nil 
		     "<div class='section whiteboard-animate'><div class='whiteboard-wrap'><div class='whiteboard-container'><div class='whiteboard-header'></div><div class='whiteboard-content'><div class='content-title'>~a</div><div class='content-body' id='wb-body'>~{~a~}~:[~;<p class='quote-author'>~a</p>~]</div><div class='bottom'></div></div><div class='whiteboard-footer'></div></div></div></div>"
		     title 
		     content 
		     author author))))

(defun show-whiteboard (&optional title content author)
  (setf *whiteboard-content* 
	(list :title (or title "")
	      :content (if content 
			   (list (format nil "<p class='fade-in'>~a</p>" content)) 
			   nil)
	      :author author))
  (render-whiteboard))



(defun add-to-whiteboard (text &key (slow nil) (element-id "wb-body"))
  "Adds content to an existing whiteboard element on the page using JavaScript.
   :text - The content to add
   :slow - Whether to use slow fade-in animation
   :element-id - The ID of the whiteboard content element"
  (let ((animation-class (if slow "slow-fade-in" "fade-in")))
    (format nil 
	    "<script>function add_to_whiteboard() {var whiteboard = document.getElementById('~a'); if (whiteboard) { var newContent = document.createElement('p'); newContent.className = '~a';newContent.innerHTML = '~a'; whiteboard.appendChild(newContent); } } </script>"
	    element-id
	    animation-class
	    text)))

(defun clear-whiteboard (&optional (element-id "wb-body"))
  "Clears all content from the whiteboard"
  (format nil 
          "<script>function clear_whiteboard() { var whiteboard = document.getElementById('~a'); if (whiteboard) {whiteboard.innerHTML = '';  } } </script>"
          element-id))
