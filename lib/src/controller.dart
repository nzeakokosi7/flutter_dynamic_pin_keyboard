import 'package:flutter/widgets.dart';

class DynamicInputController extends ChangeNotifier {
  int length;
  String text;

  DynamicInputController({
    required this.length,
    this.text = "",
  });

  changeText(String text) {
    this.text = text;
    notifyListeners();
  }
}
