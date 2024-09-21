import 'package:dartz/dartz.dart';
import 'package:frontend/cores/errors/failures.dart';
import 'package:frontend/features/Posts/domain/repositories/post_repository.dart';

class DeletePost {
  final PostRepository postRepository;

  DeletePost({required this.postRepository});

  Future<Either<Failure, Unit>> call(int id) async {
    return await postRepository.deletePost(id);
  }
}
