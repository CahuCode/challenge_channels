import 'package:challenge_channels/src/core/network/network_info.dart';
import 'package:challenge_channels/src/data/datasources/posts_local_datasource.dart';
import 'package:challenge_channels/src/data/datasources/posts_remote_datasource.dart';
import 'package:challenge_channels/src/data/repository_impl/posts_repository_impl.dart';
import 'package:challenge_channels/src/domain/repositories/posts_repository.dart';
import 'package:challenge_channels/src/domain/use_cases/sync_comments_usecase.dart';
import 'package:challenge_channels/src/domain/use_cases/sync_posts_usecase.dart';
import 'package:challenge_channels/src/domain/use_cases/toggle_post_usecase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  ///  ----------  POSTS   ---------------
  //EXTERNAL
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  // CORE
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt<Connectivity>()));
  //DATA_SOURCE
  getIt.registerLazySingleton<PostsRemoteDatasource>(() => PostsRemoteDatasourceImpl());
  getIt.registerLazySingleton<PostsLocalDatasource>(() => PostsLocalDatasourceImpl());
  // REPOSITORY
  getIt.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(remoteDs: getIt(), localDs: getIt(), network: getIt()));
  // USE CASES
  getIt.registerLazySingleton<SyncPostsUsecase>(() => SyncPostsUsecase(repository: getIt()));
  getIt.registerLazySingleton<SyncCommentsUsecase>(() => SyncCommentsUsecase(repository: getIt()));
  getIt.registerLazySingleton<TogglePostUsecase>(() => TogglePostUsecase(repository: getIt()));
}
