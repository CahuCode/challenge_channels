import 'package:challenge_channels/src/core/db/db_helper.dart';
import 'package:challenge_channels/src/data/db_models/post_db_model.dart';

abstract class PostsLocalDatasource {
  Stream<List<PostDbModel>> watchPosts();
  Stream<PostDbModel?> watchPost({required int postId});
  Future<void> saveUpdatePosts(List<PostDbModel> posts);
  Future<PostDbModel?> getPostByPostId({required int postId});
  //Future<PostDbModel?> togglePostFavorite(int postId);
  //Future<void> saveFavorite({required int idPost, required bool status});
  //Future<void> saveUpdateComments({required int idPost, required List<CommentDbModel> comments});
}

class PostsLocalDatasourceImpl extends PostsLocalDatasource {
  @override
  Stream<List<PostDbModel>> watchPosts() {
    //try {
      return DBHelper.watchPosts();
    /*} catch (error) {
      logDev.e(error.toString());
      throw LocalFailure(msg: error.toString());
    }*/
  }

  @override
  Stream<PostDbModel?> watchPost({required int postId}) {
    return DBHelper.watchPost(postId: postId);
  }

  @override
  Future<void> saveUpdatePosts(List<PostDbModel> posts) async {
    //try {
      DBHelper.saveUpdatePosts(posts: posts);
    /*} catch (error) {
      logDev.e(error.toString());
      throw LocalFailure(msg: error.toString());
    }*/
  }

  @override
  Future<PostDbModel?> getPostByPostId({required int postId}) async {
    return DBHelper.getPostByPostId(postId: postId);
  }



/*  @override
  Future<void> saveFavorite({required int idPost, required bool status}) async {
    try {
      DBHelper.saveFavoritePost(idPost: idPost, state: status);
    } catch (error) {
      logDev.e(error.toString());
      throw LocalFailure(msg: error.toString());
    }
  }*/

/*  @override
  Future<PostDbModel?> getPostByPostId(int postId) async {
    //try {
      return DBHelper.getPostByPostId(postId: postId);
    *//*} catch (error) {
      logDev.e(error.toString());
      throw LocalFailure(msg: error.toString());
    }*//*
  }*/


/*  @override
  Future<void> saveUpdateComments({required int idPost, required List<CommentDbModel> comments}) async {
    try {
      DBHelper.updateComments(idPost: idPost, comments: comments);
    } catch (error) {
      logDev.e(error.toString());
      throw LocalFailure(msg: error.toString());
    }
  }

  @override
  Future<PostDbModel?> togglePostFavorite(int postId) async {
    try {
      DBHelper.updateComments(idPost: idPost, comments: comments);
    } catch (error) {
      logDev.e(error.toString());
      throw LocalFailure(msg: error.toString());
    }
  }*/
}
