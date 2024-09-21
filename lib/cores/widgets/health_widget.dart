import 'package:flutter/material.dart';

class HealthWidget extends StatelessWidget {
  const HealthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [],
      ),
    );
  }

  Icon _buildIcon(Color color) {
    return Icon(
      color == Colors.red ? Icons.favorite : Icons.heart_broken,
      color: color,
      size: 30,
      fill: 1,
    );
  }

  Text _buildText(String count) {
    return Text(
      count,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w700, color: Colors.white),
    );
  }
}
