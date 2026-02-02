class CommentEntity {
  int id;
  int postId;
  String name;
  String email;
  String body;

  CommentEntity({required this.id, required this.postId, required this.name, required this.email, required this.body});
}
