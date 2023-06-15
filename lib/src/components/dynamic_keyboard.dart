import 'package:dynamic_pin_keyboard/src/components/keys.dart';
import 'package:dynamic_pin_keyboard/src/main.dart';
import 'package:flutter/material.dart';

class DynamicKeyboard extends StatelessWidget {
  final Size size;
  final double maxWidth;
  final int currentInputSize;
  final int inputSize;
  final double keyboardVerticalSpacing;
  final KeyButtonShape keyButtonShape;
  final Widget? utilityKeyButton;
  final Widget? deleteButton;
  final String? extraInput;
  final double? keyButtonSize;
  final Color? keyButtonFillColour;
  final Color? keyButtonBorderColour;
  final Color? keyButtonShadowColour;
  final Color? keyButtonTextColour;
  final Color? defaultUtilityKeyButtonFillColour;
  final Icon? defaultUtilityKeyButtonIcon;
  final Color? deleteKeyButtonFillColour;
  final Icon? deleteKeyButtonIcon;
  final double? keyButtonBorderWidth;
  final double? keyButtonBorderRadius;
  final double? keyButtonElevation;
  final double? keyButtonFontSize;
  final String? fontFamily;
  final bool hasBorder;
  final bool disableUtilityKey;
  final VoidCallback onSubmit;
  final VoidCallback onIncompleteInputError;
  final VoidCallback deleteAction;
  final TextStyle? keyboardButtonTextStyle;
  final UseCase useCase;
  final void Function(String v) onKeyTap;

  const DynamicKeyboard({
    super.key,
    required this.size,
    required this.maxWidth,
    required this.keyboardVerticalSpacing,
    required this.keyButtonShape,
    required this.onSubmit,
    required this.currentInputSize,
    required this.inputSize,
    required this.onIncompleteInputError,
    required this.onKeyTap,
    required this.deleteAction,
    this.utilityKeyButton,
    this.extraInput,
    this.keyButtonSize,
    this.keyButtonFillColour,
    this.keyButtonBorderColour,
    this.keyButtonShadowColour,
    this.keyButtonTextColour,
    this.keyButtonBorderWidth,
    this.keyButtonBorderRadius,
    this.keyButtonElevation,
    this.keyButtonFontSize,
    this.fontFamily,
    this.defaultUtilityKeyButtonFillColour,
    this.defaultUtilityKeyButtonIcon,
    this.deleteButton,
    this.deleteKeyButtonFillColour,
    this.deleteKeyButtonIcon,
    required this.hasBorder,
    this.keyboardButtonTextStyle,
    this.disableUtilityKey = false,
    this.useCase = UseCase.pin,
  });

  VoidCallback get defaultUtilityAction {
    if(useCase == UseCase.pin) {
      if (currentInputSize >= inputSize) {
        return onSubmit;
      } else {
        return onIncompleteInputError;
      }
    } else {
      return onSubmit;
    }
  }

  Widget get utilityKey {
    if (disableUtilityKey) {
      return const Expanded(
        child: SizedBox(),
      );
    }
    if (utilityKeyButton != null) {
      return Expanded(child: utilityKeyButton!);
    }
    return extraInput == null
        ? Expanded(
            child: IconButton(
              onPressed: defaultUtilityAction,
              icon: defaultUtilityKeyButtonIcon ??
                  Icon(
                    Icons.done,
                    color: defaultUtilityKeyButtonFillColour ?? Colors.black,
                  ),
            ),
          )
        : Keys(
            number: extraInput!,
            keyboardVerticalSpacing: keyboardVerticalSpacing,
            keyButtonShape: keyButtonShape,
            keyButtonSize: keyButtonSize,
            keyButtonFillColour: keyButtonFillColour,
            keyButtonBorderColour: keyButtonBorderColour,
            keyButtonShadowColour: keyButtonShadowColour,
            keyButtonTextColour: keyButtonTextColour,
            keyButtonBorderWidth: keyButtonBorderWidth,
            keyButtonBorderRadius: keyButtonBorderRadius,
            keyButtonElevation: keyButtonElevation,
            keyButtonFontSize: keyButtonFontSize,
            keyboardButtonTextStyle: keyboardButtonTextStyle,
            hasBorder: hasBorder,
            fontFamily: fontFamily,
            onTap: onKeyTap,
          );
  }

  Widget get deleteKey {
    if (deleteButton != null) {
      return Expanded(
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: deleteAction,
          child: deleteButton,
        ),
      );
    }
    return Expanded(
      child: IconButton(
        onPressed: deleteAction,
        icon: deleteKeyButtonIcon ??
            Icon(
              Icons.backspace,
              color: deleteKeyButtonFillColour ?? Colors.black,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Keys(
              number: '1',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),
            Keys(
              number: '2',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),
            Keys(
              number: '3',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Keys(
              number: '4',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),
            Keys(
              number: '5',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),
            Keys(
              number: '6',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Keys(
              number: '7',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),
            Keys(
              number: '8',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),
            Keys(
              number: '9',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            utilityKey,
            Keys(
              number: '0',
              keyboardVerticalSpacing: keyboardVerticalSpacing,
              keyButtonShape: keyButtonShape,
              keyButtonSize: keyButtonSize,
              keyButtonFillColour: keyButtonFillColour,
              keyButtonBorderColour: keyButtonBorderColour,
              keyButtonShadowColour: keyButtonShadowColour,
              keyButtonTextColour: keyButtonTextColour,
              keyButtonBorderWidth: keyButtonBorderWidth,
              keyButtonBorderRadius: keyButtonBorderRadius,
              keyButtonElevation: keyButtonElevation,
              keyButtonFontSize: keyButtonFontSize,
              keyboardButtonTextStyle: keyboardButtonTextStyle,
              hasBorder: hasBorder,
              fontFamily: fontFamily,
              onTap: onKeyTap,
            ),

            deleteKey,
          ],
        ),
      ],
    );
  }
}
