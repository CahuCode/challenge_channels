import 'package:challenge_channels/src/core/failures/failure.dart';
import 'package:challenge_channels/src/domain/entities/comment_entity.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Stream<List<PostEntity>> watchPosts();

  Future<Either<Failure, Unit>> syncPosts();

  Future<Either<Failure, Unit>> syncComments({required int postId});

  Future<Either<Failure, Unit>> toggleFavoritePost({required int postId});
}
