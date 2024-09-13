import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/mixins/myFooter.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/constants/costum_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:getwidget/getwidget.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const ResponsiveAppBar({super.key, required this.title});

  // Define consistent styles
  static const Color _backgroundColor = Color(0xff212121);
  static const Color _textColor = blueThemePrimary400;
  static const double _titleFontSize =36.0;
  static const double _menuFontSize = 16.0;
  static const double myToolbarheight = 105;
  static const Color dividerColor = blueThemePrimary200;


  TextStyle get _menuTextStyle => const TextStyle(
        fontSize: _menuFontSize,
        fontFamily: 'SourceCodePro',
        fontWeight: FontWeight.w300,
        color: _textColor,
      );

  TextStyle get _titleTextStyle => const TextStyle(
        color: _textColor,
        fontSize: _titleFontSize,
        fontFamily: 'SourceCodePro',
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 850) {
          // Full AppBar for larger screens
          return AppBar(
            backgroundColor: _backgroundColor,
            automaticallyImplyLeading: false,
            toolbarHeight: myToolbarheight,
            elevation: 1,
            shadowColor: dividerColor,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextButton(context, "COMMISSIONS", COMMISSION_PATH),
                const SizedBox(width: 20), // Add some space between buttons
                _buildTextButton(context, "PORTFOLIO", PORTFOLIO_PATH),
                const SizedBox(width: 100), // Add space around the title to keep it centered
                title, // Use the title widget directly
                const SizedBox(width: 100), // Add space around the title to keep it centered
                _buildTextButton(context, "ABOUT ME", ABOUT_PATH),
                const SizedBox(width: 20), // Add some space between buttons
                _buildTextButton(context, "CONTACT", CONTACT_PATH),
              ],
            ),
          );
        } else {
          // Simplified AppBar for smaller screens
          return AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu, color: _textColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            backgroundColor: _backgroundColor,
            toolbarHeight: myToolbarheight, // Set the toolbar height for smaller screens
            title: InkWell(
              onTap: () => context.go(ROOT_PATH),
              child: title, // Use the title widget directly
            ),
          );
        }
      },
    );
  }

  TextButton _buildTextButton(BuildContext context, String text, String route) {
    return TextButton(
      onPressed: () => context.go(route),
      child: Text(text, style: _menuTextStyle),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(myToolbarheight);
}

mixin BasicMixin<Page extends StatefulWidget> on State<Page> {
  static const Color _backgroundColor = Color(0xff212121);
  static const Color _drawerTextColor = blueThemePrimary400;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
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
          myFooter(),
        ],
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: _backgroundColor,
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
        style: const TextStyle(color: _drawerTextColor),
      ),
      onTap: () => context.go(route),
    );
  }

    PreferredSizeWidget appBar() {
    return ResponsiveAppBar(
      title: InkWell(
        onTap: () => context.go(ROOT_PATH),
        child: 
          Hero(
            tag:'logohero',
            child: Image.asset(
              'images/joewlogo.png', // Update the path to your logo image
              height: 80,            // Adjust the height as needed
            ),
          )
      ),
    );
  }

  Widget body();

  bool extendBody() => false;

  bool extendBehindAppBar() => false;
}
