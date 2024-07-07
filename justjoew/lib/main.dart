import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/pages/main_page.dart';
import 'package:justjoew/utils/navigator/navigator.dart';

void main() {
  runApp(const MyInitApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[900]!),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Just Joew'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff212121),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "ABOUT ME",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "CONTACTS",
              style: TextStyle(fontSize: 22, color: Colors.white),
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
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                context.go(PORTFOLIO_PATH);
              },
              child: const Text(
                "PORTFOLIO",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ],
        ),
        toolbarHeight: 80,
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: TextButton(
          onPressed: () {},
          child: RichText(
            text: TextSpan(
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
      ),
      body: MainPage(),
    );
  }
}
