import 'package:dynamic_pin_keyboard/src/components/dynamic_keyboard.dart';
import 'package:dynamic_pin_keyboard/src/components/input_widget.dart';
import 'package:dynamic_pin_keyboard/src/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum KeyButtonShape { circular, rounded, defaultShape }

enum InputShape { circular, rounded, defaultShape }

class DynamicPinKeyboard extends StatefulWidget {
  final KeyButtonShape keyboardButtonShape;
  final InputShape inputShape;
  final double keyboardMaxWidth;
  final double keyboardVerticalSpacing;
  final double spacing;

  final Color? keyboardButtonFillColor;
  final Color? keyboardButtonBorderColor;
  final Color? keyboardButtonTextColor;

  final double? keyboardButtonBorderWidth;
  final double? keyboardButtonElevation;
  final Color? keyboardButtonShadowColor;
  final double? inputWidth;
  final Color? defaultUtilityKeyButtonFillColour;
  final Icon? defaultUtilityKeyButtonIcon;
  final Color? deleteKeyButtonFillColour;
  final Icon? deleteKeyButtonIcon;

  final double inputsMaxWidth;
  final DynamicInputController pinInputController;
  final VoidCallback onSubmit;
  final Color? inputFillColor;
  final Color? inputBorderColor;
  final Color? inputUnderlineColor;
  final Color? inputTextColor;
  final bool inputHasBorder;
  final bool? underlineInputs;
  final bool obscureInputs;
  final double? inputBorderWidth;
  final String? obscuringCharacter;
  final double? inputElevation;
  final Color? inputShadowColor;
  final Color errorColor;
  final double? keyboardFontSize;
  final double? inputFontSize;
  final double? inputBorderRadius;
  final double? inputHeight;

  final String? extraInput;
  final Icon? backButton;
  final Icon? doneButton;
  final double? keyboardButtonBorderRadius;
  final TextStyle? inputTextStyle;
  final TextStyle? keyboardButtonTextStyle;
  final Widget? utilityKeyButton;
  final Widget? deleteButton;
  final double? keyboardButtonSize;
  final Color? obscuringModeDefaultColor;
  final String? keyboardFontFamily;
  final bool enableKeyboardButtonBorder;
  final bool disableUtilityKey;

  const DynamicPinKeyboard({
    super.key,
    required this.pinInputController,
    required this.onSubmit,
    this.keyboardButtonShape = KeyButtonShape.defaultShape,
    this.inputShape = InputShape.defaultShape,
    this.keyboardMaxWidth = 80,
    this.keyboardVerticalSpacing = 8,
    this.spacing = 12,
    this.keyboardButtonFillColor,
    this.keyboardButtonBorderColor,
    this.keyboardButtonTextColor,
    this.keyboardButtonBorderWidth,
    this.keyboardButtonElevation,
    this.keyboardButtonShadowColor,
    this.inputWidth,
    this.obscureInputs = false,
    this.inputsMaxWidth = 70,
    this.inputFillColor,
    this.inputBorderColor,
    this.inputTextColor,
    this.inputHasBorder = true,
    this.underlineInputs = true,
    this.inputBorderWidth = 1,
    this.inputElevation,
    this.inputShadowColor,
    this.errorColor = Colors.red,
    this.keyboardFontSize,
    this.inputFontSize,
    this.inputBorderRadius = 1,
    this.inputHeight,
    this.keyboardFontFamily = "",
    this.extraInput,
    this.backButton,
    this.doneButton,
    this.keyboardButtonBorderRadius,
    this.inputTextStyle,
    this.keyboardButtonTextStyle,
    this.utilityKeyButton,
    this.keyboardButtonSize,
    this.enableKeyboardButtonBorder = false,
    this.obscuringCharacter = "●",
    this.obscuringModeDefaultColor = Colors.grey,
    this.deleteButton,
    this.defaultUtilityKeyButtonFillColour,
    this.defaultUtilityKeyButtonIcon,
    this.deleteKeyButtonFillColour,
    this.deleteKeyButtonIcon,
    this.inputUnderlineColor = Colors.black,
    this.disableUtilityKey = false,
  });

  @override
  State<DynamicPinKeyboard> createState() => _DynamicPinKeyboardState();
}

