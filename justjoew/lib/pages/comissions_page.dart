import 'package:flutter/material.dart';
import 'package:justjoew/constants/costum_colors.dart';
import 'package:justjoew/mixins/scaffoldMixin.dart';
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
    EdgeInsetsGeometry padding = screenWidth < 600
        ? const EdgeInsets.symmetric(horizontal: 16.0)
        : const EdgeInsets.symmetric(horizontal: 64.0);

    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: CustomHeaderLarge(text: 'COMMISSIONS'), // Centered header
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth < 600 ? screenWidth * 0.06 : screenWidth * 0.15),
              child: const Text(
                "I'm Joe, I love turning your ideas into vibrant emotes. "
                "Whether you have a clear vision or just a rough idea, we'll work together to bring it to life. "
                "From sketches to the final piece, I put my heart into each step to ensure you'll love the result.\n\n"
                "Commissions reflect the value of my art and cover the costs of my tools.\n\n"
                "Let’s create something amazing together!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'SourceCodePro',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 40),
            screenWidth < 600
                ? Column(
                    children: [
                      CommissionPackage(
                        title: 'Basic',
                        price: '\$10',
                        description:
                            '1 custom static emote for, high quality, tailored to your specifications.',
                        deliveryTime: '5-day delivery',
                        revisions: '2 Revisions',
                        emotes: '1 emote',
                      ),
                      const SizedBox(height: 16),
                      CommissionPackage(
                        title: 'Standard',
                        price: '\$25',
                        description:
                            '3 custom static emote for, high quality, tailored to your specifications.',
                        deliveryTime: '10-day delivery',
                        revisions: '3 Revisions',
                        emotes: '3 emotes',
                      ),
                      const SizedBox(height: 16),
                      CommissionPackage(
                        title: 'Premium',
                        price: '\$40',
                        description:
                            '6 custom static emote for, high quality, tailored to your specifications.',
                        deliveryTime: '14-day delivery',
                        revisions: '4 Revisions',
                        emotes: '6 emotes',
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CommissionPackage(
                          title: 'Basic',
                          price: '\$10',
                          description:
                              '1 custom static emote for, high quality, tailored to your specifications.',
                          deliveryTime: '5-day delivery',
                          revisions: '2 Revisions',
                          emotes: '1 emote',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CommissionPackage(
                          title: 'Standard',
                          price: '\$25',
                          description:'3 custom static emote for, high quality, tailored to your specifications.',
                          deliveryTime: '10-day delivery',
                          revisions: '3 Revisions',
                          emotes: '3 emotes',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CommissionPackage(
                          title: 'Premium',
                          price: '\$40',
                          description:'6 custom static emote for, high quality, tailored to your specifications.',
                          deliveryTime: '14-day delivery',
                          revisions: '4 Revisions',
                          emotes: '6 emotes',
                        ),
                      ),
                    ],
                  ),
          ],
        ),
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
    Key? key,
    required this.title,
    required this.price,
    required this.description,
    required this.deliveryTime,
    required this.revisions,
    required this.emotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'SourceCodePro',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            price,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'SourceCodePro',
              fontSize: 24,
              color: blueThemePrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontFamily: 'SourceCodePro',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.access_time, color: blueThemePrimary300),
              const SizedBox(width: 8),
              Text(
                deliveryTime,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'SourceCodePro',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.replay, color: blueThemePrimary300),
              const SizedBox(width: 8),
              Text(
                revisions,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'SourceCodePro',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.check, color: blueThemePrimary300),
              const SizedBox(width: 8),
              Text(
                emotes,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontFamily: 'SourceCodePro',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
