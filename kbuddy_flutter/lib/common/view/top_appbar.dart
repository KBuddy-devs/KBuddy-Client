import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('KBuddy'),
      backgroundColor: Colors.purple,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
