import 'package:challenge_channels/src/core/db/db_helper.dart';
import 'package:challenge_channels/src/data/db_models/post_db_model.dart';

abstract class PostsLocalDatasource {
  Stream<List<PostDbModel>> watchPosts();

  Stream<PostDbModel?> watchPost({required int postId});

  Future<void> saveUpdatePosts(List<PostDbModel> posts, {PostDbModel? post});

  Future<PostDbModel?> getPostByPostId({required int postId});
}

class PostsLocalDatasourceImpl extends PostsLocalDatasource {
  @override
  Stream<List<PostDbModel>> watchPosts() {
    return DBHelper.watchPosts();
  }

  @override
  Stream<PostDbModel?> watchPost({required int postId}) {
    return DBHelper.watchPost(postId: postId);
  }

  @override
  Future<void> saveUpdatePosts(List<PostDbModel> posts, {PostDbModel? post}) async {
    if (post != null) {
      DBHelper.savePost(post: post);
      return;
    }
    DBHelper.saveUpdatePosts(posts: posts);
  }

  @override
  Future<PostDbModel?> getPostByPostId({required int postId}) async {
    return DBHelper.getPostByPostId(postId: postId);
  }
}
