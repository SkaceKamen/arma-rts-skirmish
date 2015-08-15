_win = _this;
_musicvolume = musicvolume;
0.2 fademusic 0;
sleep 0.2;
_musicList = if (isnull curatorcamera) then {["EventTrack02_F_Curator","EventTrack01_F_Curator"]} else {["EventTrack02_F_Curator","EventTrack03_F_Curator"]};
playmusic (_musicList select _win);
0 fademusic _musicvolume;
sleep 0.4;