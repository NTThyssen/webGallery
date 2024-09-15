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
  late final List<GifController> controllers;

  @override
  void initState() {
    // Initialize all GIF controllers
    controllers = List.generate(5, (index) => GifController(vsync: this));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double gifSize = 64.0; // Define a constant for GIF size

    return SingleChildScrollView(
      child: Column(
        children: [
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
              _buildGif('images/RatDanceJam10.gif', controllers[0], gifSize, 16),
              _buildGif('images/RatShyNotNaked.gif', controllers[1], gifSize, 16),
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
              _buildGif('images/bar.gif', controllers[2], gifSize, 10),
              _buildGif('images/olliePump.gif', controllers[3], gifSize, 20),
              _buildGif('images/wiggly350.gif', controllers[4], gifSize, 20),
            ],
          ),
          const SizedBox(height: AppSpacing.large),
        ],
      ),
    );
  }

  // Helper method to create a GIF widget
  Widget _buildGif(String path, GifController controller, double size, int fps) {
    return Gif(
      width: size,
      height: size,
      image: AssetImage(path),
      controller: controller,
      fps: fps,
      autostart: Autostart.loop,
      placeholder: (context) => const Text('Loading...'),
      onFetchCompleted: () {
        controller.reset();
        controller.forward();
      },
    );
  }

  @override
  void dispose() {
    // Dispose of all GIF controllers
    for (var controller in controllers) {
      controller.dispose();
    }
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
              style: Theme.of(context).textTheme.headlineLarge,
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
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: SingleChildScrollView(
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              runSpacing: AppSpacing.large,
              spacing: AppSpacing.large,
              children: portfolioWidgets,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xxl),
      ],
    );
  }
}
