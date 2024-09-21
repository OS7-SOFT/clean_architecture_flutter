import 'package:dartz/dartz.dart';
import 'package:frontend/cores/errors/failures.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';
import 'package:frontend/features/Posts/domain/repositories/post_repository.dart';

class AddNewPost {
  final PostRepository postRepository;

  AddNewPost({required this.postRepository});

  Future<Either<Failure, Unit>> call(Post newPost) async {
    return await postRepository.addNewPost(newPost);
  }
}
