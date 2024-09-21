import 'package:flutter/material.dart';

class BoxContent extends StatelessWidget {
  final String description;
  final EdgeInsets margin;
  const BoxContent({
    required this.description,
    super.key,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: margin,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 1),
                color: Color.fromARGB(255, 75, 237, 221),
                blurRadius: 2)
          ],
          border: Border.all(
              width: 1, color: const Color.fromARGB(255, 75, 237, 221)),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          description,
          style: const TextStyle(height: 2.5, fontSize: 12),
          textAlign: TextAlign.center,
        ));
  }
}
