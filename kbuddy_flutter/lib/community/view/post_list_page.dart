import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/model/post_model.dart';
import 'package:kbuddy_flutter/community/provider/post_provider.dart';

import '../../common/component/text.dart';
import '../../common/const/typo.dart';
import '../../common/utils/logger.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(postProvider);
    logger.i('PostListPage: $state');
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: state.when(
        initial: () => Center(child: Text('Pull to refresh')),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        data: (items, isEnd) => NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent &&
                !isEnd) {
              logger.i('PostListPage: fetchItems called');
              ref.read(postProvider.notifier).fetchItems();
              return true;
            }
            return false;
          },
          child: ListView.separated(
            itemCount: items.length + (isEnd ? 0 : 1),
            itemBuilder: (context, index) {
              if (index < items.length) {
                return PostCard(post: items[index]);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey[300],
                thickness: 1.0,
                height: 1.0,
              );
            },
          ),
        ),
        error: (msg) => Center(child: Text('Error: $msg')),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Card(
        margin: EdgeInsets.zero, // 카드 간의 기본 마진을 없앱니다.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // 모서리를 둥글게 하지 않습니다.
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person, color: Colors.grey),
              ),
              title: Text('NO Author'),
              subtitle: Text('No Description'), //DateTime 형태를 변환해야 한다.
            ),
            Padding(
                padding: const EdgeInsets.only(left: 16.0), // 텍스트에 좌측 마진 추가
                child: FlexText(
                  content: post.title ?? 'NO Title',
                  textStyle: title300Medium,
                )),
            Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                // 텍스트에 좌측 마진 추가
                child: FlexText(
                  content: post.description ?? 'NO SubTitle',
                  textStyle: body200Light,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
                Text('${post.likeCount}'),
                IconButton(icon: Icon(Icons.comment), onPressed: () {}),
                Text('${post.comments.length}'),
                IconButton(icon: Icon(Icons.bookmark), onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
