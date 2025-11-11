import 'package:flutter/material.dart';

/// A reusable AppBar widget with title, back button, and optional action icons.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool showBack;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool? automaticallyImplyLeading;
  final Color? textColor;
  final double elevation;

  const CustomAppBar({
    super.key,
    required this.title,
    this.centerTitle = true,
    this.showBack = true,
    this.actions,
    this.backgroundColor,
    this.textColor,
    this.elevation = 0.5, this.automaticallyImplyLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      centerTitle: centerTitle,
      elevation: elevation,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Theme.of(context).textTheme.titleLarge?.color,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
