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
        width: MediaQuery.of(context).size.width / 1.4,
        padding: EdgeInsets.symmetric(vertical: 10),
        //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: textColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
