import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/constants/AppStrings.dart';
import 'package:justjoew/utils/theme/spacing.dart'; // Use AppSpacing for spacing
import 'package:justjoew/utils/navigator/navigator.dart'; // Import the navigator for AppRoutes

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final double toolbarHeight;

  const ResponsiveAppBar({super.key, required this.title, this.toolbarHeight = 105});

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    final dividerColor = Theme.of(context).dividerTheme.color;
    final iconColor = appBarTheme.iconTheme?.color; // Store icon color

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 950) {
          // Full AppBar for larger screens
          return AppBar(
            backgroundColor: appBarTheme.backgroundColor,
            automaticallyImplyLeading: false,
            toolbarHeight: toolbarHeight,
            elevation: appBarTheme.elevation,
            shadowColor: dividerColor,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextButton(context, AppStrings.commissionsHeader, AppRoutes.commissions), // Use AppRoutes
                const SizedBox(width: AppSpacing.large),
                _buildTextButton(context, AppStrings.portfolio, AppRoutes.portfolio),
                const SizedBox(width: AppSpacing.xxl),
                title,
                const SizedBox(width: AppSpacing.xxl),
                _buildTextButton(context, AppStrings.aboutMeHeader, AppRoutes.about),
                const SizedBox(width: AppSpacing.large),
                _buildTextButton(context, AppStrings.contact, AppRoutes.contact),
                const SizedBox(width: AppSpacing.large * 1.25),
              ],
            ),
          );
        } else {
          // Simplified AppBar for smaller screens
          return AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu, color: iconColor), // Use stored icon color
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            backgroundColor: appBarTheme.backgroundColor,
            toolbarHeight: toolbarHeight,
            title: InkWell(
              onTap: () => _navigateTo(context, AppRoutes.root), // Use AppRoutes for root navigation
              child: title,
            ),
          );
        }
      },
    );
  }

  // Method to build text buttons for the app bar
  TextButton _buildTextButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () => _navigateTo(context, route),
      child: Text(text),
    );
  }

  // Method to handle navigation with error checking
  void _navigateTo(BuildContext context, String route) {
    try {
      context.go(route);
    } catch (e) {
      print('Error navigating to $route: $e');
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
