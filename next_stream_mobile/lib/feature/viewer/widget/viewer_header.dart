import 'package:flutter/material.dart';

/// the header section of the home screen
class ViewerHeader extends StatelessWidget implements PreferredSizeWidget {
  /// Creates the home header
  const ViewerHeader({
    required this.title,
    super.key,
  });

  /// The title of the header
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
