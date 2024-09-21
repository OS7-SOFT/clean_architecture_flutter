import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String? label;
  final Icon? icon;
  final bool? isPassword;
  final bool? isBio;
  final String? Function(String?)? validate;
  final Function(String?) onSaved;
  final Function(String?)? onChanged;
  final AutovalidateMode? autovalidate;

  const CustomTextFormField({
    super.key,
    this.label,
    this.icon,
    this.isPassword,
    this.isBio,
    this.validate,
    required this.onSaved,
    this.onChanged,
    this.autovalidate,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  Color labelColor = Colors.grey;
  Color iconColor = Colors.grey;

  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
          keyboardType: widget.isBio == true
              ? TextInputType.multiline
              : TextInputType.text,
          maxLines: widget.isBio == true ? 4 : 1,
          onChanged: widget.onChanged,
          onSaved: widget.onSaved,
          validator: widget.validate,
          autovalidateMode: widget.autovalidate,
          obscureText: widget.isPassword! && isSecure,
          cursorErrorColor: GFColors.DANGER,
          cursorColor: primaryColor,
          decoration: _buildInputDecoration(primaryColor)),
    );
  }

  InputDecoration _buildInputDecoration(Color primaryColor) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        hintText: widget.label!,
        hintStyle: const TextStyle(fontSize: 15),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
        prefixIcon: widget.icon,
        suffixIcon: _buildSuffixIcon());
  }

  IconButton? _buildSuffixIcon() {
    return widget.isPassword!
        ? IconButton(
            icon: const Icon(Icons.remove_red_eye),
            onPressed: () {
              setState(() {
                isSecure = !isSecure;
              });
            },
          )
        : null;
  }
}
