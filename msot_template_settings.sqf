/*
Dies sind alle Settings die zur Steuerung des Templates nötig sind ohne Einstellungen in verschiedenen Teilen des Templates durchführen zu müssen!
Es ist zum erstellen und testen der Mission gedacht, wodurch ein DEBUG-MODUS zur Verfügung steht und nicht bei jedem Neustart die Intros abgespielt werden.

>>Jedoch ist es erforderlich diese Einstellungen beim Release wieder auf die Default-Werte anzupassen, um Fehler bzw Vorzüge zu vermeiden!<<

Erlaubt ist es nur, vorgegebene Änderungen an den Variablen vorzunehmen bzw. eigene hinzuzufügen, jedoch nicht diese zu Löschen oder die Variable selbst
umzubenennen.

*/

//Aktiviert den DEBUG-Modus: true - an / false - aus
MSOT_DEBUG_MODE = true; //default: false

//------------------------------------------------------------------------
// Spielt das Intro mit Camerafahrt ab: true - an / false - aus
MSOT_PLAY_INTRO_WITH_CAM = false; //default: true

// Spielt das MSOT LOGO ab: true - an / false - aus
MSOT_PLAY_INTRO_WITH_LOGO = false; //default: true

// Spielt die Intro Musik ab: true - an / false - aus
MSOT_PLAY_INTRO_MUSIC = false; //default: true

//Intro Länge in Sekunden
MSOT_INTRO_TIME = 25; //default: 25

//Kamera Distanz bei Start (in Meter - wenn kein CAM_START Markernamen angegeben wurde)
MSOT_CAM_DISTANCE = 10000; //default: 10000

//Kamera Höhe über See Level bei Intro Start (in Meter)
MSOT_CAM_HEIGHT_START = 500; //default: 500

//Kamera Höhe über Spieler bei Intro Ende (in Meter)
MSOT_CAM_HEIGHT_PLAYER_END = 5; //default: 5

//Individueller Kamera-Startpunkt: Name des StartMarkers
MSOT_CAM_START_MARKER = ""; // default: ""
//-------------------------------------------------------------------------

//Verliert seine Ausrüstung am Start der Mission: true - an / false - aus
MSOT_CLEAR_EQUIPMENT = false; //default: true

//*********** Neue Ausrüstung - NEW_SETTING = "scripts\newEquipments.sqf"; ***** Playernamen wird übergeben ****************************************
//Teilt dem Spieler (sofern er im Script mit Player angesprochen wird) eine neue Ausrüstung zu!
NEW_SETTING = ""; //default: ""

//**************************************************************************************************************************************************
/**************************************************************************************************************************************************
Blacklist Arsenal - um diese Arsenalbox zu nutzen, musst du folgenden Befehl in die Init-Zeile der Box eintragen:

this addAction ['<t color=''#f000ff00''>Open Arsenal</t>',{[] spawn MSOT_arsenal_fnc_initArsenal},[],1.5,true,true,"","true",5];

In die ARSENAL_BLACKLIST dann einfach die Classnames Eintragen die NICHT hinzugefügt werden sollen
zBsp ARSENAL_BLACKLIST = ["B_UavTerminal","O_UavTerminal","I_UavTerminal","C_UavTerminal"];
*/

ARSENAL_BLACKLIST = [];

//**************************************************************************************************************************************************
