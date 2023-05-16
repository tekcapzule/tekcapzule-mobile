import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tek_capsule/core/locale/locales.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.onTap,
    this.hasBorder=false,
    this.textColor
  }) : super(key: key);
  final String? text;
  final Function? onTap;
  final bool hasBorder;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: hasBorder? 
        BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(30)):
            BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30)),
        child: Text(
          text == null
              ? context.getTranslationOf('continue_text')!.toUpperCase()
              : text!.toUpperCase(),
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: textColor,
                fontSize: 16,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
