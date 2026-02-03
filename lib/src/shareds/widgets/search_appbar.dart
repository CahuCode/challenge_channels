import 'package:challenge_channels/src/presentation/state_manager/search_provider.dart';
import 'package:challenge_channels/src/shareds/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;

  const SearchAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchProvider);
    final notifier = ref.read(searchProvider.notifier);
    final customText = CustomText(context);
    return AppBar(
      //leading: const SizedBox.shrink(),
      centerTitle: true,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: state.isSearching
            ? TextField(
                key: const ValueKey('searchField'),
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Buscar...', border: InputBorder.none),
                onChanged: (value) {
                  notifier.onQueryChanged(value);
                },
              )
            :  Text(title, key: const ValueKey('title'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
      ),
      actions: [
        IconButton(
          icon: Icon(state.isSearching ? Icons.close : Icons.search),
          onPressed: () {
            state.isSearching ? notifier.stopSearch() : notifier.startSearch();
          },
        ),
      ],
    );
  }
}
