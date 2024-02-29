import 'package:flutter/material.dart';

class FAEFSBlockButtonASEFA extends ValueNotifier<bool> {
  FAEFSBlockButtonASEFA(super.value);

  void setBlockButton(bool value) {
    this.value = value;
    notifyListeners();
  }
}

abstract class MysteryAppProvider {
  static final blockButton = FAEFSBlockButtonASEFA(false);
}
