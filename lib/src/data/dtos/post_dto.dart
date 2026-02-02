import 'dart:convert';

PostDto postDtoFromJson(String str) => PostDto.fromJson(json.decode(str));

/*List<dynamic> _jsonList(dynamic str) => jsonDecode(str);

List<PostDto> jsonListPost(dynamic str) => _jsonList(str).map((e) => PostDto.fromJson(e as Map<String, dynamic>)).toList();*/

class PostDto {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostDto({this.userId, this.id, this.title, this.body});

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      PostDto(userId: json["userId"], id: json["id"], title: json["title"], body: json["body"]);
}
