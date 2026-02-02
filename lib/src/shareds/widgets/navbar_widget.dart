import 'package:challenge_channels/src/aplication/logs/logdev.dart';
import 'package:challenge_channels/src/aplication/routes/app_routes.dart';
import 'package:challenge_channels/src/aplication/theme/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../presentation/state_manager/general_notifier.dart';

class NavbarWidget extends ConsumerWidget {
  //final List<BottomNavigationBarItem> navItems;

  //const NavbarWidget({required this.navItems, super.key});
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<BottomNavigationBarItem> navItems = [
      BottomNavigationBarItem(icon: Icon(Icons.article_sharp), label: 'Artículos'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favoritos'),
    ];

    final navWatch = ref.watch(indexNavProvider);
    //final login = ref.read(loginProvider).login;
    final String location = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    return BottomNavigationBar(
      elevation: 1,
      backgroundColor: ColorsApp.whiteBackground,
      currentIndex: navWatch,
      onTap: (index) {
        logDev.l('INDEX_SELECT  >>   $index  $navWatch');
        if (index == navWatch) return;
        ref.read(indexNavProvider.notifier).state = index;
        final page = (index == 0) ? routePosts : routeFavorits;
        context.go(page);
      },
      items: navItems,
    );
  }
}
