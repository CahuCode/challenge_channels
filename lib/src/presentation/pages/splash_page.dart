import 'package:challenge_channels/src/aplication/routes/app_routes.dart';
import 'package:challenge_channels/src/core/utils/global_vars.dart';
import 'package:challenge_channels/src/core/utils/responsive.dart';
import 'package:challenge_channels/src/presentation/state_manager/posts_provider.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_text.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_widgets.dart';
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
      ref.read(syncPostsApiProvider);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) context.go(routePosts);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomWidgets.imageAvatar(size: responsive.dp(12), image: '${Globalvars.pathImages}dash.png'),
        ),
      ),
    );
  }
}
