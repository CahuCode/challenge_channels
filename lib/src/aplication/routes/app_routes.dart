import 'package:challenge_channels/src/presentation/pages/splash_page.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';
import 'package:challenge_channels/src/presentation/pages/home/details_post_page.dart';
import 'package:challenge_channels/src/presentation/pages/home/favorites_view.dart';
import 'package:challenge_channels/src/presentation/pages/home/home_page.dart';
import 'package:challenge_channels/src/presentation/pages/home/posts_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'my_navigator_observer.dart';

final routeInit = '/';
final routePosts = '/postsView';
final routeFavorits= '/favoritsView';
final routeDetailpost = '/detailPostPage';
// drawer
final routeConfig= '/configPage';
final routeAboutUs = '/aboutUsPage';
final routeDefault = '/defaultpage';

final appRouter = GoRouter(
  initialLocation: routeInit,
  observers: [MyNavigatorObserver()],
  routes: [
    GoRoute(path: routeInit, builder: (context, state) => SplashPage()),
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: [
        GoRoute(path: routePosts, builder: (context, state) => PostsView()),
        GoRoute(path: routeFavorits, builder: (context, state) => FavoritesView()),
      ],
    ),
    GoRoute(
      path: routeDetailpost,
      pageBuilder: (context, state) {
        final post = state.extra as PostEntity;
        return transitionPage(DetailsPostPage(post: post));
      },
    ),
  ],
);

CustomTransitionPage transitionPage(Widget page) {
  return CustomTransitionPage(
    child: page,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic);

      final fade = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);
      final slide = Tween<Offset>(
        begin: const Offset(0.1, 0.05), // leve desplazamiento diagonal
        end: Offset.zero,
      ).animate(curvedAnimation);

      return FadeTransition(
        opacity: fade,
        child: SlideTransition(position: slide, child: child),
      );
    },
  );
}
