import 'package:flutter/material.dart';
import 'package:frontend/cores/helpers/show_dialog.dart';
import 'package:frontend/cores/helpers/show_snack_bar.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';
import 'package:frontend/features/Posts/presentation/providers/post_provider.dart';
import 'package:frontend/features/Posts/presentation/widgets/custom_text_form_field.dart';
import 'package:provider/provider.dart';

class PostFormScreen extends StatelessWidget {
  final Post? post;
  final bool isEdit;
  PostFormScreen({super.key, required this.isEdit, this.post});

  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  final Map<String, dynamic> data = {
    "title": "",
    "content": "",
  };

  void addOrEditPost(BuildContext context) async {
    var formData = _formState.currentState;

    if (formData!.validate()) {
      formData.save();

      final post = Post(title: data["title"], body: data["content"]);

      ShowDialog().showLoadingDialog(context);

      final postProvider = Provider.of<PostProvider>(context, listen: false);
      if (isEdit) {
        await postProvider.eitherFailureOrUpdatePost(post);
      } else {
        await postProvider.eitherFailureOrAddNewPost(post);
      }
      if (context.mounted) {
        bool? isSuccessed = postProvider.isSuccessed;
        if (isSuccessed!) {
          ShowSnackBar().successedMessage(
              message: isEdit
                  ? "Post updated successfully!"
                  : "Post added successfully!",
              context: context);
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          ShowSnackBar().failureMessage(
              message: postProvider.failure!.getMessage, context: context);
          Navigator.pop(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = buildAppBar();
    return Scaffold(
      appBar: appBar,
      body: Form(
        key: _formState,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "Title",
                initialValue: isEdit ? post?.title : null,
                isContent: false,
                onSaved: (val) {},
                onChanged: (val) {},
                autovalidate: AutovalidateMode.onUserInteraction,
                validate: (val) {
                  return val!.trim() == "" ? "This field is required" : null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: "Content",
                initialValue: isEdit ? post?.body : null,
                isContent: true,
                onSaved: (val) {},
                onChanged: (val) {},
                autovalidate: AutovalidateMode.onUserInteraction,
                validate: (val) {
                  return val!.trim() == "" ? "This field is required" : null;
                },
              ),
              //Buttons
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton(Colors.blue, isEdit ? "Edit" : "Add", () {
                    addOrEditPost(context);
                  }),
                  const SizedBox(
                    width: 10,
                  ),
                  buildButton(Colors.red, "Cancel", () {
                    Navigator.pop(context);
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton buildButton(
      Color color, String title, void Function() onPressed) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(color)),
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        isEdit ? "Edit Post" : "Add New Post",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
