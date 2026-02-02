import 'package:challenge_channels/src/core/failures/failure.dart';
import 'package:challenge_channels/src/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class TogglePostUsecase {
  final PostsRepository repository;

  TogglePostUsecase({required this.repository});

  Future<Either<Failure, Unit>> call({required int postId}) {
    return repository.toggleFavoritePost(postId: postId);
  }
}
