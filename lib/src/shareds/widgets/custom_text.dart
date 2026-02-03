import 'package:auto_size_text/auto_size_text.dart';
import 'package:challenge_channels/src/aplication/theme/colors_app.dart';
import 'package:challenge_channels/src/core/utils/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomText {
  final BuildContext context;

  CustomText(this.context);

  //texto normal con negrita, sin negrita, color
  Text normalText(
    String text, {
    Color? textColor,
    Color? bColor,
    bool isBoldText = false,
    double textSpacing = 0,
    double porcent = 1.6,
    int lines = 1,
    TextAlign aligText = TextAlign.start,
  }) {
    Responsive responsive = Responsive(context);
    return Text(
      text,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        backgroundColor: bColor,
        fontSize: responsive.dp(porcent),
        fontWeight: isBoldText ? FontWeight.bold : FontWeight.normal,
        color: textColor ?? ColorsApp.textTitle,
        overflow: TextOverflow.ellipsis,
      ),
      textAlign: aligText,
    );
  }

  AutoSizeText autoSizeText(
    String txt, {
    Color? textColor,
    bool isBoldText = false,
    int lines = 1,
    TextAlign textAlign = TextAlign.start,
    double? textSize,
  }) {
    final responsive = Responsive(context);
    return AutoSizeText(
      txt,
      style: TextStyle(
        fontSize: responsive.dp(textSize ?? 1.6),
        fontWeight: isBoldText ? FontWeight.bold : FontWeight.normal,
        color: textColor ?? ColorsApp.textTitle,
      ),
      minFontSize: 10,
      maxFontSize: 40,
      maxLines: lines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }

  //tituloAppBar
  Text appbarTitle(String text, {Color? textColor, bool isBold = true, double textSpacing = 0, double porcent = 1.9}) {
    Responsive responsive = Responsive(context);
    return Text(
      text,
      style: TextStyle(
        fontSize: responsive.dp(porcent),
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: textColor ?? Theme.of(context).colorScheme.secondary,
        overflow: TextOverflow.ellipsis,
      ),
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
    );
  }
}
