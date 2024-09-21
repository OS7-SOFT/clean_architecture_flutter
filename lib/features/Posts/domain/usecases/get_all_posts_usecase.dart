import 'package:dartz/dartz.dart';
import 'package:frontend/cores/errors/failures.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';
import 'package:frontend/features/Posts/domain/repositories/post_repository.dart';

class GetAllPosts {
  final PostRepository postRepository;

  GetAllPosts({required this.postRepository});

  Future<Either<Failure, List<Post>>> call() async {
    return await postRepository.getAllPosts();
  }
}
