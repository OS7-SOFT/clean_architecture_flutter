import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  const CustomErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            size: 80,
            color: Colors.red,
          ),
          const Text(
            "Opps",
            style: TextStyle(
                color: GFColors.DANGER,
                fontWeight: FontWeight.w800,
                fontSize: 22),
          ),
          Text(
            message,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            maxLines: 3,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
