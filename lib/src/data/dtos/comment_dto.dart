import 'dart:convert';

CommentDto commentDtoFromJson(String str) => CommentDto.fromJson(json.decode(str));

class CommentDto {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;

  CommentDto({this.postId, this.id, this.name, this.email, this.body});

  factory CommentDto.fromJson(Map<String, dynamic> json) => CommentDto(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

}
