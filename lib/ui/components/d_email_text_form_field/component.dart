import 'package:flutter/material.dart';

class DEmailTextFormField extends StatelessWidget {
  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;

  const DEmailTextFormField(
      {Key? key,
      required this.label,
      required this.textInputType,
      required this.obscureText,
      required this.textEditingController,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: this.obscureText,
        validator: this.validator,
        controller: this.textEditingController,
        decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: label,
            isDense: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 32.0),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor, width: 1.0),
                borderRadius: BorderRadius.circular(5.0))),
        keyboardType: TextInputType.text);
  }
}
