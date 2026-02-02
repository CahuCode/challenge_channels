import 'package:challenge_channels/src/aplication/routes/app_routes.dart';
import 'package:challenge_channels/src/presentation/state_manager/posts_notifier.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostsView extends ConsumerWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsStreamProvider);
    return postsAsync.when(
      data: (postsList) {
        return ListView.builder(
          itemCount: postsList.length,
          itemBuilder: (_, index) {
            final post = postsList[index];
            return CustomWidgets.customPost(
              post,
              callback: () async {
                 ref.read(syncCommentsProvider(post.id));
                context.push(routeDetailpost, extra: post);
              },
            );
          },
        );
      },
      error: (error, _) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
