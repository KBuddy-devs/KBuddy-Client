import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kbuddy_flutter/community/model/post_model.dart';
import 'package:kbuddy_flutter/community/provider/post_provider.dart';

import '../../common/component/text.dart';
import '../../common/const/typo.dart';
import '../../common/utils/logger.dart';

class PostListPage extends ConsumerStatefulWidget {
  const PostListPage({super.key});

  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends ConsumerState<PostListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      ref.read(postProvider.notifier).fetchItems();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(postProvider);
    logger.i('PostListPage: $state');
    return Scaffold(
      appBar: AppBar(title: Text('Items')),
      body: RefreshIndicator(
        onRefresh: () async => ref.read(postProvider.notifier).refreshItems(),
        child: state.when(
          initial: () => Center(child: Text('Pull to refresh')),
          loading: () {
            final currentItems = ref.read(postProvider.notifier).cachedItems;
            return _buildListView(currentItems, true);
          },
          data: (items, isEnd) => _buildListView(items, isEnd),
          error: (msg) => Center(child: Text('Error: $msg')),
        ),
      ),

    );
  }

  Widget _buildListView(List<PostModel> items, bool isEnd) {
    return ListView.separated(
      controller: _scrollController,
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
    );
  }
}

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                padding:
                    const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
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
// body: state.when(
//   initial: () => Center(child: Text('Pull to refresh')),
//   loading: () => Center(
//     child: CircularProgressIndicator(),
//   ),
//   data: (items, isEnd) => RefreshIndicator(
//     onRefresh: () async => ref.read(postProvider.notifier).refreshItems(),
//     child: NotificationListener<ScrollNotification>(
//       onNotification: (ScrollNotification scrollInfo) {
//         if (scrollInfo.metrics.pixels ==
//                 scrollInfo.metrics.maxScrollExtent &&
//             !isEnd) {
//           logger.i('PostListPage: fetchItems called');
//           ref.read(postProvider.notifier).fetchItems();
//           return true;
//         }
//         return false;
//       },
//       child: _buildListView(items, isEnd),
//     ),
//   ),
//   error: (msg) => Center(child: Text('Error: $msg')),
// ),