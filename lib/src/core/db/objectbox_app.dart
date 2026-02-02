import 'package:challenge_channels/objectbox.g.dart';
import 'package:challenge_channels/src/data/db_models/comment_db_model.dart';
import 'package:challenge_channels/src/data/db_models/post_db_model.dart';
import 'package:objectbox/objectbox.dart';

class ObjectboxApp {
  late final Store store;
  late final Admin admin;
  static late Store store_;
  static bool init = false;

  /// creacion de boxs
  static late Box<PostDbModel> boxPosts;

  ObjectboxApp._create(this.store) {
    store_ = store;
    boxPosts = Box<PostDbModel>(store);

    if (Admin.isAvailable()) {
      admin = Admin(store_);
    }
    init = true;
  }

  static Future<ObjectboxApp> create() async {
    if (await isStoreOpen()) {
      store_.close();
    }
    final store = await openStore();
    return ObjectboxApp._create(store);
  }

  static Future<bool> isStoreOpen() async {
    if (init) {
      return true;
    }
    return false;
  }
}
