import 'package:flutter/material.dart';
import 'package:frontend/features/Posts/presentation/screens/post_form_screen.dart';
import 'package:frontend/features/Posts/presentation/widgets/post_list_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarWidget = buildAppBar();
    final floatingButton = buildFloatingButton(context);
    return Scaffold(
      appBar: appBarWidget,
      body: const PostListWidget(),
      floatingActionButton: floatingButton,
    );
  }

  ElevatedButton buildFloatingButton(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
          fixedSize: MaterialStatePropertyAll<Size>(Size(70, 70)),
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue)),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      onPressed: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostFormScreen(
                      isEdit: false,
                    )))
      },
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Text(
        "Clean Architecture",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
