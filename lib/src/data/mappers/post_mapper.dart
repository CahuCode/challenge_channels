import 'package:challenge_channels/src/data/db_models/post_db_model.dart';
import 'package:challenge_channels/src/data/dtos/post_dto.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';

extension PostDtoMapper on PostDto {
  PostDbModel toPostDB() => PostDbModel(userId: userId ?? 0, postId: id ?? 0, title: title ?? '', body: body ?? '');
}

extension PostDbModelMapper on PostDbModel {
  PostEntity toPostEntity() => PostEntity(id: postId, userId: userId, title: title, body: body, isFavorite: isFavorite);
}
