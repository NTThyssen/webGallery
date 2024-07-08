import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/utils/navigator/navigator.dart';

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  ResponsiveAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Full AppBar for larger screens
          return AppBar(
            backgroundColor: Color(0xff212121),
            title: TextButton(
              onPressed: () {
                context.go(ROOT_PATH);
              },
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "ABOUT ME",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "CONTACTS",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              const SizedBox(
                width: 50,
              )
            ],
            automaticallyImplyLeading: false,
            leadingWidth: 300,
            leading: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "COMISSIONS",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.go(PORTFOLIO_PATH);
                  },
                  child: const Text(
                    "PORTFOLIO",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ],
            ),
            toolbarHeight: 80,
            centerTitle: true,
            elevation: 1,
            shadowColor: Colors.white,
          );
        } else {
          // Simplified AppBar for smaller screens
          return AppBar(
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.lightBlue),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            backgroundColor: Color(0xff212121),
            title: TextButton(
              onPressed: () {},
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

mixin BasicMixin<Page extends StatefulWidget> on State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      extendBody: extendBody(),
      extendBodyBehindAppBar: extendBehindAppBar(),
      appBar: appBar(),
      drawer: Drawer(
        backgroundColor: Color(0xff212121),
        child: ListView(
          children: [
            ListTile(
                title: Text(
                  'COMMISSIONS',
                  style: TextStyle(color: Colors.lightBlue),
                ),
                onTap: () =>
                    null //Navigator.pushNamed(context, '/commissions'),
                ),
            ListTile(
                title: Text('PORTFOLIO',
                    style: TextStyle(color: Colors.lightBlue)),
                onTap: () => context.go(PORTFOLIO_PATH)),
            ListTile(
                title:
                    Text('ABOUT ME', style: TextStyle(color: Colors.lightBlue)),
                onTap: () => null // Navigator.pushNamed(context, '/about'),
                ),
            ListTile(
                title:
                    Text('CONTACTS', style: TextStyle(color: Colors.lightBlue)),
                onTap: () => null // Navigator.pushNamed(context, '/contact'),
                ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  body(),
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xff212121),
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("images/twitter.png"),
                const SizedBox(
                  width: 12,
                ),
                Image.asset("images/insta.png"),
                const SizedBox(
                  width: 12,
                ),
                Image.asset("images/youtube.png"),
                const SizedBox(
                  width: 12,
                ),
                Image.asset("images/twitch.png")
              ],
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return ResponsiveAppBar(title: "JustJoeW");
  }

  Widget body();

  bool extendBody() => false;

  bool extendBehindAppBar() => false;

  //Widget bottomNavigationBar() => Container();
}
