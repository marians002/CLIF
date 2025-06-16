// ---------------------------------------------------------------------------
// Edit this file to define your game. It should have at least four
// sets of content: undum.game.situations, undum.game.start,
// undum.game.qualities, and undum.game.init.
// ---------------------------------------------------------------------------

/* A unique id for your game. This is never displayed. I use a UUID,
 * but you can use anything that is guaranteed unique (a URL you own,
 * or a variation on your email address, for example). */
undum.game.id = "be1c95b9-cbc7-48c6-8e6a-89837aa9113e";

/* A string indicating what version of the game this is. Versions are
 * used to control saved-games. If you change the content of a game,
 * the saved games are unlikely to work. Changing this version number
 * prevents Undum from trying to load the saved-game and crashing. */
undum.game.version = "1.0";

/* A variable that changes the fade out speed of the option text on
 * a mobile. */
undum.game.mobileHide = 2000

/* A variable that changes the options fade out speed. */
undum.game.fadeSpeed = 1500

/* A variable that changes the slide up speed after clicking on an
 * option. */
undum.game.slideUpSpeed = 500

/* The situations that the game can be in. Each has a unique ID. */
undum.game.situations = {
    start_3: new undum.SimpleSituation(
         "<h1 class=''>Había una vez un niño que hacía historias con clif...</h1>\
<p class=''><a class='' href='usa_macros'>usando macros.</a></p><p class=''><a class='' href='sin_usar_macros'>sin usar macros.</a>Y <br> SALTAAAAA</p><ul class=''><li class=''>item 1</li><li class=''>item2</li></ul><ol class=''><li class=''>First element</li><li class=''>Second element</li></ol><p class=''>Mientras decía: el último teorema de fermat dice...  </p>\
<div class='section whiteboard-animate'><div class='whiteboard-wrap'><div class='whiteboard-container'><div class='whiteboard-header'></div><div class='whiteboard-content'><div class='content-title'>Math Lesson</div><div class='content-body' id='wb-body'><p class='fade-in'>2+2=</p></div><div class='bottom'></div></div><div class='whiteboard-footer'></div></div></div></div>\
<script>function add_to_whiteboard() {var whiteboard = document.getElementById('wb-body'); if (whiteboard) { var newContent = document.createElement('p'); newContent.className = 'fade-in';newContent.innerHTML = '4'; whiteboard.appendChild(newContent); } } </script><button class='' onclick='this.disabled=true; add_to_whiteboard()'>clic para saber que gritó</button><script>function clear_whiteboard() { var whiteboard = document.getElementById('wb-body'); if (whiteboard) {whiteboard.innerHTML = '';  } } </script><button class='' onclick='this.disabled=true; clear_whiteboard()'>clic to erase the  whiteboard</button>"
    ),

    usa_macros: new undum.SimpleSituation(
         "<p class=''>Y vivió feliz para siempre :-D.</p><p class=''>FIN</p>"
    )
};

// ---------------------------------------------------------------------------
/* The Id of the starting situation. */
undum.game.start = "start_3";

// ---------------------------------------------------------------------------
/* Here we define all the qualities that our characters could
 * possess. We don't have to be exhaustive, but if we miss one out then
 * that quality will never show up in the character bar in the UI. */

undum.game.qualities = {
    skill: new undum.IntegerQuality(
        "Skill", {priority:"0001", group:'stats'}
    ),
    stamina: new undum.NumericQuality(
        "Stamina", {priority:"0002", group:'stats'}
    ),
    luck: new undum.FudgeAdjectivesQuality( // Fudge as in the FUDGE RPG
        "<span title='Skill, Stamina and Luck are reverently borrowed from the Fighting Fantasy series of gamebooks. The words representing Luck are from the FUDGE RPG. This tooltip is illustrating that you can use any HTML in the label for a quality (in this case a span containing a title attribute).'>Luck</span>",
        {priority:"0003", group:'stats'}
    ),

    inspiration: new undum.NonZeroIntegerQuality(
        "Inspiration", {priority:"0001", group:'progress'}
    ),
    novice: new undum.OnOffQuality(
        "Novice", {priority:"0002", group:'progress', onDisplay:"&#10003;"}
    )
};

// ---------------------------------------------------------------------------
/* The qualities are displayed in groups in the character bar. This
 * determines the groups, their heading (which can be null for no
 * heading) and ordering. QualityDefinitions without a group appear at
 * the end. It is an error to have a quality definition belong to a
 * non-existent group. */
undum.game.qualityGroups = {
    stats: new undum.QualityGroup(null, {priority:"0001"}),
    progress: new undum.QualityGroup('Progress', {priority:"0002"})
};

// ---------------------------------------------------------------------------
/* This function gets run before the game begins. It is normally used
 * to configure the character at the start of play. */
undum.game.init = function(character, system) {
    character.qualities.skill = 12;
    character.qualities.stamina = 12;
    character.qualities.luck = 0;
    character.qualities.novice = 1;
    character.qualities.inspiration = 0;
    system.setCharacterText("<p>You are starting on an exciting journey.</p>");
};