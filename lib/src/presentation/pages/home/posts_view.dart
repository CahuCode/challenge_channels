import 'package:challenge_channels/src/aplication/logs/logdev.dart';
import 'package:challenge_channels/src/aplication/routes/app_routes.dart';
import 'package:challenge_channels/src/aplication/theme/colors_app.dart';
import 'package:challenge_channels/src/presentation/state_manager/posts_provider.dart';
import 'package:challenge_channels/src/presentation/state_manager/search_provider.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_widgets.dart';
import 'package:challenge_channels/src/shareds/widgets/drawer_app.dart';
import 'package:challenge_channels/src/shareds/widgets/search_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class PostsView extends ConsumerWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: SearchAppBar(title: 'Posts'),
      body: _PostsList(),
    );
  }
}

class _PostsList extends ConsumerWidget {
  const _PostsList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logDev.i("POSTS_DATA   >>>  return posts....");
    //ref.read(refreshPostsProvider.notifier).state++;

    final query = ref.watch(searchProvider).query;
    final postsAsync = ref.watch(searchPostsProvider(query));
    return postsAsync.when(
      data: (posts) {
        if (posts.isEmpty) return const Center(child: Text('No existen resultados'));

        return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, index) {
            final post = posts[index];
            //return ListTile(title: Text(post.title), subtitle: Text(post.body));
            return CustomWidgets.customPost(
              post,
              colorFav: post.isFavorite ? ColorsApp.redBtn : ColorsApp.greyIcon,
              callback: () async {
                ref.read(syncCommentsProvider(post.id));
                context.push(routeDetailpost, extra: post);
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
    );
  }
}
