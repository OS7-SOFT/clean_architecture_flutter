import 'package:frontend/cores/errors/failures.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> addNewPost(Post newPost);
  Future<Either<Failure, Unit>> updatePost(int id, Post post);
  Future<Either<Failure, Unit>> deletePost(int id);
}
