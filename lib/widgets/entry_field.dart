import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  const EntryField({
    Key? key,
    this.label,
    this.hint,
    this.textController,
    this.hideText = false,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final TextEditingController? textController;
  final bool hideText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label!,
            style: TextStyle(
                color: Theme.of(context).focusColor,
                fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 14,
                    )),
                    obscureText: hideText,
                    controller: textController
          ),
        ],
      ),
    );
  }
}


