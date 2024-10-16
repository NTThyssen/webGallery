import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart'; // Updated styles
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/utils/navigator/navigator.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const ResponsiveAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    final iconColor = appBarTheme.iconTheme?.color ?? Colors.white;
    final double toolbarHeight = appBarTheme.toolbarHeight ?? kToolbarHeight;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 950) {
          return _buildDesktopAppBar(context, appBarTheme, toolbarHeight);
        } else {
          return _buildMobileAppBar(context, appBarTheme, toolbarHeight, iconColor);
        }
      },
    );
  }

  // AppBar for larger screens
  AppBar _buildDesktopAppBar(BuildContext context, AppBarTheme appBarTheme, double toolbarHeight) {
    return AppBar(
      backgroundColor: appBarTheme.backgroundColor ?? Colors.transparent,
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight, // Use the height from the theme
      elevation: appBarTheme.elevation ?? 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextButton(context, AppStrings.commissionsHeader, AppRoutes.commissions),
          const SizedBox(width: AppSpacing.large),
          _buildTextButton(context, AppStrings.portfolio, AppRoutes.portfolio),
          const SizedBox(width: AppSpacing.xxl),
          title, // Custom title widget
          const SizedBox(width: AppSpacing.xxl),
          _buildTextButton(context, AppStrings.aboutMeHeader, AppRoutes.about),
          const SizedBox(width: AppSpacing.large),
          _buildTextButton(context, AppStrings.contact, AppRoutes.contact),
        ],
      ),
    );
  }

  // AppBar for smaller screens (mobile)
  AppBar _buildMobileAppBar(BuildContext context, AppBarTheme appBarTheme, double toolbarHeight, Color iconColor) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu, color: iconColor, size: 28), // Slightly larger icon for visibility
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      backgroundColor: appBarTheme.backgroundColor ?? Colors.transparent,
      toolbarHeight: toolbarHeight, // Use the height from the theme
      title: InkWell(
        onTap: () => _navigateTo(context, AppRoutes.root),
        child: DefaultTextStyle(
          style: appBarTheme.titleTextStyle ?? Theme.of(context).textTheme.headlineMedium!,
          child: title,
        ),
      ),
    );
  }

  // Method to build a TextButton for navigation
  TextButton _buildTextButton(BuildContext context, String text, String route) {
    final bool isSelected = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath == route;

    return TextButton(
      onPressed: () => _navigateTo(context, route),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.hovered)) {
            return AppColors.primary400; // Hover color
          }
          return isSelected ? AppColors.primary200 : AppColors.primary600; // Selected or default color
        }),
        textStyle: MaterialStateProperty.all(
          isSelected
              ? AppTextStyles.buttonText.copyWith(color: AppColors.primary200)
              : AppTextStyles.buttonText.copyWith(fontWeight: FontWeight.w400),
        ),
        overlayColor: MaterialStateProperty.all(AppColors.primary50.withOpacity(0.1)), // Subtle hover effect
        splashFactory: NoSplash.splashFactory, // Removes splash effect
      ),
      child: Text(text),
    );
  }

  // Navigation method
  void _navigateTo(BuildContext context, String route) {
    try {
      context.go(route);
    } catch (e) {
      print('Error navigating to $route: $e');
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
