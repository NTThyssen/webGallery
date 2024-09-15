import 'package:flutter/material.dart';
import 'package:justjoew/constants/costum_colors.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';

class CommissionPage extends StatefulWidget {
  const CommissionPage({super.key});

  @override
  State<CommissionPage> createState() => _CommissionPageState();
}

class _CommissionPageState extends State<CommissionPage> with BasicMixin {
  @override
  Widget body() {
    double screenWidth = MediaQuery.of(context).size.width;

    // Define padding values for text and boxes
    final EdgeInsetsGeometry textPadding = EdgeInsets.symmetric(
      horizontal: screenWidth < AppSpacing.smallscreen ? screenWidth * 0.08 : screenWidth * 0.20,
    );

    // Adjust the padding around the commission boxes
    final EdgeInsetsGeometry boxAreaPadding = EdgeInsets.symmetric(
      horizontal: screenWidth < AppSpacing.smallscreen ? screenWidth * 0.05 : screenWidth * 0.10,
    );

    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSpacing.large),
            const CustomHeaderLarge(text: 'COMMISSIONS', subheader: '(Open)'),
            Padding(
              padding: textPadding,
              child: _buildIntroSection(),
            ),
            const SizedBox(height: AppSpacing.xl),
            Padding(
              padding: textPadding,
              child: _buildTextSection(
                'Emotes',
                "Custom emotes designed to match your channel's and community's personality and style.\nDelivery times are set generously to account for life’s demands, but they are usually shorter.",
                [
                  "PNG in 4 sizes (28x28, 56x56, 112x112, 128x128)",
                  "600 dpi",
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildPackagesSection(boxAreaPadding, screenWidth),
            const SizedBox(height: AppSpacing.xl),
            Padding(
              padding: textPadding,
              child: _buildTextSection(
                'Other Requests',
                "Looking for something else? I specialize in emotes, but feel free to reach out and let's have a chat about it.",
                [],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildLicenseSection(textPadding),
            const SizedBox(height: AppSpacing.xxxl),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    const String introductionText = "I love turning your ideas into vibrant emotes. "
        "Whether you have a clear vision or just a rough idea, we'll work together to bring it to life. "
        "From sketches to the final piece, I put my heart into each step to ensure you'll love the result.\n\n"
        "Let’s create something amazing together!";

    return Text(
      introductionText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _buildPackagesSection(EdgeInsetsGeometry boxAreaPadding, double screenWidth) {
    final List<CommissionPackage> packages = [
      const CommissionPackage(
        title: 'Basic',
        price: '\$10',
        description: '1 custom static emote, tailored to your specifications.',
        deliveryTime: '5-day delivery',
        revisions: '2 Revisions',
        emotes: '1 emote',
      ),
      const CommissionPackage(
        title: 'Standard',
        price: '\$25',
        description: '3 custom static emotes, tailored to your specifications.',
        deliveryTime: '10-day delivery',
        revisions: '3 Revisions',
        emotes: '3 emotes',
      ),
      const CommissionPackage(
        title: 'Premium',
        price: '\$40',
        description: '6 custom static emotes, tailored to your specifications.',
        deliveryTime: '14-day delivery',
        revisions: '4 Revisions',
        emotes: '6 emotes',
      ),
    ];

    return Padding(
      padding: boxAreaPadding,
      child: screenWidth < AppSpacing.smallscreen
          ? Column(
              children: packages
                  .map((package) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.xl),
                        child: package,
                      ))
                  .toList(),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: packages
                  .map((package) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
                          child: package,
                        ),
                      ))
                  .toList(),
            ),
    );
  }

  Widget _buildTextSection(String title, String content, List<String> bulletPoints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.small),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        if (bulletPoints.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.small),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: bulletPoints
                .map((point) => Text(
                      point,
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                    ))
                .toList(),
          ),
        ],
      ],
    );
  }

  Widget _buildLicenseSection(EdgeInsetsGeometry textPadding) {
    return Padding(
      padding: textPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'License / Terms of Use',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            "By commissioning me, you're purchasing a license to use my emotes/art on your streaming platforms and community chatrooms (e.g., Discord). As the artist, I retain full copyright to the artwork.",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.small),
          _buildBulletPointsSection(
            title: "What You Can’t Do:",
            points: [
              "Transform, recolor, or edit the emotes without my consent.",
              "Sell the emotes or use them on merchandise without purchasing commercial rights.",
              "Use the emotes for NFTs or AI art purposes.",
            ],
          ),
          _buildBulletPointsSection(
            title: "What You Can Do:",
            points: [
              "Hire an animator to animate the emotes, provided they don’t claim rights to the original artwork.",
              "Commission other artists in the future, but they should not directly replicate my style.",
            ],
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            "Commercial Rights: If you want to use the emotes for merchandise or need full copyright, we can discuss a commercial rights agreement.",
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPointsSection({required String title, required List<String> points}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppSpacing.small),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.small),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
              child: Text(
                "- $point",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            )),
      ],
    );
  }
}

class CommissionPackage extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String deliveryTime;
  final String revisions;
  final String emotes;

  const CommissionPackage({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.deliveryTime,
    required this.revisions,
    required this.emotes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.large),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.small),
                Text(
                  price,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.medium),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: AppSpacing.medium),
          Divider(
            color: Theme.of(context).dividerTheme.color,
            thickness: Theme.of(context).dividerTheme.thickness,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: AppSpacing.medium),
          _buildIconTextRow(context, Icons.access_time, deliveryTime),
          const SizedBox(height: AppSpacing.small),
          _buildIconTextRow(context, Icons.replay, revisions),
          const SizedBox(height: AppSpacing.small),
          _buildIconTextRow(context, Icons.check, emotes),
        ],
      ),
    );
  }

  Widget _buildIconTextRow(BuildContext context, IconData icon, String text) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, color: blueThemePrimary300, size: 20),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Text(
            text,
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
