disableSerialization;

_ok = createDialog "RTS_Help";
if (!_ok) exitWith {
	systemChat "Fatal error. Couldn't create dialog.";
};

_keycolor = '#AAD5FF';
_pointcolor = '#FF8040';

_text = format["
	<t size='2'>Controls</t><br />
	Use <t color='%1'>WSAD</t> to move camera<br />
	Use <t color='%1'>MMB</t> or <t color='%1'>CTRL+LMB</t> to rotate camera<br />
	Use <t color='%1'>LMB</t> to select units<br />
	Use <t color='%1'>RMB</t> to issue orders<br />
	<t size='2'>Gameplay</t><br />
	Player with <t color='%2'>0</t> points looses the game<br />
	Player with less flags captured looses <t color='%2'>%3</t> points per second<br />
	Player loose <t color='%2'>%4</t> points for loosing soldier<br />
	Player loose <t color='%2'>%5</t> points for loosing vehicle<br />
	<t size='2'>Reinforcements</t><br />
	You use reinforcement points to call in your units<br />
	Each player starts with same amout of reinforcements points<br />
	Each player gains same amout of points per second<br />
	Points per seconds depends on game time
", _keycolor, _pointcolor, RTS_OPTIONS_SCORE_PER_FLAG, RTS_OPTIONS_SCORE_PER_KILL, RTS_OPTIONS_SCORE_PER_VEHICLE];

("RTS_Help" call RTS_getDisplay) displayAddEventHandler ["unload", "_this call RTS_UI_Help_unload"];

_ctrl = ["RTS_Help", "mainText"] call RTS_getCtrl;
_ctrl ctrlSetStructuredText parseText(_text);

_ctrl = ["RTS_Help", "buttonClose"] call RTS_getCtrl;
_ctrl ctrlAddEventHandler ["ButtonClick", {
	closeDialog 0;
}];