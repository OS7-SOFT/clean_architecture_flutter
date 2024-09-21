import 'package:flutter/material.dart';
import 'package:frontend/cores/helpers/show_dialog.dart';
import 'package:frontend/cores/helpers/show_snack_bar.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';
import 'package:frontend/features/Posts/presentation/providers/post_provider.dart';
import 'package:frontend/features/Posts/presentation/screens/post_form_screen.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({
    super.key,
    required this.post,
  });

  void deletePost(BuildContext context, int id) async {
    ShowDialog().showLoadingDialog(context);
    final postProvider = Provider.of<PostProvider>(context, listen: false);

    await postProvider.eitherFailureOrDeletePost(id);
    bool? isSuccessed = postProvider.isSuccessed;
    if (context.mounted) {
      Navigator.pop(context);

      if (isSuccessed!) {
        ShowSnackBar().successedMessage(
            message: "Post deleted successfully!", context: context);
      } else {
        ShowSnackBar().failureMessage(
            message: postProvider.failure!.getMessage, context: context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Card(
        child: Column(
          children: [
            //title
            Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            //Post Content
            Text(
              post.body,
              style: const TextStyle(
                height: 2,
              ),
              textAlign: TextAlign.center,
            ),
            //action
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      ShowDialog().showMessageDialog(
                          context, deletePost(context, post.id!));
                    },
                    icon: const Icon(Icons.delete)),
                IconButton(
                    onPressed: () {
                      context.read<PostProvider>().setPostId(post.id!);
                      pushToPostFormScreen(context);
                    },
                    icon: const Icon(Icons.edit)),
              ],
            )
          ],
        ),
      ),
    );
  }

  void pushToPostFormScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostFormScreen(
                  isEdit: true,
                  post: post,
                )));
  }
}
