import 'package:challenge_channels/src/aplication/theme/colors_app.dart';
import 'package:challenge_channels/src/presentation/state_manager/posts_notifier.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView  extends ConsumerWidget {
  const FavoritesView ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsStreamProvider);
    return postsAsync.when(
      data: (postsList) {
        return ListView.builder(
          itemCount: postsList.length,
          itemBuilder: (_, index) {
            final post = postsList[index];
            return Visibility(
              visible: post.isFavorite,
              child: CustomWidgets.customPost(
                post,
                colorFav: post.isFavorite ? ColorsApp.redBtn : ColorsApp.greyIcon,
                callback: () async {
                  ref.read(syncCommentsProvider(post.id));
                },
              ),
            );
          },
        );
      },
      error: (error, _) => Center(child: Text('Error: $error')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
