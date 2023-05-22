import 'dart:async';

import 'package:flutter/widgets.dart';

class DynamicInputController extends ChangeNotifier {
  int length;
  late String text = "";
  final StreamController<void> _clearAction = StreamController<void>.broadcast();
  Stream<void> get clearAction => _clearAction.stream;


  DynamicInputController({
    required this.length,
  });

  changeText(String text) {
    this.text = text;
    notifyListeners();
  }

  clear() {
    text ="";
    _clearAction.add(null);
  }

  @override
  void dispose() {
    super.dispose();
    _clearAction.close();
  }
}
