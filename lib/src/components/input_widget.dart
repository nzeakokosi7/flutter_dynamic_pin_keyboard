import 'package:dynamic_pin_keyboard/src/main.dart';
import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  final String inputText;
  final List<int> inputNumbers;
  final double? inputHeight;
  final double? inputWidth;
  final double? inputBorderWidth;
  final double? inputBorderRadius;
  final double? inputElevation;
  final double? inputFontSize;
  final Color? inputBorderColour;
  final Color? inputFillColour;
  final Color? inputShadowColour;
  final Color? inputUnderlineColour;
  final InputShape inputShape;
  final bool inputHasBorder;
  final bool underlineInputs;
  final bool obscureInputs;
  final String? obscuringCharacter;
  final Color? obscuringModeDefaultColor;
  final Color? inputTextColor;
  final TextStyle? inputTextStyle;

  const InputWidget({
    super.key,
    required this.inputText,
    required this.inputShape,
    required this.inputNumbers,
    this.inputHeight,
    this.inputWidth,
    this.inputBorderWidth = 1,
    this.inputBorderColour,
    this.inputFillColour,
    this.inputBorderRadius = 1,
    this.inputElevation,
    this.inputShadowColour,
    this.inputHasBorder = false,
    this.underlineInputs = true,
    this.obscureInputs = false,
    this.obscuringCharacter,
    this.inputTextColor,
    this.inputTextStyle,
    this.obscuringModeDefaultColor,
    this.inputFontSize,
    this.inputUnderlineColour,
  });

  BoxBorder? get inputBorder {
    if (!inputHasBorder && !underlineInputs) return null;
    if (underlineInputs) {
      return Border(
        bottom: BorderSide(
          color: inputUnderlineColour!,
          width: inputBorderWidth!,
        ),
      );
    }
    return Border.all(
      color: inputBorderColour ?? Colors.black,
      width: inputBorderWidth!,
    );
  }

  Color get shadowColour {
    if (inputElevation == null) return Colors.transparent;
    if (inputShadowColour != null) {
      return inputShadowColour!.withOpacity(0.6);
    }
    return Colors.black.withOpacity(0.6);
  }

  String textCharacter(int position) {
    if (obscureInputs) return obscuringCharacter!;
    if (inputText.isNotEmpty && inputText.length > position) {
      return inputText[position];
    }
    return "";
  }

  BorderRadius? get borderRadius {
    if (underlineInputs) return null;
    if (inputShape == InputShape.rounded) {
      return const BorderRadius.all(Radius.circular(100));
    }
    return BorderRadius.all(Radius.circular(inputBorderRadius!));
  }

  Color obscureColor(int position) {
    if (inputText.isEmpty) return obscuringModeDefaultColor!;
    if (inputText.length > position) {
      return inputTextColor ?? Colors.black;
    }
    return obscuringModeDefaultColor!;
  }

  TextStyle? textStyle(int position) {
    if (obscureInputs) {
      return TextStyle(color: obscureColor(position), fontSize: inputFontSize);
    }
    if (inputTextStyle != null) return inputTextStyle!;
    return TextStyle(color: inputTextColor ?? Colors.black, fontSize: inputFontSize);
  }

  Widget inputWidget(BuildContext context, int position) {
    return Container(
      height: inputHeight ?? MediaQuery.of(context).size.width * 0.1,
      width: inputWidth ?? MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
        border: inputBorder,
        color: inputFillColour ?? Colors.transparent,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: shadowColour,
            spreadRadius: 3,
            blurRadius: 9,
            offset:
                Offset(0, inputElevation ?? 0), // changes position of shadow
          ),
        ],
        shape: inputShape == InputShape.circular
            ? BoxShape.circle
            : BoxShape.rectangle,
      ),
      child: Center(
        child: Text(
          textCharacter(position),
          style: textStyle(position),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: inputNumbers.map((e) => inputWidget(context, e)).toList(),
    );
  }
}
