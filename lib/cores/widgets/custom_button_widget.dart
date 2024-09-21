import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final double fontSize;
  final EdgeInsets padding;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.name,
    required this.fontSize,
    required this.padding,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 280,
          height: 55,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 0, 176, 144),
                Color.fromARGB(255, 17, 255, 211),
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 1), blurRadius: 2, color: Colors.grey)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700),
              ),
              const Icon(
                Icons.arrow_circle_right,
                color: Colors.white,
                size: 33,
              )
            ],
          ),
        ),
      ),
    );
  }
}
