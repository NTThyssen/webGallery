import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/constants/ImageStrings.dart';
import 'package:justjoew/mixins/myFooter.dart';
import 'package:justjoew/mixins/responsive_appbar.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart'; // Updated text styles
import 'package:justjoew/utils/theme/spacing.dart'; // Use AppSpacing
import 'package:sticky_footer_scrollview/sticky_footer_scrollview.dart';

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
      body: Column(
        children: [
          Expanded(
            child: StickyFooterScrollView(
              itemCount: 1,
              itemBuilder: (context, index) {
                return body();
              },
              footer: MyFooter(),
            ),
          ),
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      child: ListView(
        physics: const BouncingScrollPhysics(), // Smooth scrolling for better performance
        children: [
          const SizedBox(height: AppSpacing.large), // Add spacing for aesthetics
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
        style: AppTextStyles.buttonText.copyWith(color: AppColors.primary600), // Updated to match button styles
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
          child: Text(
            "JustJoew",
            style: AppTextStyles.pagetitle
          )
        ),
      ),
    );
  }

  Widget body();

  bool extendBody() => false;

  bool extendBehindAppBar() => false;
}
