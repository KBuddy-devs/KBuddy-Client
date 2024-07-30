import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/component/postbox_list.dart';
import 'package:kbuddy_flutter/community/provider/postbox_provider.dart';

class PostBoxView extends ConsumerWidget {
  const PostBoxView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PostBox'),
        actions: [
          IconButton(
              onPressed: () => ref.read(postBoxProvider.notifier).refresh(),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: const PostBoxList(),
    );
  }
}
