import 'package:challenge_channels/src/aplication/logs/logdev.dart';
import 'package:challenge_channels/src/aplication/theme/colors_app.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';
import 'package:challenge_channels/src/presentation/state_manager/posts_notifier.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_text.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailsPostPage extends ConsumerWidget {
  const DetailsPostPage({super.key, required this.post});

  final PostEntity post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customText = CustomText(context);
    final postAsync = ref.watch(postStreamProvider(post.id));
    return Scaffold(
      appBar: CustomWidgets.appBarGeneral(context: context),
      body: SafeArea(
        child: Column(
          children: [
            CustomWidgets.customPost(
              post,
              colorFav: post.isFavorite ? ColorsApp.redBtn : ColorsApp.greyIcon,
              callbackFavorite: () {
                logDev.i("FAVORITE  onClick  >>>> ${post.id}");
                ref.read(toggleFavoriteProvider.notifier).toggelPostToken(post.id);
              },
            ),
            Expanded(
              child: postAsync.when(
                data: (post) {
                  return ListView.builder(
                    itemCount: post!.comments.length,
                    itemBuilder: (_, index) {
                      final comment = post.comments[index];
                      return ListTile(
                        title: customText.autoSizeText("${comment.name}"),
                        subtitle: customText.autoSizeText("${comment.email}\n${comment.body}"),
                      );
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
