import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final double toolbarHeight;

  const ResponsiveAppBar({
    super.key,
    required this.title,
    this.toolbarHeight = 105,
  });

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    final dividerColor = Theme.of(context).dividerTheme.color;

    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth > 850
            ? _buildFullAppBar(context, appBarTheme, dividerColor)
            : _buildSimplifiedAppBar(context, appBarTheme);
      },
    );
  }

  // Builds the full AppBar for larger screens
  AppBar _buildFullAppBar(BuildContext context, AppBarTheme appBarTheme, Color? dividerColor) {
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
          _buildTextButton(context, "COMMISSIONS", COMMISSIONS_PATH),
          const SizedBox(width: AppSpacing.large),
          _buildTextButton(context, "PORTFOLIO", PORTFOLIO_PATH),
          const SizedBox(width: AppSpacing.xxl),
          title,
          const SizedBox(width: AppSpacing.xxl),
          _buildTextButton(context, "ABOUT ME", ABOUT_PATH),
          const SizedBox(width: AppSpacing.large),
          _buildTextButton(context, "CONTACT", CONTACT_PATH),
        ],
      ),
    );
  }

  // Builds a simplified AppBar for smaller screens
  AppBar _buildSimplifiedAppBar(BuildContext context, AppBarTheme appBarTheme) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.menu, color: appBarTheme.iconTheme?.color),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      backgroundColor: appBarTheme.backgroundColor,
      toolbarHeight: toolbarHeight,
      title: InkWell(
        onTap: () => context.go(ROOT_PATH),
        child: title,
      ),
    );
  }

  // Builds text buttons used in the AppBar
  TextButton _buildTextButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () => context.go(route),
      child: Text(text, style: Theme.of(context).textButtonTheme.style?.textStyle?.resolve({})),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
