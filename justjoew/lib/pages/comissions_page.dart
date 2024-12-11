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
      AppStrings.commissionsIntroductionText,
      style: AppTextStyles.bodyText,
    );
  }

  Widget _buildPackagesSection(double screenWidth) {
    final List<CommissionPackage> staticPackages = [
      CommissionPackage(
        title: AppStrings.basicPackageTitle,
        price: AppStrings.basicPackagePrice,
        description: AppStrings.basicPackageDescription,
        deliveryTime: AppStrings.basicPackageDelivery,
        revisions: AppStrings.basicPackageRevisions,
        emotes: AppStrings.basicPackageEmotes,
      ),
      CommissionPackage(
        title: AppStrings.standardPackageTitle,
        price: AppStrings.standardPackagePrice,
        description: AppStrings.standardPackageDescription,
        deliveryTime: AppStrings.standardPackageDelivery,
        revisions: AppStrings.standardPackageRevisions,
        emotes: AppStrings.standardPackageEmotes,
      ),
      CommissionPackage(
        title: AppStrings.premiumPackageTitle,
        price: AppStrings.premiumPackagePrice,
        description: AppStrings.premiumPackageDescription,
        deliveryTime: AppStrings.premiumPackageDelivery,
        revisions: AppStrings.premiumPackageRevisions,
        emotes: AppStrings.premiumPackageEmotes,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPackageDescription(
          AppStrings.staticEmotesTitle,
          AppStrings.staticEmotesDescription,
        ),
        _buildPackageCategory(AppStrings.staticEmotesTitle, staticPackages),
        const SizedBox(height: AppSpacing.large),
        _buildAddOnSection(),
        const SizedBox(height: AppSpacing.large),
        _buildPackageDescription(
          AppStrings.animatedEmotesTitle,
          AppStrings.animatedEmotesDescription,
        ),
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
      // Medium screens: Horizontal scroll
      return SingleChildScrollView(
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
      );
    } else {
      // Small screens: Stacked vertically
      return Column(
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
      );
    }
  }

  Widget _buildAddOnSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBulletPoints(AppStrings.addOns),
      ],
    );
  }

  Widget _buildFAQSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: AppStrings.faqItems.map((faq) {
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
          AppStrings.contactMe,
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
                AppStrings.contactButtonText,
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
    final steps = AppStrings.steps;

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
