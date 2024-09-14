import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final double toolbarHeight; // Add toolbarHeight as a parameter

  const ResponsiveAppBar({super.key, required this.title, this.toolbarHeight = 105});

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme; // Access the appBarTheme
    final dividerColor = Theme.of(context).dividerTheme.color; // Access divider color from the theme

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          // Full AppBar for larger screens
          return AppBar(
            backgroundColor: appBarTheme.backgroundColor, // Use background color from the theme
            automaticallyImplyLeading: false,
            toolbarHeight: toolbarHeight, // Use the toolbar height passed in the constructor
            elevation: appBarTheme.elevation,
            shadowColor: dividerColor,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextButton(context, "COMMISSIONS", COMMISSION_PATH),
                const SizedBox(width: AppSpacing.large),
                _buildTextButton(context, "PORTFOLIO", PORTFOLIO_PATH),
                const SizedBox(width: AppSpacing.xxl),
                title, // Use the title widget directly
                const SizedBox(width: AppSpacing.xxl),
                _buildTextButton(context, "ABOUT ME", ABOUT_PATH),
                const SizedBox(width: AppSpacing.large),
                _buildTextButton(context, "CONTACT", CONTACT_PATH),
              ],
            ),
          );
        } else {
          // Simplified AppBar for smaller screens
          return AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu, color: appBarTheme.iconTheme?.color), // Use icon color from the theme
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            backgroundColor: appBarTheme.backgroundColor,
            toolbarHeight: toolbarHeight, // Use the toolbar height passed in the constructor
            title: InkWell(
              onTap: () => context.go(ROOT_PATH),
              child: title,
            ),
          );
        }
      },
    );
  }

  TextButton _buildTextButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () => context.go(route),
      child: Text(text),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight); // Use the toolbarHeight property
}
