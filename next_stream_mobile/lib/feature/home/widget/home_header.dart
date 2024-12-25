import 'package:flutter/material.dart';

/// the header section of the home screen
class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  /// Creates the home header
  const HomeHeader({
    required this.onUploadPressed,
    super.key,
  });

  /// The callback when the upload button is pressed
  final VoidCallback onUploadPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Next Stream'),
      actions: [
        IconButton(
          icon: const Icon(Icons.upload),
          onPressed: onUploadPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
