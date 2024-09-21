import 'package:frontend/cores/constants/constants.dart';
import 'package:frontend/features/Posts/domain/entities/post_entity.dart';

class PostModel extends Post {
  const PostModel(
      {required super.id, required super.title, required super.body});

  factory PostModel.fromJson(Map<String, dynamic> jsonData) {
    return PostModel(
        id: jsonData[kId], title: jsonData[kTitle], body: jsonData[kBody]);
  }

  Map<String, dynamic> toJson() {
    return {kId: id, kTitle: title, kBody: body};
  }
}
