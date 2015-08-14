/*call RTS_onClosed;*/

_loaded = [] spawn {
	disableSerialization; waitUntil {false};
};
waitUntil{scriptDone _loaded;};
call RTS_onLoad;