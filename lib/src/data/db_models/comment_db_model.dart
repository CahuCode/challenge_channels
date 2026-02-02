import 'package:objectbox/objectbox.dart';

@Entity()
class CommentDbModel {
  @Id()
  int id;
  int postId;
  int commentId;
  String name;
  String email;
  String body;

  CommentDbModel({
    this.id = 0,
    required this.postId,
    required this.commentId,
    required this.name,
    required this.email,
    required this.body,
  });
}
