import 'package:dartz/dartz.dart';
import 'package:frontend/cores/errors/failures.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';
import 'package:frontend/features/Posts/domain/repositories/post_repository.dart';

class UpdatePost {
  final PostRepository postRepository;

  UpdatePost({required this.postRepository});

  Future<Either<Failure, Unit>> call(int id, Post post) async {
    return await postRepository.updatePost(id, post);
  }
}
