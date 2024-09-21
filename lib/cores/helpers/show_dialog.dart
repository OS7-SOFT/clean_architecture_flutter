import 'package:flutter/material.dart';
import 'package:frontend/features/Posts/presentation/widgets/Indicator_loading_widget.dart';

class ShowDialog {
  Future<dynamic> showLoadingDialog(BuildContext context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
                width: 150,
                color: Colors.white10,
                height: 140,
                child: const IndicatorLoading(
                  shapeColor: Colors.blue,
                  textColor: Colors.blue,
                )),
          );
        });
  }

  Future<dynamic> showMessageDialog(BuildContext context, void deletePost) {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Delete Post",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: const SizedBox(
                width: 200,
                height: 50,
                child: Text(
                  "Are you sure to delete this post ?",
                  style: TextStyle(fontSize: 16),
                )),
            actions: [
              buildTextButton("Yes", () => deletePost),
              buildTextButton("No", () {
                Navigator.pop(context);
              })
            ],
          );
        });
  }

  TextButton buildTextButton(String name, VoidCallback onPressed) {
    return TextButton(
        onPressed: () => onPressed,
        child: Text(
          name,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blue),
        ));
  }
}
