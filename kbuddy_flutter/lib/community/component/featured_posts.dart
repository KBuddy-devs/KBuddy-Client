// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kbuddy_flutter/auth/view/confirm_screen.dart';
// import 'package:kbuddy_flutter/auth/view/signup_screen.dart';
// import 'package:kbuddy_flutter/common/component/text.dart';
// import 'package:kbuddy_flutter/common/const/typo.dart';
//
// import '../model/post_model.dart';
//
// void main() {
//   runApp(ProviderScope(child: MyApp()));
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TestScreen(),
//     );
//   }
// }
//
// class TestScreen extends ConsumerStatefulWidget {
//   const TestScreen({super.key});
//
//   @override
//   _TestScreenState createState() => _TestScreenState();
// }
//
// class _TestScreenState extends ConsumerState<TestScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final sampleFeaturedPosts = List.generate(3, (index) {
//       return Post(
//         author: 'Author $index',
//         date: 'Date',
//         title: 'Title of the question goes here.',
//         content:
//             'Lorem ipsum dolor sit amet consectetur. Suscipit non est sit a volutpat in. Sapien dictum blandit tellus ornare est purus.',
//         likes: 3,
//         comments: 1,
//         id: '1',
//         imageUrl: '',
//       );
//     });
//     final samplePosts = List.generate(10, (index) {
//       return Post(
//         author: 'Author $index',
//         date: 'Date',
//         title: 'Title of the question goes here.',
//         content:
//             'Lorem ipsum dolor sit amet consectetur. Suscipit non est sit a volutpat in. Sapien dictum blandit tellus ornare est purus.',
//         likes: 3,
//         comments: 1,
//         id: '1',
//         imageUrl: '',
//       );
//     });
//
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     double baseWidth = 360.0;
//     double baseHeight = 640.0;
//
//     double scaleWidth = screenWidth / baseWidth;
//     double scaleHeight = screenHeight / baseHeight;
//
//     double paddingHorizontal = 16.0 * scaleWidth;
//     double paddingVertical = 16.0 * scaleHeight;
//     double spacingBaseUnit10 = 10.0 * scaleHeight;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Implement back button functionality
//           },
//         ),
//         title: Text(
//           'Create account',
//           style: TextStyle(fontSize: 20.0 * scaleHeight),
//         ),
//       ),
//       body: Column(
//         children: [
//           //FeaturedPosts(),//posts: sampleFeaturedPosts
//           Expanded(
//             child: ListView.separated(
//                 itemCount: samplePosts.length,
//                 itemBuilder: (context, index) {
//                   return PostCard(post: samplePosts[index]);
//                 },
//                 separatorBuilder: (context, index) {
//                   return Divider(
//                     color: Colors.grey[300], // 구분선 색상 설정
//                     thickness: 1.0, // 구분선 두께 설정
//                     height: 1.0, // 구분선 높이 설정,
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class FeaturedPosts extends StatelessWidget {
//   final List<Post> posts;
//
//   FeaturedPosts({super.key, required this.posts});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return Container(
//             width: 300,
//             margin: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 1,
//                   blurRadius: 7,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
// //여기서 새로운 component 생성해서 넣어야 할 거 같음.
//                 ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
//
// class PostCard extends StatelessWidget {
//   final Post post;
//
//   const PostCard({super.key, required this.post});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.zero, // 카드 간의 기본 마진을 없앱니다.
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.zero, // 모서리를 둥글게 하지 않습니다.
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ListTile(
//             leading: CircleAvatar(
//               child: Icon(Icons.person, color: Colors.grey),
//             ),
//             title: Text(post.author),
//             subtitle: Text(post.date),
//           ),
//           Padding(
//               padding: const EdgeInsets.only(left: 16.0), // 텍스트에 좌측 마진 추가
//               child: FlexText(
//                 content: post.title,
//                 textStyle: title300Medium,
//               )),
//           Padding(
//               padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
//               // 텍스트에 좌측 마진 추가
//               child: FlexText(
//                 content: post.content,
//                 textStyle: body200Light,
//               )),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
//               Text('${post.likes}'),
//               IconButton(icon: Icon(Icons.comment), onPressed: () {}),
//               Text('${post.comments}'),
//               IconButton(icon: Icon(Icons.bookmark), onPressed: () {}),
//             ],
//           )
//         ],
//       ),
//     );
//     throw UnimplementedError();
//   }
// }
