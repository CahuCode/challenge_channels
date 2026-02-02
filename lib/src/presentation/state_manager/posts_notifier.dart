import 'package:challenge_channels/src/core/di/di.dart';
import 'package:challenge_channels/src/data/datasources/posts_local_datasource.dart';
import 'package:challenge_channels/src/data/db_models/post_db_model.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';
import 'package:challenge_channels/src/domain/repositories/posts_repository.dart';
import 'package:challenge_channels/src/domain/use_cases/sync_comments_usecase.dart';
import 'package:challenge_channels/src/domain/use_cases/sync_posts_usecase.dart';
import 'package:challenge_channels/src/domain/use_cases/toggle_post_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final postsStreamProvider = StreamProvider<List<PostEntity>>((ref) {
  return getIt<PostsRepository>().watchPosts();
});

// posts
final syncPostsProvider = FutureProvider((ref) async {
  final result = await getIt<SyncPostsUsecase>()();
  result.fold((failure) => throw failure.msg, (_) => null);
});

// comments
final postCommentsProvider =
StreamProvider.family<PostDbModel?, int>((ref, postId) {
  final local = getIt<PostsLocalDatasource>();
  return local.watchPost(postId: postId);
});

final syncCommentsProvider = FutureProvider.family<void, int>((ref, postId) async {
  final useCase = getIt<SyncCommentsUsecase>();
  final result = await useCase(postId: postId);

  return result.fold((failure) => throw Exception(failure.msg), (_) => null);
});

// favorites
final toggleFavoriteProvider = FutureProvider.family<void, int>((ref, postId) async {
  final result = await getIt<TogglePostUsecase>()(postId: postId);

  result.fold((failure) => throw failure.msg, (_) => null);
});
