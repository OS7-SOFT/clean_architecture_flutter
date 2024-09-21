import 'package:flutter/material.dart';
import 'package:frontend/cores/errors/failures.dart';
import 'package:frontend/cores/widgets/error_widget.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';
import 'package:frontend/features/Posts/presentation/providers/post_provider.dart';
import 'package:frontend/cores/widgets/Indicator_loading_widget.dart';
import 'package:frontend/features/Posts/presentation/widgets/post_widget.dart';
import 'package:provider/provider.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<PostProvider>(context, listen: false).eitherFailureOrPosts();

    List<Post>? posts = Provider.of<PostProvider>(context, listen: true).posts;
    Failure? failure = Provider.of<PostProvider>(context, listen: true).failure;
    if (posts != null) {
      return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostWidget(post: posts[index]);
          });
    } else if (failure != null) {
      return CustomErrorWidget(
        message: failure.getMessage,
      );
    } else {
      return const IndicatorLoading(
          shapeColor: Colors.blue, textColor: Colors.blue);
    }
  }
}
