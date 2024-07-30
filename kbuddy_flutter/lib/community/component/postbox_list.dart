import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/model/postbox_model.dart';
import 'package:kbuddy_flutter/community/provider/postbox_provider.dart';

class PostBoxList extends ConsumerWidget {
  const PostBoxList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postBoxes = ref.watch(postBoxProvider);

    return postBoxes.when(
      data: (data) => ListView.builder(
        itemCount: data.length + 1,
        itemBuilder: (context, index) {
          if (index == data.length) {
            return _buildLoader(ref);
          }
          return _buildPostBoxItem(data[index]);
        },
      ),
      error: (e, stack) => Center(
        child: Text('Error: $e'),
      ),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildLoader(WidgetRef ref){
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () => ref.read(postBoxProvider.notifier).loadMore(),
        child: const Text('Load More'),
      ),
    );
  }

  Widget _buildPostBoxItem(PostBox postBox){
    return ListTile(
      title: Text(postBox.title),
      subtitle: Text(postBox.content),
    );
  }
}

