import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/constants/ImageStrings.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
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
    controllers = List.generate(7, (index) => GifController(vsync: this));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double gifSize = 60.0; // Define a constant for GIF size
    final screenWidth = MediaQuery.of(context).size.width;

    // Define padding values for different screen sizes
    final horizontalPadding = screenWidth < AppSpacing.smallscreen
        ? screenWidth * 0.08
        : screenWidth * 0.20;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding), // Use calculated padding
        child: Column(
          children: [
            const Center(
              child: CustomHeaderLarge(text: AppStrings.emotesHeader),
            ),
            
            EmoteSection(
              header: AppStrings.scatrattHeader,
              url: AppStrings.scatrattUrl,
              portfolioWidgets: [
                const ArtImage(path: ImageStrings.ratCry),
                const ArtImage(path: ImageStrings.ratEz),
                const ArtImage(path: ImageStrings.ratHeart),
                const ArtImage(path: ImageStrings.ratWave),
                const ArtImage(path: ImageStrings.ratLul),
                const ArtImage(path: ImageStrings.ratPat),
                const ArtImage(path: ImageStrings.ratLurk),
                const ArtImage(path: ImageStrings.ratHydrate),
                const ArtImage(path: ImageStrings.ratFine),
                const ArtImage(path: ImageStrings.ratPopcorn),
                const ArtImage(path: ImageStrings.ratDead),
                const ArtImage(path: ImageStrings.ratSalute),
                _buildGif(ImageStrings.ratDanceJam, controllers[0], gifSize, 16),
                _buildGif(ImageStrings.ratShyNotNaked, controllers[1], gifSize, 16),
                _buildGif(ImageStrings.ratFight, controllers[5], gifSize, 16),
                _buildGif(ImageStrings.ratSus, controllers[6], gifSize, 16),
              ],
            ),
            const EmoteSection(
              header: AppStrings.joeHeader,
              url: AppStrings.joeUrl,
              portfolioWidgets: [
                ArtImage(path: ImageStrings.joePeace),
              ],
            ),
            EmoteSection(
              header: AppStrings.olmaphHeader,
              url: AppStrings.olmaphUrl,
              portfolioWidgets: [
                const ArtImage(path: ImageStrings.ollieWave),
                const ArtImage(path: ImageStrings.ollieSnickers),
                const ArtImage(path: ImageStrings.ollieToni),
                const ArtImage(path: ImageStrings.ollieWiggly),
                const ArtImage(path: ImageStrings.toes),
                _buildGif(ImageStrings.barGif, controllers[2], gifSize, 10),
                _buildGif(ImageStrings.olliePump, controllers[3], gifSize, 20),
                _buildGif(ImageStrings.wiggly350, controllers[4], gifSize, 20),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
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
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SelectableText('Could not launch $url', style: Theme.of(context).textTheme.labelSmall),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double dividerIndent = screenWidth * 0.20; // 20% of the screen width

    return Column(
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _launchUrl(context, url),
            child: Text(
              header,
              style: AppTextStyles.headingMedium.copyWith(
                fontWeight: FontWeight.w500, // Montserrat for section headers
              ),
            ),
          ),
        ),
        Divider(
          thickness: Theme.of(context).dividerTheme.thickness,
          color: AppColors.divider,
          indent: dividerIndent,
          endIndent: dividerIndent,
        ),
        const SizedBox(height: AppSpacing.xl),
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
        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }
}
