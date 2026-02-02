import 'package:challenge_channels/src/data/db_models/comment_db_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class PostDbModel {
  @Id()
  int id;
  int userId;
  int postId;
  String title;
  String body;
  bool isFavorite;

  final ToMany<CommentDbModel> comments;

  PostDbModel({
    this.id = 0,
    required this.userId,
    required this.postId,
    required this.title,
    required this.body,
    this.isFavorite = false,
  }) : comments = ToMany<CommentDbModel>();

  PostDbModel copyWith({
    int? id,
    int? userId,
    int? postId,
    String? title,
    String? body,
    bool? isFavorite,
    List<CommentDbModel>? comments,
  }) {
    final post = PostDbModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
      title: title ?? this.title,
      body: body ?? this.body,
      isFavorite: isFavorite ?? this.isFavorite,
    );
    post.comments.addAll(comments ?? this.comments);
    return post;
  }
}
