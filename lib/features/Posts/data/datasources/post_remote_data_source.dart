import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:frontend/cores/constants/constants.dart';
import 'package:frontend/cores/errors/exceptions.dart';
import 'package:frontend/features/Posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> addnewPost(PostModel newPost);
  Future<Unit> updatePost(int id, PostModel post);
  Future<Unit> deletePost(int id);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;
  final String url = "$baseUrl/posts";

  PostRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await dio.get(url, options: options);

    if (response.statusCode == 200) {
      final List data = response.data as List;

      return data
          .map<PostModel>((jsonData) => PostModel.fromJson(jsonData))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addnewPost(PostModel newPost) async {
    final body = {kTitle: newPost.title, kBody: newPost.body};
    final response = await dio.post(url, data: body);

    return getResponse(response.statusCode);
  }

  @override
  Future<Unit> updatePost(int id, PostModel post) async {
    final body = {kTitle: post.title, kBody: post.body};
    final response = await dio.put("$url/$id", data: body);

    return getResponse(response.statusCode);
  }

  @override
  Future<Unit> deletePost(int id) async {
    final response = await dio.delete("$url/$id");

    return getResponse(response.statusCode);
  }

  Future<Unit> getResponse(dynamic statusCode) {
    if (statusCode == 200 || statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
