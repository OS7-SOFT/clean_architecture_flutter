import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:frontend/cores/errors/failures.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';
import 'package:frontend/features/Posts/domain/repositories/post_repository.dart';
import 'package:frontend/features/Posts/dependency_injection_.dart' as di;
import 'package:frontend/features/Posts/domain/usecases/add_new_post_usecase.dart';
import 'package:frontend/features/Posts/domain/usecases/delete_post_usecase.dart';
import 'package:frontend/features/Posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:frontend/features/Posts/domain/usecases/update_post_usecase.dart';

class PostProvider extends ChangeNotifier {
  List<Post>? posts;
  Failure? failure;
  bool? isSuccessed;

  int? _id;

  void setPostId(int id) {
    _id = id;
  }

  void setIsSuccessedFalse() {
    isSuccessed = false;
  }

  Future<void> eitherFailureOrPosts() async {
    final PostRepository postRepository = di.getIt<PostRepository>();

    final failureOrPosts =
        await GetAllPosts(postRepository: postRepository).call();

    failureOrPosts.fold((Failure newFailure) {
      failure = newFailure;
      posts = null;
    }, (List<Post> newPosts) {
      posts = newPosts;
      failure = null;
    });
    notifyListeners();
  }

  Future<void> eitherFailureOrAddNewPost(Post newPost) async {
    setIsSuccessedFalse();
    final PostRepository postRepository = di.getIt<PostRepository>();

    final failureOrAddNewPost =
        await AddNewPost(postRepository: postRepository).call(newPost);

    eitherFailureOrSuccessed(failureOrAddNewPost);
  }

  Future<void> eitherFailureOrUpdatePost(Post post) async {
    setIsSuccessedFalse();
    final PostRepository postRepository = di.getIt<PostRepository>();

    final failureOrUpdated =
        await UpdatePost(postRepository: postRepository).call(_id!, post);

    eitherFailureOrSuccessed(failureOrUpdated);
  }

  Future<void> eitherFailureOrDeletePost(int id) async {
    setIsSuccessedFalse();
    final PostRepository postRepository = di.getIt<PostRepository>();

    final failureOrDeleted =
        await DeletePost(postRepository: postRepository).call(id);
    eitherFailureOrSuccessed(failureOrDeleted);
  }

  void eitherFailureOrSuccessed(Either<Failure, Unit> failureOrSuccessed) {
    failureOrSuccessed.fold((Failure newFailure) {
      failure = newFailure;
      isSuccessed = false;
    }, (Unit unit) {
      isSuccessed = true;
      failure = null;
    });
    notifyListeners();
  }
}
