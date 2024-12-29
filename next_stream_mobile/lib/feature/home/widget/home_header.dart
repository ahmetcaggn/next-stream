import 'package:flutter/material.dart';

/// the header section of the home screen
class HomeHeader extends StatelessWidget implements PreferredSizeWidget {
  /// Creates the home header
  const HomeHeader({
    required this.onUploadPressed,
    required this.onRefreshPressed,
    super.key,
  });

  /// The callback when the upload button is pressed
  final VoidCallback onUploadPressed;

  /// The callback when the refresh button is pressed
  final VoidCallback onRefreshPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Next Stream'),
      leading: IconButton(
        onPressed: onRefreshPressed,
        icon: const Icon(Icons.refresh),
      ),
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
