import 'package:challenge_channels/services/notification_service.dart';
import 'package:challenge_channels/src/aplication/logs/logdev.dart';
import 'package:challenge_channels/src/core/failures/exceptions.dart';
import 'package:challenge_channels/src/core/failures/failure.dart';
import 'package:challenge_channels/src/core/network/network_info.dart';
import 'package:challenge_channels/src/data/datasources/posts_local_datasource.dart';
import 'package:challenge_channels/src/data/datasources/posts_remote_datasource.dart';
import 'package:challenge_channels/src/data/mappers/comment_mapper.dart';
import 'package:challenge_channels/src/data/mappers/post_mapper.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';
import 'package:challenge_channels/src/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class PostsRepositoryImpl extends PostsRepository {
  final PostsRemoteDatasource remoteDs;
  final PostsLocalDatasource localDs;
  final NetworkInfo network;

  PostsRepositoryImpl({required this.remoteDs, required this.localDs, required this.network});

  @override
  Stream<List<PostEntity>> watchPosts() =>
      localDs.watchAllPosts().map((db) => db.map((e) => e.toPostEntity()).toList());

  @override
  Stream<PostEntity?> watchPost({required int postId}) =>
      localDs.watchPost(postId: postId).map((e) => e?.toPostEntity());

  @override
  Stream<List<PostEntity>> watchSearchPosts({required String textSearch}) =>
      localDs.watchPostsSearch(txtSearch: textSearch).map((db) => db.map((e) => e.toPostEntity()).toList());

  @override
  Future<Either<Failure, Unit>> syncPosts() async {
    final connect = await network.isConnected;
    if (!connect) return Left(mapExceptionToFailure(NetworkException()));
    try {
      final listPostsDtos = await remoteDs.getPosts();
      if (listPostsDtos.isEmpty) return Right(unit);
      final listPostDB = listPostsDtos.map((e) => e.toPostDB()).toList();
      logDev.i("POSTS DB SYNC  >>> ${listPostDB.length}");
      await localDs.saveUpdatePosts(listPostDB);
      return Right(unit);
    } on TimeoutException {
      logDev.s("Tiempo de espera agotado.");
      return Left(mapExceptionToFailure(TimeoutException()));
    } on NetworkException {
      logDev.s("Error de conexión.");
      return Left(mapExceptionToFailure(NetworkException()));
    } on BadRequestException {
      logDev.s("Solicitud incorrecta.");
      return Left(mapExceptionToFailure(BadRequestException()));
    } on UnauthorizedException {
      logDev.s("No autorizado.");
      return Left(mapExceptionToFailure(UnauthorizedException()));
    } on NotFoundException {
      logDev.s("Recurso no encontrado.");
      return Left(mapExceptionToFailure(NotFoundException()));
    } on ServerException {
      logDev.s("Error del servidor.");
      return Left(mapExceptionToFailure(ServerException()));
    }
  }

  @override
  Future<Either<Failure, Unit>> syncComments({required int postId}) async {
    final connect = await network.isConnected;
    if (!connect) return Left(mapExceptionToFailure(NetworkException()));
    try {
      final post = await localDs.getPostByPostId(postId: postId);
      if (post == null) return Left(LocalFailure(msg: 'Post no encontrado'));
      logDev.i("COMMENTSSSS  DB_INIT  >>>> ${post.comments.length}");

      final listCommentDtos = await remoteDs.getComments(idPost: postId);
      logDev.i("COMMENTSSSS  server  >>>> ${listCommentDtos.length}");
      if (listCommentDtos.isEmpty) return Right(unit);
      final listCommentDB = listCommentDtos.map((e) => e.toCommentDB()).toList();
      logDev.i("COMMENTSSSS  DB  >>>> ${listCommentDtos.length}");
      post.comments
        ..clear()
        ..addAll(listCommentDB)
        ..applyToDb();
      localDs.saveUpdatePosts([post]);

      ///
      final postreme = await localDs.getPostByPostId(postId: postId);

      logDev.i("COMMENTSSSS  DB_remenber  >>>> ${postreme?.comments.length}");

      return Right(unit);
    } on TimeoutException {
      logDev.s("Tiempo de espera agotado.");
      return Left(mapExceptionToFailure(TimeoutException()));
    } on NetworkException {
      logDev.s("Error de conexión.");
      return Left(mapExceptionToFailure(NetworkException()));
    } on BadRequestException {
      logDev.s("Solicitud incorrecta.");
      return Left(mapExceptionToFailure(BadRequestException()));
    } on UnauthorizedException {
      logDev.s("No autorizado.");
      return Left(mapExceptionToFailure(UnauthorizedException()));
    } on NotFoundException {
      logDev.s("Recurso no encontrado.");
      return Left(mapExceptionToFailure(NotFoundException()));
    } on ServerException {
      logDev.s("Error del servidor.");
      return Left(mapExceptionToFailure(ServerException()));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleFavoritePost({required int postId}) async {
    try {
      final post = await localDs.getPostByPostId(postId: postId);
      if (post == null) return Left(LocalFailure(msg: 'Post no encontrado'));
      final notificationService = NotificationService();
      if (!post.isFavorite) {
        notificationService.show(title: 'Te ha gustado >> ${post.title}', body: '${post.body}', payload: 'postId=12');
      }

      //post.isFavorite = !post.isFavorite;
      logDev.i("FAVORITE  DB_Old  >>>> ${post.isFavorite}");
      post.isFavorite = !post.isFavorite;
      localDs.saveUpdatePosts([], post: post);
      final postNew = await localDs.getPostByPostId(postId: postId);

      logDev.i("FAVORITE  DB_NEW  >>>> ${postNew?.isFavorite}");

      return Right(unit);
    } on LocalFailure {
      logDev.s("Error de consulta local");
      return Left(LocalFailure(msg: 'Error de consulta local, post'));
    }
  }
}
