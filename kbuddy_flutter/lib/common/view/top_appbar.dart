import 'package:flutter/material.dart';
import 'package:kbuddy_flutter/common/const/colors.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('KBuddy'),
      backgroundColor: PRIMARY_COLOR,
      actions: [
        const Center(
          child: SearchBar(
            trailing: [Icon(Icons.search)],
            constraints: BoxConstraints(maxWidth: 250, maxHeight: 100),
          ),
        ),
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
