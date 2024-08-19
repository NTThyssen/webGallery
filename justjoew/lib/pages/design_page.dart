import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:justjoew/widgets/art_image.dart';
import 'package:justjoew/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:justjoew/constants/costum_colors.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> with TickerProviderStateMixin {
  late final GifController controller1, controller2, controller3, controller4, controller5;
  int _fps = 20;

  @override
  void initState() {
    controller1 = GifController(vsync: this);
    controller2 = GifController(vsync: this);
    controller3 = GifController(vsync: this);
    controller4 = GifController(vsync: this);
    controller5 = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomHeaderLarge(text: 'EMOTES'),
        EmoteSection(
          header: "ScatRatt",
          url: 'https://www.twitch.tv/scatratt/about',
          portfolioWidgets: [
            ArtImage(path: 'images/cry15.png'),
            ArtImage(path: 'images/ez8.png'),
            ArtImage(path: 'images/heart2.png'),
            ArtImage(path: 'images/helloRat.png'),
            ArtImage(path: 'images/lulrat.png'),
            ArtImage(path: 'images/pat7.png'),
            ArtImage(path: 'images/lurk14b.png'),
            Gif(
              width: 80,
              height: 80,
              image: const AssetImage("images/RatDanceJam10.gif"),
              controller:
                  controller1, // if duration and fps is null, original gif fps will be used.
              fps: 16,
              //duration: const Duration(seconds: 3),
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller1.reset();
                controller1.forward();
              },
            ),
            Gif(
              width: 80,
              height: 80,
              image: const AssetImage("images/RatShyNotNaked.gif"),
              controller:
                  controller2, // if duration and fps is null, original gif fps will be used.
              fps: 16,
              //duration: const Duration(seconds: 3),
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller2.reset();
                controller2.forward();
              },
            ),
          ],
        ),
        EmoteSection(
          header: "Olmaph",
          url: 'https://www.twitch.tv/olmaph/about',
          portfolioWidgets: [
            ArtImage(path: 'images/WaveBlue.png'),
            ArtImage(path: 'images/snick.png'),
            ArtImage(path: 'images/tonicheers.png'),
            ArtImage(path: 'images/toni400.png'),
            ArtImage(path: 'images/toni300.png'),
            ArtImage(path: 'images/toni200.png'),
            ArtImage(path: 'images/toni150.png'),
            ArtImage(path: 'images/toni128.png'),
            ArtImage(path: 'images/toni112.png'),
            ArtImage(path: 'images/toni100.png'),
            ArtImage(path: 'images/toes300.png'),
            ArtImage(path: 'images/wiggly300.png'),
            Gif(
              width: 80,
              height: 80,
              image: const AssetImage("images/bar.gif"),
              controller:
                  controller3, // if duration and fps is null, original gif fps will be used.  
              fps: 10,
              //duration: const Duration(seconds: 3),
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller3.reset();
                controller3.forward();
              },
            ),
            Gif(
              width: 80,
              height: 80,
              image: const AssetImage("images/OlamphPump.gif"),
              controller:
                  controller4, // if duration and fps is null, original gif fps will be used. 
              fps: 20,
              //duration: const Duration(seconds: 3),
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller4.reset();
                controller4.forward();
              },
            ),
            Gif(
              width: 80,
              height: 80,
              image: const AssetImage("images/wiggly350.gif"),
              controller:
                  controller4, // if duration and fps is null, original gif fps will be used. 
              fps: 20,
              //duration: const Duration(seconds: 3),
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller4.reset();
                controller4.forward();
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }
}

class EmoteSection extends StatelessWidget {
  const EmoteSection({
    super.key,
    required this.portfolioWidgets,
    required this.header,
    required this.url, // Add the URL parameter
  });

  final List<Widget> portfolioWidgets;
  final String header;
  final String url; // Add the URL field

  Future<void> _launchUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString(), forceWebView: true, enableJavaScript: true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _launchUrl(context, url),
            child: Text(
              header,
              style: const TextStyle(
                color: blueThemePrimary,
                fontSize: 36.0,
                fontWeight: FontWeight.w400,
                fontFamily: 'SourceCodePro',
                shadows: [
                  Shadow(
                    color: Colors.black, // Specify shadow color and opacity
                    offset: Offset(2, 2), // Specify shadow offset
                    blurRadius: 4, // Specify shadow blur radius
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          thickness: 0.7,
          color: blueThemePrimary100,
          endIndent: MediaQuery.of(context).size.width * 0.20,
          indent: MediaQuery.of(context).size.width * 0.20,
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment:
                  WrapAlignment.center, // centers the children in the Wrap

              runSpacing: 40,
              spacing: 80,
              children: portfolioWidgets),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
