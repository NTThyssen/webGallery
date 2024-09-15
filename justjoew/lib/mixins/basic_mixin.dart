import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/constants/AppStrings.dart';
import 'package:justjoew/constants/ImageStrings.dart';
import 'package:justjoew/mixins/myFooter.dart';
import 'package:justjoew/mixins/responsive_appbar.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/utils/theme/spacing.dart'; // Use AppSpacing

mixin BasicMixin<Page extends StatefulWidget> on State<Page> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: extendBody(),
      extendBodyBehindAppBar: extendBehindAppBar(),
      appBar: appBar(),
      drawer: _buildDrawer(context),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  body(), // The main content of the page
                  MyFooter(), // The footer, now aligned at the bottom
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      child: ListView(
        children: [
          _buildDrawerItem(context, AppStrings.commissions, AppRoutes.commissions),
          _buildDrawerItem(context, AppStrings.portfolio, AppRoutes.portfolio),
          _buildDrawerItem(context, AppStrings.aboutMe, AppRoutes.about),
          _buildDrawerItem(context, AppStrings.contact, AppRoutes.contact),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onTap: () => context.go(route),
    );
  }

  PreferredSizeWidget appBar() {
    return ResponsiveAppBar(
      title: InkWell(
        onTap: () => context.go(AppRoutes.root),
        child: Hero(
          tag: 'logohero',
          child: Image.asset(
            Imagestrings.logoPath, // Use a constant for the logo path
            height: AppSpacing.xl, // Use AppSpacing for consistent sizing
          ),
        ),
      ),
    );
  }

  Widget body();

  bool extendBody() => false;

  bool extendBehindAppBar() => false;
}
