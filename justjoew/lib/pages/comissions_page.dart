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
              //_buildDetailsHeader(),
              //const SizedBox(height: AppSpacing.medium),
              //_buildBulletPoints(AppStrings.emotesDetails),
              const SizedBox(height: AppSpacing.large),
              _buildPackagesSection(screenWidth),
              const SizedBox(height: AppSpacing.large),
              _buildContactSection(),
              const SizedBox(height: AppSpacing.xxxl),
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

  Widget _buildDetailsHeader() {
    return SelectableText(
      AppStrings.dets,
      style: AppTextStyles.headingSmall.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
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

  Widget _buildPackagesSection(double screenWidth) {
    final List<CommissionPackage> packages = [
      const CommissionPackage(
        title: AppStrings.basicPackageTitle,
        price: AppStrings.basicPackagePrice,
        description: AppStrings.basicPackageDescription,
        deliveryTime: AppStrings.basicPackageDelivery,
        revisions: AppStrings.basicPackageRevisions,
        emotes: AppStrings.basicPackageDescription,
      ),
      const CommissionPackage(
        title: AppStrings.standardPackageTitle,
        price: AppStrings.standardPackagePrice,
        description: AppStrings.standardPackageDescription,
        deliveryTime: AppStrings.standardPackageDelivery,
        revisions: AppStrings.standardPackageRevisions,
        emotes: AppStrings.standardPackageDescription,
      ),
      const CommissionPackage(
        title: AppStrings.premiumPackageTitle,
        price: AppStrings.premiumPackagePrice,
        description: AppStrings.premiumPackageDescription,
        deliveryTime: AppStrings.premiumPackageDelivery,
        revisions: AppStrings.premiumPackageRevisions,
        emotes: AppStrings.premiumPackageDescription,
      ),
    ];

    return Column(
      children: [
        screenWidth < AppSpacing.smallscreen
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: packages
                    .map(
                      (package) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.xl),
                        child: package,
                      ),
                    )
                    .toList(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: packages
                    .map(
                      (package) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.large / 2,
                        ),
                        child: SizedBox(
                          width: 300,
                          child: package,
                        ),
                      ),
                    )
                    .toList(),
              ),
        const SizedBox(height: AppSpacing.large),
      ],
    );
  }

  Widget _buildFAQSection() {
    final faqItems = [
      {
        "question": "How do I request a commission?",
        "answer": "Getting started is easy! Before any commission, we’ll have a chat about expectations to ensure I’m the right fit for you. \nYou can either visit my Contact Page or book a Concept Chat on Ko-fi. \nOnce we’re aligned, I’ll guide you through the rest, and together we’ll create something amazing!",
      },
      {
        "question": "What do you get?",
        "answer": "You’ll receive high-quality PNG files at 128x128px, 300 DPI - Perfect for platforms like Twitch and Discord. \nFor more details on how you can use the emotes, check out my Usage License to understand what’s allowed and what’s not.",
      }
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
                const SizedBox(height: AppSpacing.medium),
        ...faqItems.map((faq) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  faq["question"]!,
                  style: AppTextStyles.bodyTextBold.copyWith(color: AppColors.primary,)
                ),
                const SizedBox(height: AppSpacing.small * 0.5),
                SelectableText(
                  faq["answer"]!,
                  style: AppTextStyles.bodyText,
                ),
              ],
            ),
          );
        }).toList(),
      ],
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
            "We start with a friendly chat to discuss your vision. This can happen through email, Discord, or a Concept Chat on Ko-fi.",
      },
      {
        "title": "Initial Sketches",
        "description":
            "Once we align on the concept, I’ll create sketches for your review. You’ll have the chance to provide feedback before we move forward.",
      },
      {
        "title": "Refinement and Coloring",
        "description":
            "After the sketches are approved, I’ll refine the designs and add color, keeping you updated throughout the process.",
      },
      {
        "title": "Final Delivery",
        "description":
            "Your finished emotes will be delivered as high-quality PNG files. I'll send them via Google Drive, email, or Discord—your choice.",
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          "How It Works",
          style: AppTextStyles.bodyTextBold.copyWith(
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.medium),
        ...steps.map((step) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.medium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  step["title"]!,
                  style: AppTextStyles.bodyTextBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                SelectableText(
                  step["description"]!,
                  style: AppTextStyles.bodyText,
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
