import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/mixins/MyFooter.dart';
import 'package:justjoew/mixins/responsive_appbar.dart';
import 'package:justjoew/utils/navigator/navigator.dart';

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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Optional padding to ensure content is not flushed to the edges
                child: body(),
              ),
            ),
          ),
          MyFooter(), // Custom footer widget
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      child: ListView(
        children: [
          _buildDrawerItem(context, 'COMMISSIONS', COMMISSIONS_PATH),
          _buildDrawerItem(context, 'PORTFOLIO', PORTFOLIO_PATH),
          _buildDrawerItem(context, 'ABOUT ME', ABOUT_PATH),
          _buildDrawerItem(context, 'CONTACT', CONTACT_PATH),
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
      onTap: () {
        Navigator.of(context).pop(); // Close the drawer
        context.go(route);
      },
    );
  }

  PreferredSizeWidget appBar() {
    return ResponsiveAppBar(
      title: InkWell(
        onTap: () => context.go(ROOT_PATH),
        child: Hero(
          tag: 'logohero',
          child: Image.asset(
            'images/joewlogo.png',
            height: 48,
          ),
        ),
      ),
    );
  }

  Widget body();

  bool extendBody() => false;

  bool extendBehindAppBar() => false;
}
