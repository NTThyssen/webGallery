import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/mixins/myFooter.dart';
import 'package:justjoew/mixins/responsive_appbar.dart';
import 'package:justjoew/utils/navigator/navigator.dart';

mixin BasicMixin<Page extends StatefulWidget> on State<Page> {
  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).appBarTheme.backgroundColor ?? const Color(0xff212121);

    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: extendBody(),
      extendBodyBehindAppBar: extendBehindAppBar(),
      appBar: appBar(),
      drawer: _buildDrawer(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [body()],
              ),
            ),
          ),
          myFooter(), // Custom footer widget
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      child: ListView(
        children: [
          _buildDrawerItem(context, 'COMMISSIONS', COMMISSION_PATH),
          _buildDrawerItem(context, 'PORTFOLIO', PORTFOLIO_PATH),
          _buildDrawerItem(context, 'ABOUT ME', ABOUT_PATH),
          _buildDrawerItem(context, 'CONTACTS', CONTACT_PATH),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium, // Use the theme's text style for drawer items
      ),
      onTap: () => context.go(route),
    );
  }

  PreferredSizeWidget appBar() {
    return ResponsiveAppBar(
      title: InkWell(
        onTap: () => context.go(ROOT_PATH),
        child: Hero(
          tag: 'logohero',
          child: Image.asset(
            'images/joewlogo.png', // Update the path to your logo image
            height: 48, // Adjust the height as needed
          ),
        ),
      ),
    );
  }

  Widget body();

  bool extendBody() => false;

  bool extendBehindAppBar() => false;
}
