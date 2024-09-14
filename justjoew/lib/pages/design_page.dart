import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/art_image.dart';
import 'package:justjoew/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> with TickerProviderStateMixin {
  late final GifController controller1, controller2, controller3, controller4, controller5;

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
    final double gifSize = 64.0; // Define a constant for GIF size

    return Column(
      children: [
        const SizedBox(height: AppSpacing.large),
        const Center(
          child: CustomHeaderLarge(text: 'EMOTES'),
        ),
        EmoteSection(
          header: "ScatRatt",
          url: 'https://www.twitch.tv/scatratt/about',
          portfolioWidgets: [
            ArtImage(path: 'images/ratcry.png'),
            ArtImage(path: 'images/ratez.png'),
            ArtImage(path: 'images/ratheart.png'),
            ArtImage(path: 'images/ratwave.png'),
            ArtImage(path: 'images/ratlul.png'),
            ArtImage(path: 'images/ratpat.png'),
            ArtImage(path: 'images/ratlurk.png'),
            ArtImage(path: 'images/rathydrate.png'),
            ArtImage(path: 'images/ratfine.png'),
            Gif(
              width: gifSize,
              height: gifSize,
              image: const AssetImage("images/RatDanceJam10.gif"),
              controller: controller1,
              fps: 16,
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller1.reset();
                controller1.forward();
              },
            ),
            Gif(
              width: gifSize,
              height: gifSize,
              image: const AssetImage("images/RatShyNotNaked.gif"),
              controller: controller2,
              fps: 16,
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
            ArtImage(path: 'images/olliewave.png'),
            ArtImage(path: 'images/ollieSnickers.png'),
            ArtImage(path: 'images/ollietoni.png'),
            ArtImage(path: 'images/olliewiggly.png'),
            Gif(
              width: gifSize,
              height: gifSize,
              image: const AssetImage("images/bar.gif"),
              controller: controller3,
              fps: 10,
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller3.reset();
                controller3.forward();
              },
            ),
            Gif(
              width: gifSize,
              height: gifSize,
              image: const AssetImage("images/olliePump.gif"),
              controller: controller4,
              fps: 20,
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller4.reset();
                controller4.forward();
              },
            ),
            Gif(
              width: gifSize,
              height: gifSize,
              image: const AssetImage("images/wiggly350.gif"),
              controller: controller5,
              fps: 20,
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller5.reset();
                controller5.forward();
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    super.dispose();
  }
}

class EmoteSection extends StatelessWidget {
  const EmoteSection({
    super.key,
    required this.portfolioWidgets,
    required this.header,
    required this.url,
  });

  final List<Widget> portfolioWidgets;
  final String header;
  final String url;

  Future<void> _launchUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString(), forceWebView: true, enableJavaScript: true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url', style: Theme.of(context).textTheme.labelSmall),
        ),
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
              style: Theme.of(context).textTheme.headlineLarge
            ),
          ),
        ),
        Divider(
          thickness: Theme.of(context).dividerTheme.thickness,
          color: Theme.of(context).dividerTheme.color,
          endIndent: MediaQuery.of(context).size.width * 0.20,
          indent: MediaQuery.of(context).size.width * 0.20,
        ),
        const SizedBox(height: AppSpacing.large),
        SizedBox(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: AppSpacing.large,
            spacing: AppSpacing.large*1,
            children: portfolioWidgets,
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}
