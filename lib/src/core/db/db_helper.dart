import 'package:challenge_channels/objectbox.g.dart';
import 'package:challenge_channels/src/data/db_models/comment_db_model.dart';
import 'package:challenge_channels/src/data/db_models/post_db_model.dart';
import 'package:dartz/dartz.dart';

import 'objectbox_app.dart';

class DBHelper {
  static final Box<PostDbModel> boxPosts = ObjectboxApp.boxPosts;

  ///  -----------    POSTs  -------------
  static int getPostsCount() => boxPosts.count();

  static Stream<List<PostDbModel>> watchPosts() {
    final query = boxPosts.query().watch(triggerImmediately: true);
    return query.map((q) => q.find());
  }

  static Stream<PostDbModel?> watchPost({required int postId}) {
    final query = boxPosts.query(PostDbModel_.postId.equals(id(postId)));
    return query.watch(triggerImmediately: true).map((q) => q.findFirst());
  }

  // guarda 1 o un listado de archivos en el box de boxArchives
  static void _savePostS({PostDbModel? post, List<PostDbModel>? posts}) {
    if (post != null) boxPosts.put(post);
    if (posts != null) boxPosts.putMany(posts);
  }

  static PostDbModel? _getPostByIdDB({required int idPostDB}) => boxPosts.get(idPostDB);

  static PostDbModel? getPostByPostId({required int postId}) {
    final query = boxPosts.query(PostDbModel_.postId.equals(id(postId))).build();
    final post = query.findFirst();
    query.close();
    return post;
  }

  static void saveFavoritePost({required int postId, required bool state}) {
    final post = getPostByPostId(postId: postId);
    if (post == null) return;
    _savePostS(post: post.copyWith(isFavorite: state));
  }

  static void _saveUpdatePost({required PostDbModel post}) {
    final postDB = getPostByPostId(postId: post.postId);
    if (postDB == null) {
      _savePostS(post: post);
      return;
    }
    _savePostS(
      post: postDB.copyWith(title: post.title, body: post.body),
    );
  }

  static void saveUpdatePosts({required List<PostDbModel> posts}) {
    for (final item in posts) {
      _saveUpdatePost(post: item);
    }
  }

  // return todas las fincas guardadas
  static List<PostDbModel> getAllPosts() => boxPosts.getAll();

  static bool deletePostById({required int idPost}) => boxPosts.remove(idPost);

  static int deleteAllPosts() => boxPosts.removeAll();

  /// COMMENTS
  static void updateComments({required int idPost, required List<CommentDbModel> comments}) {
    final postDB = getPostByPostId(postId: idPost);
    if (postDB == null) return;
    postDB.comments
      ..clear()
      ..addAll(comments);
    _savePostS(post: postDB);
  }
}
