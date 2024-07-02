import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/view/bottom_navbar.dart';
import '../../common/view/top_appbar.dart';

class CommunityScreen extends ConsumerStatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  _CommunityScreenState createState() => _CommunityScreenState();
}

class _CommunityScreenState extends ConsumerState<CommunityScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const TopAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search KBuddy',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Featured posts',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        FeaturedPostCard(),
                        FeaturedPostCard(),
                        FeaturedPostCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const TabSection(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Blogs',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: [
                      Chip(label: Text('Restaurant')),
                      Chip(label: Text('Cafe/Dessert')),
                      Chip(label: Text('Shopping')),
                      Chip(label: Text('Attraction')),
                    ],
                  ),
                  BlogList(),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class FeaturedPostCard extends StatelessWidget {
  const FeaturedPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(8.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(width: 8.0),
                Text('@jenny12'),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Awe-inspiring visit to Gyeongbokgung Palace',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              '#palace #traditional #heritage',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class TabSection extends StatelessWidget {
  const TabSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Curated blog'),
              Tab(text: 'User blog'),
              Tab(text: 'Q&A'),
            ],
          ),
          Container(
            height: 200,
            child: const TabBarView(
              children: [
                Center(child: Text('Curated blog content')),
                Center(child: Text('User blog content')),
                Center(child: Text('Q&A content')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlogList extends StatelessWidget {
  const BlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BlogListItem(),
        BlogListItem(),
        BlogListItem(),
      ],
    );
  }
}

class BlogListItem extends StatelessWidget {
  const BlogListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://via.placeholder.com/150'),
      ),
      title: Text('@jenny12'),
      subtitle: Text('Awe-inspiring visit to Gyeongbokgung Palace'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.favorite, color: Colors.red),
          SizedBox(width: 4.0),
          Text('23'),
          SizedBox(width: 8.0),
          Icon(Icons.bookmark, color: Colors.blue),
        ],
      ),
    );
  }
}
