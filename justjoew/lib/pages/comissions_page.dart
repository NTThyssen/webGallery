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

    // Define padding values based on the screen width
    EdgeInsetsGeometry textPadding = EdgeInsets.symmetric(horizontal: screenWidth < AppSpacing.smallscreen ? screenWidth * 0.08 : screenWidth * 0.20);
    EdgeInsetsGeometry boxPadding = EdgeInsets.symmetric(horizontal: screenWidth < AppSpacing.smallscreen ? screenWidth * 0.2 : screenWidth * 0.08);


    // Text content
    const String introductionText = "I'm Joe, I love turning your ideas into vibrant emotes. "
        "Whether you have a clear vision or just a rough idea, we'll work together to bring it to life. "
        "From sketches to the final piece, I put my heart into each step to ensure you'll love the result.\n\n"
        "Commissions reflect the value of my art and cover the costs of my tools.\n\n"
        "Let’s create something amazing together!";

    // Package details
    final List<CommissionPackage> packages = [
      const CommissionPackage(
        title: 'Basic',
        price: '\$10',
        description: '1 custom static emote, high quality, tailored to your specifications.',
        deliveryTime: '5-day delivery',
        revisions: '2 Revisions',
        emotes: '1 emote',
      ),
      const CommissionPackage(
        title: 'Standard',
        price: '\$25',
        description: '3 custom static emotes, high quality, tailored to your specifications.',
        deliveryTime: '10-day delivery',
        revisions: '3 Revisions',
        emotes: '3 emotes',
      ),
      const CommissionPackage(
        title: 'Premium',
        price: '\$40',
        description: '6 custom static emotes, high quality, tailored to your specifications.',
        deliveryTime: '14-day delivery',
        revisions: '4 Revisions',
        emotes: '6 emotes',
      ),
    ];

    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.large),
            const Center(
              child: CustomHeaderLarge(text: 'COMMISSIONS'),
            ),
            const SizedBox(height: AppSpacing.large),
            Padding(
              padding: textPadding,
              child: Text(
                introductionText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium, // Using paragraph style
              ),
            ),
            const SizedBox(height: AppSpacing.xxl),
            Padding(
              padding: boxPadding,
              child: screenWidth < AppSpacing.smallscreen
                ? Column(
                    children: packages
                        .map((package) => Padding(
                              padding: const EdgeInsets.only(bottom: AppSpacing.medium),
                              child: package,
                            ))
                        .toList(),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: packages
                        .map((package) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
                                child: package,
                              ),
                            ))
                        .toList(),
                  ),
                  
            ),
            const SizedBox(height: AppSpacing.xxxl),
          ],
        ),
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
      padding: const EdgeInsets.all(AppSpacing.medium),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium, // Using smallTitleStyle
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            price,
            style: Theme.of(context).textTheme.labelLarge, // Using priceStyle
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium, // Using paragraph style
          ),
          const SizedBox(height: AppSpacing.small),
          Row(
            children: [
              const Icon(Icons.access_time, color: blueThemePrimary300),
              const SizedBox(width: AppSpacing.small),
              Text(
                deliveryTime,
                style: Theme.of(context).textTheme.bodyMedium, // Using paragraph style
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.small),
          Row(
            children: [
              const Icon(Icons.replay, color: blueThemePrimary300),
              const SizedBox(width: AppSpacing.small),
              Text(
                revisions,
                style: Theme.of(context).textTheme.bodyMedium, // Using paragraph style
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.small),
          Row(
            children: [
              const Icon(Icons.check, color: blueThemePrimary300),
              const SizedBox(width: AppSpacing.small),
              Text(
                emotes,
                style: Theme.of(context).textTheme.bodyMedium, // Using paragraph style
              ),
            ],
          ),
        ],
      ),
    );
  }
}
