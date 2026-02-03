import 'dart:async';
import 'package:challenge_channels/src/core/di/di.dart';
import 'package:challenge_channels/src/domain/entities/post_entity.dart';
import 'package:challenge_channels/src/domain/repositories/posts_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class SearchState {
  final bool isSearching;
  final String query;

  const SearchState({required this.isSearching, required this.query});

  const SearchState.initial() : isSearching = false, query = '';
}

class SearchNotifier extends Notifier<SearchState> {
  Timer? _debounce;

  @override
  SearchState build() {
    ref.onDispose(() {
      _debounce?.cancel();
    });

    return const SearchState.initial();
  }

  void startSearch() {
    state = SearchState(isSearching: true, query: state.query);
  }

  void stopSearch() {
    _debounce?.cancel();
    state = const SearchState.initial();
  }

  void onQueryChanged(String value) {
    _debounce?.cancel();

    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (value.isEmpty) {
        stopSearch();
      } else {
        state = SearchState(isSearching: true, query: value);
      }
    });
  }
}

final searchProvider = NotifierProvider<SearchNotifier, SearchState>(SearchNotifier.new);

final searchPostsProvider = StreamProvider.family<List<PostEntity>, String>((ref, textSearch) {
  ref.watch(refreshPostsProvider);
  return getIt<PostsRepository>().watchSearchPosts(textSearch: textSearch);
});


final refreshPostsProvider = StateProvider<int>((_) => 0);