class _DynamicPinKeyboardState extends State<DynamicPinKeyboard> {
  List<int> inputNumbers = [];
  String inputText = "";
  String errorText = "";

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.pinInputController.length; i++) {
      inputNumbers.add(i);
    }
    setState(() {});
    widget.pinInputController.addListener(() {
      inputNumbers.clear();
      for (int i = 0; i < widget.pinInputController.length; i++) {
        inputNumbers.add(i);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: size.width * (widget.inputsMaxWidth / 100),
          ),
          child: InputWidget(
            inputText: inputText,
            inputShape: widget.inputShape,
            inputNumbers: inputNumbers,
            inputHeight: widget.inputHeight,
            inputWidth: widget.inputWidth,
            inputFontSize: widget.inputFontSize,
            inputBorderWidth: widget.inputBorderWidth,
            inputBorderRadius: widget.inputBorderRadius,
            inputElevation: widget.inputElevation,
            inputBorderColour: widget.inputBorderColor,
            inputUnderlineColour: widget.inputUnderlineColor,
            inputFillColour: widget.inputFillColor,
            inputShadowColour: widget.inputShadowColor,
            inputHasBorder: widget.inputHasBorder,
            underlineInputs: widget.underlineInputs!,
            obscureInputs: widget.obscureInputs,
            obscuringCharacter: widget.obscuringCharacter,
            obscuringModeDefaultColor: widget.obscuringModeDefaultColor,
            inputTextColor: widget.inputTextColor,
            inputTextStyle: widget.inputTextStyle,
          ),
        ),
        SizedBox(
          height: widget.spacing / 2,
        ),
        errorText.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorText,
                  style: TextStyle(color: widget.errorColor),
                ),
              )
            : const SizedBox(),
        SizedBox(
          height: widget.spacing / 2,
        ),
        Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: size.width * (widget.keyboardMaxWidth / 100),
            ),
            child: DynamicKeyboard(
              size: size,
              extraInput: widget.extraInput,
              fontFamily: widget.keyboardFontFamily,
              maxWidth: widget.keyboardMaxWidth,
              keyboardVerticalSpacing: widget.keyboardVerticalSpacing,
              keyButtonShape: widget.keyboardButtonShape,
              onSubmit: widget.onSubmit,
              currentInputSize: inputText.length,
              inputSize: widget.pinInputController.length,
              keyButtonBorderRadius: widget.keyboardButtonBorderRadius,
              keyboardButtonTextStyle: widget.keyboardButtonTextStyle,
              hasBorder: widget.enableKeyboardButtonBorder,
              utilityKeyButton: widget.utilityKeyButton,
              deleteButton: widget.deleteButton,
              keyButtonSize: widget.keyboardButtonSize,
              keyButtonFontSize: widget.keyboardFontSize,
              keyButtonElevation: widget.keyboardButtonElevation,
              keyButtonFillColour: widget.keyboardButtonFillColor,
              keyButtonBorderColour: widget.keyboardButtonBorderColor,
              keyButtonTextColour: widget.keyboardButtonTextColor,
              keyButtonShadowColour: widget.keyboardButtonShadowColor,
              keyButtonBorderWidth: widget.keyboardButtonBorderWidth,
              defaultUtilityKeyButtonFillColour:
                  widget.deleteKeyButtonFillColour,
              defaultUtilityKeyButtonIcon: widget.defaultUtilityKeyButtonIcon,
              deleteKeyButtonFillColour: widget.deleteKeyButtonFillColour,
              deleteKeyButtonIcon: widget.deleteKeyButtonIcon,
              disableUtilityKey: widget.disableUtilityKey,
              onIncompleteInputError: onIncompleteInputError,
              onKeyTap: onKeyTap,
              deleteAction: deleteAction,
            ),
          ),
        )
      ],
    );
  }

  void onKeyTap(String btnText) {
    if (inputText.length < widget.pinInputController.length) {
      setState(() {
        inputText = inputText + btnText;
        widget.pinInputController.changeText(inputText);
        HapticFeedback.vibrate();

        /// textToDisplay = res;
      });
    }
    if (inputText.length >= widget.pinInputController.length) {
      widget.onSubmit();
      setState(() {
        errorText = '';
      });
    }
  }

  void onIncompleteInputError() {
    setState(() {
      errorText = "Please fill all input fields";
    });
  }

  void deleteAction() {
    if (inputText.isNotEmpty) {
      setState(() {
        inputText = inputText.substring(0, inputText.length - 1);
        widget.pinInputController.changeText(inputText);
      });
    }
  }
}
