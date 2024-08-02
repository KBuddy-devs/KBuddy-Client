import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/provider/post_provider.dart';

class PostListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: state.when(
        initial: () => Center(child: Text('Pull to refresh')),
        loading: () => Center(child: CircularProgressIndicator(),),
        data: (items, isEnd) =>
            NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent && isEnd) {
                  ref.read(postProvider.notifier).fetchItems();
                  return true;
                }
                return false;
              },
              child: ListView.builder(
                  itemCount: items.length + (isEnd ? 0 : 1),
                  itemBuilder: (context, index) {
                    if (index < items.length) {
                      return ListTile(title: Text(items[index].title));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
        error: (msg) => Center(child: Text('Error: $msg')),
      ),
    );
  }
}