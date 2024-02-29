import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ASEFAFirstTimeCubitAEFAS extends Cubit<bool> {
  final SharedPreferences pref;
  ASEFAFirstTimeCubitAEFAS(this.pref)
      : super(FirstTimeStorage(pref).getFirstTime());

  Future<void> setFirstTime(bool value) async {
    emit(value);
    await FirstTimeStorage(pref).setFirstTime(state);
  }
}

class FirstTimeStorage {
  final SharedPreferences pref;
  FirstTimeStorage(this.pref);

  Future<void> setFirstTime(bool value) async {
    await pref.setBool('first_time', value);
  }

  bool getFirstTime() {
    return pref.getBool('first_time') ?? true;
  }
}
