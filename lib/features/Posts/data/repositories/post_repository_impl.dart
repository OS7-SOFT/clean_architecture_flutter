import 'package:dartz/dartz.dart';
import 'package:frontend/cores/errors/exceptions.dart';
import 'package:frontend/cores/errors/failures.dart';
import 'package:frontend/cores/network/network_info.dart';
import 'package:frontend/features/Posts/data/datasources/post_local_data_source.dart';
import 'package:frontend/features/Posts/data/datasources/post_remote_data_source.dart';
import 'package:frontend/features/Posts/data/models/post_model.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';
import 'package:frontend/features/Posts/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnection) {
      try {
        final remoteData = await remoteDataSource.getAllPosts();
        localDataSource.cachedPosts(remoteData);
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure(message: "Opps there are some error"));
      }
    } else {
      try {
        final localData = await localDataSource.getCachedPosts();
        return Right(localData);
      } on EmptyCachedException {
        return Left(EmptyCacheFailure(
            message: "Opps No there any Data in local try to get from server"));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addNewPost(Post newPost) async {
    final postModel =
        PostModel(id: newPost.id, title: newPost.title, body: newPost.body);

    return await getResponce(() => remoteDataSource.addnewPost(postModel));
  }

  @override
  Future<Either<Failure, Unit>> updatePost(int id, Post post) async {
    final postModel =
        PostModel(id: post.id, title: post.title, body: post.body);

    return await getResponce(() => remoteDataSource.updatePost(id, postModel));
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    return await getResponce(() => remoteDataSource.deletePost(id));
  }

  Future<Either<Failure, Unit>> getResponce(
      Future<Unit> Function() handlePost) async {
    if (await networkInfo.isConnection) {
      try {
        await handlePost();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure(message: "Opps there are some error"));
      }
    } else {
      return Left(OfflineFailure(message: "Opps No there any internet"));
    }
  }
}
