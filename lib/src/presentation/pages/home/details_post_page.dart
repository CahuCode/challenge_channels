import 'package:challenge_channels/src/data/mappers/post_mapper.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';
import 'package:challenge_channels/src/presentation/state_manager/posts_notifier.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPostPage extends ConsumerWidget {
  const DetailsPostPage({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postCommentsProvider(post.id));

    return Scaffold(
      appBar: CustomWidgets.appBarGeneral(
        context: context,
        actions: [
          InkWell(
            onTap: () {
              //logDev.i("POSTS DB  >>> ${DBHelper.getPostsCount()}");
            },
            child: Icon(Icons.eighteen_mp),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomWidgets.customPost(
              post,
              callbackFavorite: () {
                ref.read(toggleFavoriteProvider(post.id));
              },
            ),
            Expanded(
              child: postAsync.when(
                data: (post) {
                  final postEnt = post!.toPostEntity();
                  return ListView.builder(
                    itemCount: postEnt.comments.length,
                    itemBuilder: (_, index) {
                      final comment = postEnt.comments[index];
                      return Text("${comment.name}");
                    },
                  );
                },
                error: (error, _) => Center(child: Text('Error: $error')),
                loading: () => const Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
