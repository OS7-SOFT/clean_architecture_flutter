import 'package:flutter/material.dart';

class ButtonField extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final EdgeInsets padding;
  final double fontSize;
  const ButtonField({
    required this.padding,
    required this.name,
    required this.onTap,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 280,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    offset: Offset(0, 2), blurRadius: 1, color: Colors.grey)
              ],
              color: const Color.fromARGB(255, 4, 202, 175),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600),
              ),
              const Icon(
                Icons.arrow_circle_right_sharp,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
