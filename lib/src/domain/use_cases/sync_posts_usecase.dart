import 'package:challenge_channels/src/core/failures/failure.dart';
import 'package:challenge_channels/src/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class SyncPostsUsecase{
  final PostsRepository repository;

  SyncPostsUsecase({required this.repository});

  Future<Either<Failure, Unit>> call(){
    return repository.syncPosts();
  }
}