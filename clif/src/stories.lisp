(scene introduction
	(change-bg-color "blue")
       (change-bg-image "/home/marian/Pictures/logoMatcom1.png")
	(title "Welcome to the Adventure")


	(text (tt "You see two paths before you:"))
	(math-center "\\sum_{i=1}^n i^2 = \\frac{n(n+1)(2n+1)}{6}")

       (whiteboard "Quick Notes" "whatever"
(text "prueba"))

(newline)
(code-node "python"
"def hello_world():
    print(\"Hello, world!\")")
(newline)
(code-node "lisp"
"(format nil \"(defun factorial (n)~%  (if (<= n 1)~%      1~%      (* n (factorial (1- n)))))\")")

  (newline)

	(action test-action "clic here" cambio-id "CAMBIO")
   (newline)
	(image "/home/marian/Pictures/firma.jpg"
	       "Company Logo"
	       :align :right
	       :size 20)
   (newline)
       (start-sound "/home/marian/Music/rain.mp3")
   (newline)
   (video "/home/marian/Videos/Screencasts/tutorial.webm" :alt-text "Instructional video")

	(enumerate (item (link forest "Take the forest path"))
		   (item (link cave "Enter the dark cave"))))
   t
   (scene forest
	(title "The Enchanted Forest")
	(text (b "You enter a lush green forest."))
	(text (it "The trees whisper secrets as you walk by."))
	(link introduction "Go back to the starting point"))

   (scene cave
	(title "The Dark Cave")
	(text (strike "You step into the cold, damp cave."))
	(text (underline "Your footsteps echo in the darkness."))
	(link introduction "Retreat to safety"))

(story my-story 
       (:author "Marian S." 
        :story-title "A Simple Adventure" 
        :start introduction)
       introduction
       forest
       cave)

(generate-code my-story html "/home/marian/Documents/MATCOM/Tesis/clif/stories_file/")

(generate-code my-story latex "/home/marian/Documents/MATCOM/Tesis/latex/")

(scene intro
 (title "Introducción al problema de mínimos cuadrados")
 (change-bg-image "/home/marian/Documents/MATCOM/Tesis/historias/fade.png")
 (text (b "Bienvenido a esta lección interactiva para resolver el problema de mínimos cuadrados"))
 (text "Primero vamos a cargar las librerías necesarias:")

 (code-node "python"
 "import numpy as np
import scipy as sp
import scipy.optimize as spo
import matplotlib.pyplot as plt")

 (text "Lo segundo es crear los datos" (math-inline "(x_i, y_i)"))

 (code-node "python" 
 "xdata = [1, 2, 3]
ydata = [2, 3, 4]")

 (link plotting "Haz clic aquí para graficar esos puntos."))

(scene plotting
 (title "Visualización de los datos")
 (text "Here's a plot of our data points:")

 (image "/home/marian/Documents/MATCOM/Tesis/historias/plot1.png" "Ejemplos de puntos" :align :center)

 (text "Perfecto.  Ahora definimos una función parámetrica, que depende de la x y de un conjunto de parámetros.  En este caso vamos a definir una recta:
")

(whiteboard "Ecuación de la recta" "Fernando"  (math-center "f(x,p) = p_1 x + p_2") )

(text "En python, eso lo podemos hacer con una función que depende de dos variables:")

 (code-node "python"
 "def fp(x, p):
    return x*p[0] + p[1]"))

(story least-squares-story
       (:author "Data Science Team"
        :story-title "Solving Least Squares Problems"
        :start intro)
       intro
       plotting)

(generate-code least-squares-story html "/home/marian/Documents/MATCOM/Tesis/historias/")
(generate-code least-squares-story latex "/home/marian/Documents/MATCOM/Tesis/historias/")

(scene inicio
 (change-bg-image "/home/marian/Documents/MATCOM/Tesis/historias/nueva/bg.jpg")
 (title "Aventura en el Bosque Encantado")

 (start-sound "/home/marian/sound/birds.mp3" :alt-text "Se escuchan pájaros en la distancia")



 (text (b "¡Bienvenido a una aventura interactiva!"))
 (text "Estás parado en el borde de un misterioso bosque. El viento susurra entre los árboles...")

 (text "Opciones disponibles:")
 (enumerate 
   (item (link explorar "Explorar el bosque"))
   (item (item (action recoger-flor "Recoger una flor brillante" next-scene "flor")))
   (item (item (text (it "Observar los alrededores")))))

 (text "Recuerda estas reglas importantes:")
 (enumerate 
   (item "No hables con extraños")
   (item "Lleva siempre agua")
   (item "Regresa antes del anochecer"))

 (newline)
 (text "¿Qué deseas hacer?"))

(scene explorar
 (title "Explorando el Bosque")
 (text "Has decidido adentrarte en el bosque. Los rayos de sol filtran entre las hojas.")

 (text (b "Encuentras tres senderos:"))
 (enumerate
   (item (link sendero-izq "Sendero izquierdo - conduce a un arroyo"))
   (item (item (action investigar-ruido "Investigar ruido misterioso" next-scene "ruido")))
   (item (link inicio "Volver al punto inicial")))

 (whiteboard "¿Será cierto que..." "K. Manzano"   (math-center "\\sum_{i=1}^n i^2 = \\frac{n(n+1)(2n+1)}{6}"))
 (text (underline "Escuchas pájaros cantando en la distancia.")))

;; (scene flor
;;  (title "La Flor Mágica")
;;  (change-bg-color "#ffe6f3")
;;  (image "/path/to/flower.jpg" "Flor brillante" :size 30 :align :right)

;;  (text "Has encontrado una flor que brilla con luz propia!")
;;  (text "Opciones disponibles:")
;;  (enumerate
;;    (item (action oler-flor "Oler la flor" next-scene "olor"))
;;    (item (link guardar-flor "Guardarla en tu mochila"))
;;    (item (link inicio "Dejarla y regresar"))))

;; (scene olor
;;  (title "El Aroma Mágico")
;;  (text "Al acercarte a oler la flor, un dulce aroma te envuelve...")
;;  (text (strike "De repente, todo a tu alrededor comienza a cambiar!"))

;;  (text "¿Qué haces?")
;;  (enumerate
;;    (item (action cerrar-ojos "Cerrar los ojos rápidamente" next-scene "vision"))
;;    (item (link correr "Correr de regreso al camino"))
;;    (item (text "Quedarte quieto y observar"))))

;; (scene vision
;;  (title "Una Nueva Visión")
;;  (text "Al abrir los ojos, ves el bosque con nuevos colores que nunca antes habías percibido!")

;;  (text "Ahora puedes:")
;;  (enumerate
;;    (item (link hablar-arboles "Hablar con los árboles"))
;;    (item (item (action volver-normal "Intentar volver a la normalidad" next-scene "inicio")))
;;    (item (text "Explorar tus nuevos poderes")))

;;  (text (b "¡Felicidades! Has descubierto la magia del bosque."))
;;  (link inicio "Volver al comienzo de la historia"))

(story aventura-bosque
       (:author "Storyteller Inc."
        :story-title "El Bosque Encantado" 
        :start inicio)
       inicio
       explorar)

(generate-code aventura-bosque html "/home/marian/Documents/MATCOM/Tesis/historias/nueva/")
(generate-code aventura-bosque latex "/home/marian/Documents/MATCOM/Tesis/historias/nueva/")
