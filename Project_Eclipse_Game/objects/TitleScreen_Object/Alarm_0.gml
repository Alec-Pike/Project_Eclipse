if numSoundsPlayed < 3 {
    numSoundsPlayed++;
    audio_play_sound(CharacterDeath_Sound,1,false);
    alarm[0] = 30;
}
