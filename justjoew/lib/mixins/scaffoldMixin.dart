import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/utils/navigator/navigator.dart';

mixin BasicMixin<Page extends StatefulWidget> on State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      extendBody: extendBody(),
      extendBodyBehindAppBar: extendBehindAppBar(),
      appBar: appBar(),
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
    return AppBar(
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
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
      backgroundColor: Color(0xff212121), // Colors.blue[900],
      title: TextButton(
        onPressed: () {},
        child: RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'JustJoe',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'w',
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cursive', // Use a cursive font
                ),
              ),
            ],
          ),
        ), //Text(widget.title,
        //style: const TextStyle(color: Colors.white, fontSize: 40)),
      ),
    );
  }

  Widget body();

  bool extendBody() => false;

  bool extendBehindAppBar() => false;

  //Widget bottomNavigationBar() => Container();
}
