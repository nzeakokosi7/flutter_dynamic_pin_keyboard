import 'package:dynamic_pin_keyboard/src/main.dart';
import 'package:flutter/material.dart';

class Keys extends StatelessWidget {
  final String number;
  final double keyboardVerticalSpacing;
  final KeyButtonShape keyButtonShape;
  final double? keyButtonSize;
  final Color? keyButtonFillColour;
  final Color? keyButtonBorderColour;
  final Color? keyButtonShadowColour;
  final Color? keyButtonTextColour;
  final double? keyButtonBorderWidth;
  final double? keyButtonBorderRadius;
  final double? keyButtonElevation;
  final double? keyButtonFontSize;
  final String? fontFamily;
  final void Function(String v) onTap;
  final bool? hasBorder;
  final TextStyle? keyboardButtonTextStyle;

  const Keys({
    super.key,
    required this.number,
    required this.keyboardVerticalSpacing,
    required this.keyButtonShape,
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
    required this.onTap,
    this.hasBorder,
    this.keyboardButtonTextStyle,
  });

  BorderRadius? borderRadius(double def) {
    if (keyButtonShape == KeyButtonShape.circular) return null;
    if (keyButtonShape == KeyButtonShape.rounded) {
      return BorderRadius.circular(def);
    }
    if (keyButtonBorderRadius != null) {
      return BorderRadius.circular(keyButtonBorderRadius!);
    }
    return null;
  }

  BorderRadius? splashRadius(double def) {
    if (keyButtonShape == KeyButtonShape.circular) {
      return const BorderRadius.all(Radius.circular(100));
    }
    if (keyButtonShape == KeyButtonShape.rounded) {
      return BorderRadius.circular(def);
    }
    if (keyButtonBorderRadius != null) {
      return BorderRadius.circular(keyButtonBorderRadius!);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: keyboardVerticalSpacing, horizontal: width * 0.01),
        child: InkWell(
          onTap: () {
            onTap.call(number);
          },
          borderRadius: splashRadius(width),
          // highlightColor: keyButtonFillColour?.withOpacity(0.4),
          splashColor: keyButtonFillColour?.withOpacity(0.5),
          child: Ink(
            width: keyButtonSize ??
                (keyButtonShape == KeyButtonShape.circular
                    ? width * 0.13
                    : width * 0.1),
            height: keyButtonSize ??
                (keyButtonShape == KeyButtonShape.circular
                    ? width * 0.13
                    : width * 0.1),
            decoration: BoxDecoration(
                color: keyButtonFillColour ?? Colors.transparent,
                border: hasBorder == true
                    ? Border.all(
                        color: keyButtonBorderColour ?? Colors.black,
                        width: keyButtonBorderWidth ?? 1,
                      )
                    : null,
                borderRadius: borderRadius(width),
                boxShadow: [
                  BoxShadow(
                    color: keyButtonElevation == null
                        ? Colors.transparent
                        : keyButtonShadowColour?.withOpacity(0.6) ??
                            keyButtonFillColour?.withOpacity(0.6) ??
                            Colors.black.withOpacity(0.6),
                    spreadRadius: 3,
                    blurRadius: 9,
                    offset: Offset(0,
                        keyButtonElevation ?? 0), // changes position of shadow
                  ),
                ],
                shape: keyButtonShape == KeyButtonShape.circular
                    ? BoxShape.circle
                    : BoxShape.rectangle),
            child: Center(
              child: Text(
                number,
                textAlign: TextAlign.center,
                style: keyboardButtonTextStyle ?? TextStyle(
                  fontFamily: fontFamily ??
                      Theme.of(context).textTheme.titleMedium?.fontFamily,
                  color: keyButtonTextColour ?? Colors.black,
                  fontSize: keyButtonFontSize ?? width * 0.05,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
