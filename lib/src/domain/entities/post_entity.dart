import 'package:challenge_channels/src/domain/entities/comment_entity.dart';

class PostEntity {
  int id;
  int userId;
  String title;
  String body;
  bool isFavorite;
  List<CommentEntity> comments;

  PostEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.isFavorite,
    this.comments = const [],
  });

  PostEntity copyWith({int? id, int? userId, String? title, String? body, bool? isFavorite, List<CommentEntity>? comments}) {
    return PostEntity(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      isFavorite: isFavorite ?? this.isFavorite,
      comments: comments ?? this.comments,
    );
  }

  @override
  String toString() {
    return title;
  }
}
