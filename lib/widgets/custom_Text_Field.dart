import 'package:flutter/material.dart';
import '../constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.content,
      this.text,
      this.maxLines = 1,
      super.key,
      this.onsaved,
      this.onChanged});
  final void Function(String?)? onsaved;
  final void Function(String?)? onChanged;
  String? content, text;
  int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      decoration: InputDecoration(
          labelText: text,
          hintText: content,
          labelStyle:
              TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'times'),
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
