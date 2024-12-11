import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/commission_package.dart';
import 'package:justjoew/widgets/custom_header.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class CommissionPage extends StatefulWidget {
  const CommissionPage({super.key});

  @override
  State<CommissionPage> createState() => _CommissionPageState();
}

class _CommissionPageState extends State<CommissionPage> with BasicMixin {
  @override
  Widget body() {
    double screenWidth = MediaQuery.of(context).size.width;
    const double maxContentWidth = 1100;

    return Center(
      child: Container(
        width: screenWidth < maxContentWidth ? screenWidth : maxContentWidth,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < AppSpacing.smallscreen
              ? AppSpacing.medium
              : AppSpacing.large,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CustomHeaderLarge(
                  text: AppStrings.commissionsHeader,
                  subheader: AppStrings.commissionsSubheader,
                ),
              ),
              const SizedBox(height: AppSpacing.large),
              _buildIntroSection(),
              _buildFAQSection(),
              const SizedBox(height: AppSpacing.large),
              _buildPackagesSection(screenWidth),
              const SizedBox(height: AppSpacing.large),
              _buildContactSection(),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return SelectableText(
      AppStrings.comissionsIntroductionText,
      style: AppTextStyles.bodyText,
    );
  }

  Widget _buildPackagesSection(double screenWidth) {
    final List<CommissionPackage> staticPackages = [
      const CommissionPackage(
        title: "Single",
        price: "\$12",
        description: "Perfect for starting out, this includes one custom static emote tailored to your channel's unique personality.",
        deliveryTime: "7-day delivery",
        revisions: "2 Revisions",
        emotes: "1 static emote",
      ),
      const CommissionPackage(
        title: "Basic",
        price: "\$30",
        description: "A great option to expand your emote library, featuring three static emotes designed to reflect your style.",
        deliveryTime: "14-day delivery",
        revisions: "2 Revisions",
        emotes: "3 static emotes",
      ),
      const CommissionPackage(
        title: "Premium",
        price: "\$50",
        description: "For the ultimate customization, six static emotes to fully bring your channel's personality to life.",
        deliveryTime: "28-day delivery",
        revisions: "4 Revisions",
        emotes: "6 static emotes",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPackageDescription("Static Emotes", "Non-animated emotes that reflect the vibe of your channel and bring extra charm to your community. Below, you’ll find options to upgrade your bundle with additional emotes or animations."),
        _buildPackageCategory("Static Emotes", staticPackages),
        const SizedBox(height: AppSpacing.large),
        _buildAddOnSection(),
        const SizedBox(height: AppSpacing.large),
        _buildPackageDescription("Animated Emotes", "Animated emotes are a fun and lively way to bring your channel to life, adding that extra spark to keep your audience engaged. \nPricing ranges from \$25 to \$50 per emote, based on the complexity of the animation."),
      ],
    );
  }

  Widget _buildPackageDescription(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          title,
          style: AppTextStyles.headingSmall.copyWith(color: AppColors.white),
        ),
        const SizedBox(height: AppSpacing.small),
        SelectableText(
          description,
          style: AppTextStyles.bodyText,
        ),
        const SizedBox(height: AppSpacing.medium),
      ],
    );
  }

