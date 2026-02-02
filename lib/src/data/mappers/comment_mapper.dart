import 'package:challenge_channels/src/data/db_models/comment_db_model.dart';
import 'package:challenge_channels/src/data/dtos/comment_dto.dart';
import 'package:challenge_channels/src/domain/entities/comment_entity.dart';

extension CommentDtoMapper on CommentDto {
  CommentDbModel toCommentDB() =>
      CommentDbModel(postId: postId ?? 0, commentId: id ?? 0, name: name ?? '', email: email ?? '', body: body ?? '');
}

extension CommentDbMapper on CommentDbModel {
  CommentEntity toCommentEntity() => CommentEntity(id: commentId, postId: postId, name: name, email: email, body: body);
}
