import 'package:challenge_channels/src/aplication/logs/logdev.dart';
import 'package:challenge_channels/src/core/di/di.dart';
import 'package:challenge_channels/src/data/datasources/posts_local_datasource.dart';
import 'package:challenge_channels/src/data/db_models/post_db_model.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';
import 'package:challenge_channels/src/domain/repositories/posts_repository.dart';
import 'package:challenge_channels/src/domain/use_cases/sync_comments_usecase.dart';
import 'package:challenge_channels/src/domain/use_cases/sync_posts_usecase.dart';
import 'package:challenge_channels/src/domain/use_cases/toggle_post_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateNotifierProvider, StateNotifier;

final postsStreamProvider = StreamProvider<List<PostEntity>>((ref) {
  return getIt<PostsRepository>().watchPosts();
});

// posts
final syncPostsProvider = FutureProvider((ref) async {
  final result = await getIt<SyncPostsUsecase>()();
  result.fold((failure) => throw failure.msg, (_) => null);
});

// comments
final postStreamProvider = StreamProvider.family<PostEntity?, int>((ref, postId) {
  return getIt<PostsRepository>().watchPost(postId: postId);
});

final syncCommentsProvider = FutureProvider.family<void, int>((ref, postId) async {
  final useCase = getIt<SyncCommentsUsecase>();
  final result = await useCase(postId: postId);
  return result.fold((failure) => throw Exception(failure.msg), (_) => null);
});

// favorites
final _favoriteUsecase = Provider<TogglePostUsecase>((ref) => getIt<TogglePostUsecase>());

/*final toggleFavoriteProvider = FutureProvider.family<void, int>((ref, postId) async {
  final result = await ref.read(_favoriteUsecase).toggleFavorite(postId: postId);
  result.fold((failure) => throw failure.msg, (_) => null);
});*/

final toggleFavoriteProvider = StateNotifierProvider<_ToggelOperations, String>(
  (ref) => _ToggelOperations(useCase: ref.read(_favoriteUsecase)),
);

class _ToggelOperations extends StateNotifier<String> {
  final TogglePostUsecase useCase;

  _ToggelOperations({required this.useCase}) : super('');

  Future<void> toggelPostToken(int postId) async {
    final result = await useCase.toggleFavorite(postId: postId);
    result.fold((failure) => throw failure.msg, (_) => null);
  }
}
