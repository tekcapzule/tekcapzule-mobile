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
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20),
      child: Column(
        children: [
          // Text(
          //   label!,
          //   style: TextStyle(
          //       color: Colors.black,),
          //   textAlign: TextAlign.left,
          // ),
          TextField(
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
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


