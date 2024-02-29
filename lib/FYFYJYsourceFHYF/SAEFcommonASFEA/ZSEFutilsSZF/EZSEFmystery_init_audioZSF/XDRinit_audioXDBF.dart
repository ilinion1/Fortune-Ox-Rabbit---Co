import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSEFutilsSZF/EZSEFmystery_init_audioZSF/SZEFaudio_modelSZFE.dart';

class YEYInitAudioAGRSG extends StatefulWidget {
  const YEYInitAudioAGRSG({
    super.key,
    required this.child,
    required this.pref,
  });

  final Widget child;
  final SharedPreferences pref;

  @override
  State<YEYInitAudioAGRSG> createState() => _YEYInitAudioAGRSGState();
}

class _YEYInitAudioAGRSGState extends State<YEYInitAudioAGRSG> {
  late final GSRAudioModelAFSFA model;

  @override
  void initState() {
    super.initState();
    model = GSRAudioModelAFSFA(widget.pref);
  }

  @override
  Widget build(BuildContext context) {
    return HTDSAudioProviderASFRG(
      model: model,
      child: FotbalovyInitAudioWidget(child: widget.child),
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}

class FotbalovyInitAudioWidget extends StatefulWidget {
  const FotbalovyInitAudioWidget({super.key, required this.child});

  final Widget child;

  @override
  State<FotbalovyInitAudioWidget> createState() =>
      FotbalovyInitAudioWidgetState();
}

class FotbalovyInitAudioWidgetState extends State<FotbalovyInitAudioWidget>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    final model = HTDSAudioProviderASFRG.read(context).model;
    model.playOrPauseMusic();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (AppLifecycleState.paused == state) {
      final model = HTDSAudioProviderASFRG.read(context).model;
      await model.pauseMusic();
    } else if (AppLifecycleState.resumed == state) {
      final model = HTDSAudioProviderASFRG.read(context).model;
      if (model.music) {
        await model.playMusic();
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) async {
        final model = HTDSAudioProviderASFRG.read(context).model;
        if (model.music) {
          await model.pauseMusic();
        }
      },
      child: widget.child,
    );
  }
}
