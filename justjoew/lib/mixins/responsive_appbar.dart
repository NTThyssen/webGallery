import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/constants/AppStrings.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
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
    //final dividerColor = Theme.of(context).dividerTheme.color;
    final iconColor = appBarTheme.iconTheme?.color;
    final double toolbarHeight = appBarTheme.toolbarHeight ?? kToolbarHeight;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 950) {
          return AppBar(
            backgroundColor: appBarTheme.backgroundColor,
            automaticallyImplyLeading: false,
            toolbarHeight: toolbarHeight, // Use the height from the theme
            elevation: appBarTheme.elevation,
            //shadowColor: dividerColor,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextButton(context, AppStrings.commissionsHeader, AppRoutes.commissions),
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
          return AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu, color: iconColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            backgroundColor: appBarTheme.backgroundColor,
            toolbarHeight: toolbarHeight, // Use the height from the theme
            title: InkWell(
              onTap: () => _navigateTo(context, AppRoutes.root),
              child: DefaultTextStyle(
                style: appBarTheme.titleTextStyle ?? Theme.of(context).textTheme.headlineSmall!,
                child: title,
              ),
            ),
          );
        }
      },
    );
  }

  TextButton _buildTextButton(BuildContext context, String text, String route) {
  final bool isSelected = GoRouter.of(context).routerDelegate.currentConfiguration.fullPath == route;

  return TextButton(
    onPressed: () => _navigateTo(context, route),
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all(
        isSelected ? AppColors.primary200 : AppColors.primary600,
      ),
      textStyle: MaterialStateProperty.all(
        isSelected
            ? AppTextStyles.menuText
            : AppTextStyles.menuText.copyWith(fontWeight: FontWeight.w400),
      ),
      splashFactory: NoSplash.splashFactory, // Removes splash effect
      animationDuration: Duration.zero, // Removes animation on click
    ),
    child: Text(text),
  );
}


  void _navigateTo(BuildContext context, String route) {
    try {
      context.go(route);
    } catch (e) {
      print('Error navigating to $route: $e');
    }
  }

  @override
  Size get preferredSize {
    // Return a fixed height or the theme-defined height if available
    return Size.fromHeight(AppBar().preferredSize.height);
  }
}