Widget _buildPackageCategory(String title, List<CommissionPackage> packages) {
  double screenWidth = MediaQuery.of(context).size.width;
  final ScrollController _scrollController = ScrollController();

  if (screenWidth > 1060) {
    // Large screens: Single row
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: packages
          .map(
            (package) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
              child: SizedBox(
                width: 300,
                child: package,
              ),
            ),
          )
          .toList(),
    );
  } else if (screenWidth > 600) {
  // Medium screens: Horizontal scroll with arrows
  return Column(
    children: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: packages.length > 0 ? constraints.maxHeight : 0,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: packages.map((package) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
                          child: SizedBox(
                            width: 300,
                            child: package,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ),
          // Left Arrow
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.offset - 320, // Adjust for card width + padding
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
          // Right Arrow
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: AppColors.primary),
              onPressed: () {
                _scrollController.animateTo(
                  _scrollController.offset + 320, // Adjust for card width + padding
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    ],
  );
}

  else {
    // Small screens: Stacked vertically
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centers children vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Centers children horizontally
        children: packages
            .map(
              (package) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.large),
                child: SizedBox(
                  width: 300,
                  child: package,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

  Widget _buildAddOnSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBulletPoints([
          "Additional static emotes for premium bundle: \$8 each",
          "Animation upgrade ranges: \$13 to \$38 each",
        ]),
      ],
    );
  }

  Widget _buildFAQSection() {
    final faqItems = [
      {
        "question": "How do I request a commission?",
        "answer": [
          {"text": "Getting started is easy! Before any commission, we’ll have a chat about expectations to ensure I’m the right fit for you. You can either visit my ", "isLink": false},
          {"text": "Contact Page", "isLink": true, "link": AppRoutes.contact},
          {"text": " or book a Concept Chat on ", "isLink": false},
          {"text": "Ko-fi", "isLink": true, "link": "https://ko-fi.com/c/638bf59cac"},
          {"text": ". Once we’re aligned, I’ll guide you through the rest, and together we’ll create something amazing!", "isLink": false}
        ],
      },
      {
        "question": "What do you get?",
        "answer": [
          {"text": "You’ll receive high-quality PNG files at 128x128px, 300 DPI—perfect for platforms like Twitch and Discord. For more details on how you can use the emotes, check out my ", "isLink": false},
          {"text": "Usage License", "isLink": true, "link": AppRoutes.usage},
          {"text": " to understand what’s allowed and what’s not.", "isLink": false}
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: faqItems.map((faq) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                faq["question"] as String,
                style: AppTextStyles.bodyTextBold.copyWith(color: AppColors.primary),
              ),
              const SizedBox(height: AppSpacing.small * 0.5),
              RichText(
                text: TextSpan(
                  children: (faq["answer"] as List<dynamic>).map<TextSpan>((answerPart) {
                    final part = answerPart as Map<String, dynamic>;
                    if (part["isLink"] == true) {
                      return TextSpan(
                        text: part["text"] as String,
                        style: AppTextStyles.bodyText.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            final link = part["link"] as String;
                            if (link.startsWith("http")) {
                              launch(link);
                            } else {
                              context.go(link);
                            }
                          },
                      );
                    } else {
                      return TextSpan(
                        text: part["text"] as String,
                        style: AppTextStyles.bodyText,
                      );
                    }
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildStepsSection(),
        const SizedBox(height: AppSpacing.medium),
        SelectableText(
          "Does this sound like something for you? Contact me!",
          style: AppTextStyles.bodyText,
        ),
        const SizedBox(height: AppSpacing.medium),
        Center(
          child: SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.contact);
              },
              child: Text(
                'Contact',
                style: AppTextStyles.buttonText.copyWith(
                  fontSize: 16,
                  color: AppColors.darkGray,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
Widget _buildStepsSection() {
  final steps = [
    {
      "title": "Concept and Discussion",
      "description": 
      "We start with a friendly chat to discuss your vision. This can happen through email, Discord, or a Concept Chat on Ko-fi. \n Before the commission is confirmed, you should review my ",
      "links": [
        {"text": "Terms", "route": AppRoutes.terms},
        {"text": ", and let me know if you need any special conditions. It can also be helpful to review the ", "route": null},
        {"text": "FAQ page.", "route": AppRoutes.faq}
      ]
    },
    {
      "title": "Initial Sketches",
      "description": "Once we align on the concept, I’ll create sketches for your review. You’ll have the chance to provide feedback before we move forward.",
    },
    {
      "title": "Refinement and Coloring",
      "description": "After the sketches are approved, I’ll refine the designs and add color, keeping you updated throughout the process.",
    },
    {
      "title": "Final Delivery",
      "description": "Your finished emotes will be delivered as high-quality PNG files, or gif if animations. I'll send them via Google Drive, email, or Discord.",
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SelectableText(
        "How It Works",
        style: AppTextStyles.headingSmall.copyWith(color: AppColors.white),
      ),
      const SizedBox(height: AppSpacing.medium),
      ...steps.map((step) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                step["title"] as String,
                style: AppTextStyles.bodyTextBold.copyWith(
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              RichText(
                text: TextSpan(
                  style: AppTextStyles.bodyText,
                  children: [
                    TextSpan(
                      text: step["description"] as String,
                      style: AppTextStyles.bodyText,
                    ),
                    if (step.containsKey("links"))
                      ...((step["links"] as List<dynamic>).map((link) {
                        final linkMap = link as Map<String, String?>;
                        return TextSpan(
                          text: linkMap["text"],
                          style: linkMap["route"] != null
                              ? AppTextStyles.bodyText.copyWith(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.white,
                                )
                              : AppTextStyles.bodyText,
                          recognizer: linkMap["route"] != null
                              ? (TapGestureRecognizer()
                                ..onTap = () => context.go(linkMap["route"]!))
                              : null,
                        );
                      })),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ],
  );
}


 Widget _buildBulletPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points
          .map(
            (point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small * 0.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    '- ',
                    style: AppTextStyles.bodyTextBold.copyWith(color: AppColors.primary),
                  ),
                  Expanded(
                    child: SelectableText(
                      point,
                      style: AppTextStyles.bodyText,
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
