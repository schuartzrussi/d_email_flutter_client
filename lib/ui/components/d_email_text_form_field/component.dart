import 'package:flutter/material.dart';

class DEmailTextFormField extends StatelessWidget {
  final String label;
  final int? maxLines;
  final TextInputType? textInputType;
  final bool obscureText;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final TextEditingController textEditingController;
  final FormFieldValidator<String>? validator;

  const DEmailTextFormField(
      {Key? key,
      required this.label,
      this.textInputType,
      required this.obscureText,
      required this.textEditingController,
      this.validator,
      this.enabled,
      this.maxLines = 1,
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: this.obscureText,
        validator: this.validator,
        enabled: this.enabled,
        maxLines: this.maxLines,
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
        keyboardType: textInputType);
  }
}
