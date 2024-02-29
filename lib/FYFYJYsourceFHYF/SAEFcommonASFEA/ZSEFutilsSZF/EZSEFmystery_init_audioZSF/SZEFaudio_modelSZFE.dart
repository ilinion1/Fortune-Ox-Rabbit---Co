import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSEFutilsSZF/EZSEFmystery_init_audioZSF/XDRGaudio_storageDRG.dart';

const audioUrl = 'audio/music.mp3';

// - add to assets
// - add to widgets
// - add initialize to main (pref)

class GSRAudioModelAFSFA extends ChangeNotifier {
  final SharedPreferences pref;
  GSRAudioModelAFSFA(this.pref) {
    _mysteryInitMusicAndSound();
  }

  bool music = true;
  bool sounds = true;

  final musicPlayer = AudioPlayer();
  final soundsPlayer = AudioPlayer();

  void _mysteryInitMusicAndSound() {
    final storage = GSRSTAudioStorageARSGS(pref);
    music = storage.getMusic();
    sounds = storage.getSounds();
    notifyListeners();
  }

  //* ========= MUSIC =========== *//
  Future<void> toggleMusic() async {
    final storage = GSRSTAudioStorageARSGS(pref);
    music = !music;
    notifyListeners();
    await toggleSounds();
    await playOrPauseMusic();
    await storage.setupMusic(music);
  }

  Future<void> playOrPauseMusic() async {
    if (music) {
      await playMusic();
    } else {
      await pauseMusic();
    }
  }

  Future<void> playMusic() async {
    if (musicPlayer.state == PlayerState.playing) return;
    await musicPlayer.play(AssetSource(audioUrl), volume: 0.4);
    musicPlayer.setReleaseMode(ReleaseMode.loop);
  }

  Future<void> pauseMusic() async {
    await musicPlayer.pause();
  }

  //* ========= SOUNDS =========== *//
  Future<void> toggleSounds() async {
    final storage = GSRSTAudioStorageARSGS(pref);
    sounds = !sounds;
    notifyListeners();
    await storage.setupSounds(sounds);
  }

  Future<void> playOrNoSounds(String url) async {
    if (sounds) {
      await soundsPlayer.stop();
      await soundsPlayer.play(AssetSource(url), volume: 1);
    }
  }

  @override
  void dispose() {
    musicPlayer.dispose();
    super.dispose();
  }
}

class HTDSAudioProviderASFRG extends InheritedNotifier {
  final GSRAudioModelAFSFA model;
  const HTDSAudioProviderASFRG({
    super.key,
    required super.child,
    required this.model,
  }) : super(notifier: model);
  static HTDSAudioProviderASFRG read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<HTDSAudioProviderASFRG>()!
        .widget;
    return widget as HTDSAudioProviderASFRG;
  }

  static GSRAudioModelAFSFA watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<HTDSAudioProviderASFRG>()!
        .model;
  }
}
