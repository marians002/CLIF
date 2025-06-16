(in-package :clif)

(defnode undum-language ()
  ()
  :documentation "A class to represent the undum system.")

(defparameter undum (undum-language))

(defmethod initialize-undum (obj (lang undum-language) stream)
  "This is taken verbatim from a slightly modified version of the html that comes with the undum tutorial."

  ;; first the declaration of the doctype
  (format stream "<!DOCTYPE HTML>~%")

  ;; here we start the  html tag
  (format stream "<html lang=\"en\">")

  ;; let's write the head
  (format stream "
  <head>
    <meta charset=\"utf-8\">
    <!-- Game Title: edit this -->
    <title>Undum with Common Lisp</title>
    <!-- End of Game Title -->

    <!-- This is your game's stylesheet, modify it if you like. -->
    <link media=\"screen\"
          rel=\"stylesheet\" href=\"undum.css\">

    <!-- Suppport for mobile devices. -->
    <meta name=\"viewport\" content=\"user-scalable=no, width=device-width\">
    <link rel=\"apple-touch-icon\" href=\"media/img/iphone/icon.png\">
    <link rel=\"apple-touch-startup-image\" href=\"media/img/iphone/splash.png\">
    <meta name=\"apple-mobile-web-app-capable\" content=\"yes\">
    <meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\">
    <!--[if !IE]>-->
    <link media=\"only screen and (max-width: 640px)\"
          rel=\"stylesheet\" type=\"text/css\" href=\"media/css/undum-mobile.css\">
    <!--<![endif]-->

  </head>
")

  ;; let's open the body tag
  (format stream "
  <body>
")

  ;; the toolbar for the mobile devices
  ;; it contains a short description of the title
  (format stream "
    <!-- This isn't needed and isn't visible in desktop versions,
         because we can display the character information and the
         tools onscreen all the time. -->
    <div id=\"toolbar\">
      <!-- Set this to be a small version of the title, for the
           toolbar on mobile devices. -->
      <h1>Learning Undum</h1>
      <div class=\"nav\">
        <a href=\"#\" class=\"button\" id=\"menu-button\">Menu</a>
      </div>
    </div>
")

  ;; let's open the div page
  (format stream "
    <div id=\"page\">
")

  ;; now the text that appears on the left
  (format stream "
      <div id=\"tools_wrapper\">
")

  ;; the following information is dependent on the story
  ;; and maybe in a future, we'll need to modify it
  ;; in the original html said: Game background edit this
  ;; this may be the info_panel
  (format stream "
        <div id=\"info_panel\" class=\"tools left\">
          <!-- Game Background: edit this -->
          <h1>Undum</h1>
          <p>
            ESTE EL CÓDIGO QUE APARECE A LA IZQUIERDA
          </p>
          <!-- End of Game Background -->

          <div class='buttons'>
            <button id=\"save\">Save</button><button id=\"erase\">Erase</button>
          </div>
        </div>
")

  ;; now comes the character panel
  (format stream "
        <div id=\"character_panel\" class=\"tools right\">
          <h1>Cosas del personaje</h1>
          <div id=\"character\">
            <div id=\"character_text\">
              <div id=\"character_text_content\"></div>
            </div>
            <div id=\"qualities\"></div>
          </div>
        </div>
")

  ;; let's cdloe the div.tools_wrapper
  (format stream "      </div> <!-- End of div.tools_wrapper -->
")

  ;; now, the mid_panel
  ;; there is some info related to the game
  ;; in this portion of the html
  (format stream "
      <div id=\"mid_panel\">
        <div id=\"title\">
          <div class=\"label\">

            <!-- Game Title: edit this -->
            <h1>Mi primera historia con undum <span>&amp;</span><br>
              Interactive Example</h1>
            <h2>por @fernan2rodriguez</h2>
            <!-- End of Game Title -->

            <noscript><p class=\"noscript_message\">This game requires 
              Javascript.</p></noscript>
            <p class=\"click_message\">click to begin</p>
          </div>
        </div>
")

  ;; the content wrapper
  (format stream "
        <div id=\"content_wrapper\">
          <div id=\"content\">
          </div>
          <a name=\"end_of_content\"></a>
        </div>
")

  ;; the legal part
  (format stream "
        <div id=\"legal\">
          <!-- Your Copyright: edit this -->
          <p>Estas son las cosas de copyright.</p>
          <!-- End of Your Copyright -->

          <!-- This line is totally optional. -->
          <p>Created with <a href=\"http://idmillington.github.io/undum/\">Undum</a>.</p>
        </div>")

  ;; let's close the div for the midpanel
  (format stream "
      </div>")

  ;; let's close the div page
  (format stream "
    </div> <!-- End of div.page -->
")


  ;; now, let's add the UI elements
  (format stream "
    <!-- Holds UI elements that will be cloned and placed in the main
         page. This block itself is always hidden. -->
    <div id=\"ui_library\">
      <div id=\"quality\" class=\"quality\">
        <span class=\"name\" data-attr=\"name\"></span>
        <span class=\"value\" data-attr=\"value\"></span>
      </div>

      <div id=\"quality_group\" class=\"quality_group\">
        <h2 data-attr=\"title\"></h2>
        <div class=\"qualities_in_group\">
        </div>
      </div>

      <div id=\"progress_bar\" class=\"progress_bar\">
        <span class=\"name\" data-attr=\"name\"></span>
        <span class=\"value\" data-attr=\"value\"></span>
        <div class=\"progress_bar_track\">
          <div class=\"progress_bar_color\" data-attr=\"width\">
          </div>
        </div>
        <span class=\"left_label\" data-attr=\"left_label\"></span>
        <span class=\"right_label\" data-attr=\"right_label\"></span>
      </div>

      <hr id=\"turn_separator\">
    </div>
")

  ;; let's load the libraries jquery.js and undum.js
  ;; right now the libraries are in the same directory
  ;; as the original story
  (format stream "
    <!-- Load the libraries we depend on -->
    <script type=\"text/javascript\" src=\"jquery-2.1.3.min.js\"></script>
    <script type=\"text/javascript\" src=\"undum.js\"></script>
")

  ;; now the name of the file with our game
  ;; right now the game is supposed to be in the same
  ;; folder as the html and the name should be undum-game.js
  (format stream "
    <!-- Change the name of this file. It is your main game file. -->
    <script type=\"text/javascript\"
            src=\"undum-game.js\">
    </script>")

  ;; let's close the body tag
  (format stream "
  </body>
")


  ;; and finally, we close the html tag
  (format stream "</html>")

  )

(defmethod generate-code ((obj number) (lang undum-language) stream)
  (format stream "~a" obj))

(defmethod generate-code ((obj string) (lang undum-language) stream)
  (format stream "~a" obj))

(defmethod generate-code ((obj symbol) (lang undum-language) stream)
  (format stream "~a" (symbol-name obj)))

(defmethod generate-code((node list)
                         (lang undum-language)
                         stream)
  (format stream "~{~a~}"
          (mapcar (lambda (x) (gcodenil-exp x))
                  node)))

(defmethod generate-code((node (eql nil))
                         (lang undum-language)
                         stream)
  (format stream ""))

(defmethod generate-code ((obj basic-situation) (lang undum-language) stream)
  (format stream
"    ~a: new undum.SimpleSituation(
         \"~{~a~}\"
    )"
(id obj)
(mapcar (lambda (x) (generate-code x lang nil)) (contents obj))))

(generate-code-for-html-tag link
   (format stream "<a class='~a' href='~a'>~a</a>"
           css-classes
           (gcodenil target)
           contents))

(defmethod generate-code ((obj newline-in-js-class) (lang undum-language) stream)
  (format stream "\\~%"))

(defmethod generate-code ((obj story-class) (lang undum-language) stream)
  "This is taken verbatim from the .js file that comes with the example in undum."

  ;; first the initial comment
  (format stream "// ---------------------------------------------------------------------------
// Edit this file to define your game. It should have at least four
// sets of content: undum.game.situations, undum.game.start,
// undum.game.qualities, and undum.game.init.
// ---------------------------------------------------------------------------
")

  ;; now the game id
  (format stream "
/* A unique id for your game. This is never displayed. I use a UUID,
 * but you can use anything that is guaranteed unique (a URL you own,
 * or a variation on your email address, for example). */
undum.game.id = \"be1c95b9-cbc7-48c6-8e6a-89837aa9113e\";
")

  ;; the version of the game
  (format stream "
/* A string indicating what version of the game this is. Versions are
 * used to control saved-games. If you change the content of a game,
 * the saved games are unlikely to work. Changing this version number
 * prevents Undum from trying to load the saved-game and crashing. */
undum.game.version = \"1.0\";
")

  ;; the variables that control the visualization (so far they are hardcoded)

  (format stream "
/* A variable that changes the fade out speed of the option text on
 * a mobile. */
undum.game.mobileHide = 2000

/* A variable that changes the options fade out speed. */
undum.game.fadeSpeed = 1500

/* A variable that changes the slide up speed after clicking on an
 * option. */
undum.game.slideUpSpeed = 500
")

  ;; now come the situations
  ;; first, we add the comment
  (format stream "
/* The situations that the game can be in. Each has a unique ID. */
")

  (format stream "undum.game.situations = {~%")

  ;; let's add the situations from the slot in the class
  ;; first, we add the first situation
  (generate-code (first (situations obj)) lang stream)

  ;; now we add the rest of the situations
  ;; separated by a comma

  (loop for situation in (rest (situations obj)) doing
        ;; first, let's add the comma
        ;; and two new lines
        (format stream ",~2%")
        ;; now let's add the next situation
        (generate-code situation lang stream)
        )

  ;; let's close the situations brackets
  ;; and add a semicolon
  (format stream "~%};~%")

  ;; let's add the id of the starting situation
  (format stream "
// ---------------------------------------------------------------------------
/* The Id of the starting situation. */
undum.game.start = \"~a\";
" (initial-situation obj))

  ;; this is the place to define the qualities
  ;; first the comment

  (format stream "
// ---------------------------------------------------------------------------
/* Here we define all the qualities that our characters could
 * possess. We don't have to be exhaustive, but if we miss one out then
 * that quality will never show up in the character bar in the UI. */
")

  ;; and now we define the qualities
  (format stream "
undum.game.qualities = {
    skill: new undum.IntegerQuality(
        \"Skill\", {priority:\"0001\", group:'stats'}
    ),
    stamina: new undum.NumericQuality(
        \"Stamina\", {priority:\"0002\", group:'stats'}
    ),
    luck: new undum.FudgeAdjectivesQuality( // Fudge as in the FUDGE RPG
        \"<span title='Skill, Stamina and Luck are reverently borrowed from the Fighting Fantasy series of gamebooks. The words representing Luck are from the FUDGE RPG. This tooltip is illustrating that you can use any HTML in the label for a quality (in this case a span containing a title attribute).'>Luck</span>\",
        {priority:\"0003\", group:'stats'}
    ),

    inspiration: new undum.NonZeroIntegerQuality(
        \"Inspiration\", {priority:\"0001\", group:'progress'}
    ),
    novice: new undum.OnOffQuality(
        \"Novice\", {priority:\"0002\", group:'progress', onDisplay:\"&#10003;\"}
    )
};
")

  ;; the groups of the qualities
  (format stream "
// ---------------------------------------------------------------------------
/* The qualities are displayed in groups in the character bar. This
 * determines the groups, their heading (which can be null for no
 * heading) and ordering. QualityDefinitions without a group appear at
 * the end. It is an error to have a quality definition belong to a
 * non-existent group. */
undum.game.qualityGroups = {
    stats: new undum.QualityGroup(null, {priority:\"0001\"}),
    progress: new undum.QualityGroup('Progress', {priority:\"0002\"})
};
")

  ;; the function that is run at the begining of the game
  (format stream "
// ---------------------------------------------------------------------------
/* This function gets run before the game begins. It is normally used
 * to configure the character at the start of play. */
undum.game.init = function(character, system) {
    character.qualities.skill = 12;
    character.qualities.stamina = 12;
    character.qualities.luck = 0;
    character.qualities.novice = 1;
    character.qualities.inspiration = 0;
    system.setCharacterText(\"<p>You are starting on an exciting journey.</p>\");
};")

  )

(generate-code-for-simple-html-tag html-h1 "h1")

(generate-code-for-simple-html-tag html-p "p")

(defmethod generate-code ((obj html-br) (lang undum-language) stream)
 (format stream "<br>"))

(generate-code-for-simple-html-tag html-ul "ul")

(generate-code-for-simple-html-tag html-ol "ol")

(generate-code-for-simple-html-tag html-li "li")

(generate-code-for-html-tag html-button
  (format stream "<button class='~a' onclick='this.disabled=true; ~(~a~)()'>~a</button>"
	  css-classes
	  (gcodenil function-name)
	  contents))
