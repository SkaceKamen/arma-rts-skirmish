systemChat "UI has been closed. It will be reopened in 5 seconds.";
sleep 5;
if (!dialog) then {
	switch(RTS_STATE) do {
		case "";
		case "config": {
			[] spawn RTS_UI_Config_start;
		};
		case "result": {
			[] spawn RTS_UI_Result_start;
		};
		case "ui": {
			[] spawn RTS_UI_start;
		};
	};
};