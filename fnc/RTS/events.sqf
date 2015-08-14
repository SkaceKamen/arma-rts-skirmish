[] spawn {
	while{true} do {
		waitUntil { !dialog };
		sleep 1;
		if (!dialog) then {
			call RTS_onClosed;
		};
	};
};

_loaded = [] spawn {
	disableSerialization; waitUntil {false};
};
waitUntil{scriptDone _loaded;};
call RTS_onLoad;