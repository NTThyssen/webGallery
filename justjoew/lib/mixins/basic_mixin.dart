import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/constants/AppStrings.dart';
import 'package:justjoew/constants/ImageStrings.dart';
import 'package:justjoew/mixins/myFooter.dart';
import 'package:justjoew/mixins/responsive_appbar.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
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
          return Column(
            children: [
              // Main body wrapped in Expanded to fill the available space
              Expanded(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight( // Adjust to avoid infinite size error
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          body(), // The main content of the page
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              MyFooter(), // Place footer outside of Expanded to stick it at the bottom
            ],
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
          _buildDrawerItem(context, AppStrings.commissionsHeader, AppRoutes.commissions),
          _buildDrawerItem(context, AppStrings.portfolio, AppRoutes.portfolio),
          _buildDrawerItem(context, AppStrings.aboutMeHeader, AppRoutes.about),
          _buildDrawerItem(context, AppStrings.contact, AppRoutes.contact),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: AppTextStyles.menuText,
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
            ImageStrings.logoPath,
            height: AppSpacing.large,
          ),
        ),
      ),
    );
  }

  Widget body();

  bool extendBody() => false;

  bool extendBehindAppBar() => false;
}

