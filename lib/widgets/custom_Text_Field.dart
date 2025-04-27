import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.content,
      this.maxLines = 1,
      super.key,
      this.onsaved,
      this.onChanged});
  final void Function(String?)? onsaved;
  final void Function(String?)? onChanged;
  String content;
  int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onsaved,
      maxLines: maxLines,
      decoration: InputDecoration(
          hintText: content,
          border: buildBorder(Colors.white),
          enabledBorder: buildBorder(Colors.white),
          focusedBorder: buildBorder(kPrimaryColor)),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color),
    );
  }
}
