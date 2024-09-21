import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:frontend/cores/constants/constants.dart';
import 'package:frontend/cores/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:frontend/features/Posts/data/models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachedPosts(List<PostModel> posts);
}

class PostLocalDataSourceImpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachedPosts(List<PostModel> posts) {
    final jsonData =
        posts.map<Map<String, dynamic>>((post) => post.toJson()).toList();
    sharedPreferences.setString(kCachedPostData, json.encode(jsonData));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonData = sharedPreferences.getString(kCachedPostData);
    if (jsonData != null) {
      List decodeJson = json.decode(jsonData);
      List<PostModel> posts = decodeJson
          .map<PostModel>((jsonData) => PostModel.fromJson(jsonData))
          .toList();
      return Future.value(posts);
    } else {
      throw EmptyCachedException();
    }
  }
}
