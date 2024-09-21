import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IndicatorLoading extends StatelessWidget {
  final Color shapeColor;
  final Color textColor;
  const IndicatorLoading(
      {super.key, required this.shapeColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitCircle(
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: shapeColor,
              ),
            );
          },
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Please wait",
          style: TextStyle(fontSize: 17, color: textColor),
        )
      ],
    );
  }
}
