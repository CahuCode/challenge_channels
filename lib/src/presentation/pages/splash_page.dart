import 'package:challenge_channels/src/aplication/routes/app_routes.dart';
import 'package:challenge_channels/src/presentation/state_manager/posts_notifier.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(syncPostsProvider);
      //ref.read(jobPositionsDB.notifier).refreshJobPositions();
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) context.go(routePosts);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomText customText = CustomText(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: customText.autoSizeText("SPLASH", isBoldText: true, textColor: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
