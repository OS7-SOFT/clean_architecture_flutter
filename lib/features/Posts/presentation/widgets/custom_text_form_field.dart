import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final bool isContent;
  final String hintText;
  final String? initialValue;
  final String? Function(String?)? validate;
  final Function(String?) onSaved;
  final Function(String?)? onChanged;
  final AutovalidateMode? autovalidate;
  const CustomTextFormField(
      {super.key,
      required this.isContent,
      required this.hintText,
      required this.onSaved,
      required this.onChanged,
      required this.validate,
      required this.autovalidate,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: initialValue,
        keyboardType:
            isContent == true ? TextInputType.multiline : TextInputType.text,
        maxLines: isContent == true ? 6 : 1,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validate,
        autovalidateMode: autovalidate,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 15),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
        ));
  }
}
