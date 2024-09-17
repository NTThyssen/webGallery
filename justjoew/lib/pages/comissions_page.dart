import 'package:flutter/material.dart';
import 'package:justjoew/constants/AppStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/commission_package.dart';
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

    // Use the provided horizontal padding logic
    final horizontalPadding = screenWidth < AppSpacing.smallscreen
        ? screenWidth * 0.08
        : screenWidth * 0.20;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Left-align content
            children: [
              Center(
                child: const CustomHeaderLarge(
                  text: AppStrings.commissionsHeader,
                  subheader: AppStrings.commissionsSubheader,
                ),
              ),
              const SizedBox(height: AppSpacing.large),
              _buildIntroSection(),
              const SizedBox(height: AppSpacing.medium),
              _detailsSection(),
              const SizedBox(height: AppSpacing.medium),
              _buildBulletPoints(AppStrings.emotesDetails),            
              const SizedBox(height: AppSpacing.large),
              _buildPackagesSection(screenWidth),
              const SizedBox(height: AppSpacing.medium),
              _buildOtherRequestsNote(context),
              const SizedBox(height: AppSpacing.large),
              _buildLicenseSection(),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Text(
      AppStrings.comissionsIntroductionText,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _detailsSection() {
    return Text(
      AppStrings.emotesDescription,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points.map((point) => Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.small * 0.25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '- ', // The bullet character
                  style: TextStyle(fontWeight: FontWeight.w100), // Lighter font weight
                ),
                Expanded(
                  child: Text(
                    point,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w100, fontSize: 12), // Lighter font weight for the text
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ))
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
      emotes: AppStrings.basicPackageEmotes,
    ),
    const CommissionPackage(
      title: AppStrings.standardPackageTitle,
      price: AppStrings.standardPackagePrice,
      description: AppStrings.standardPackageDescription,
      deliveryTime: AppStrings.standardPackageDelivery,
      revisions: AppStrings.standardPackageRevisions,
      emotes: AppStrings.standardPackageEmotes,
    ),
    const CommissionPackage(
      title: AppStrings.premiumPackageTitle,
      price: AppStrings.premiumPackagePrice,
      description: AppStrings.premiumPackageDescription,
      deliveryTime: AppStrings.premiumPackageDelivery,
      revisions: AppStrings.premiumPackageRevisions,
      emotes: AppStrings.premiumPackageEmotes,
    ),
  ];

  return screenWidth < AppSpacing.smallscreen
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < packages.length; i++)
              Padding(
                padding: EdgeInsets.only(
                  bottom: i < packages.length - 1 ? AppSpacing.xl : 0, // Padding only between boxes
                ),
                child: packages[i],
              ),
          ],
        )
      : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < packages.length; i++)
              Flexible( // Use Flexible to allow resizing on smaller screens
                flex: 1, // Ensure equal distribution of space
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.large / 2, // Symmetrical padding between boxes
                  ),
                  child: packages[i],
                ),
              ),
          ],
        );
}

  Widget _buildOtherRequestsNote(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
      child: Text(
        AppStrings.otherRequestsDescription,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
              color: AppColors.primary300,
            ),
      ),
    );
  }

  Widget _buildLicenseSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.large),
      decoration: BoxDecoration(
        color: AppColors.packageBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
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
            child: Text(
              AppStrings.licenseTitle,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            AppStrings.licenseDescription,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: AppSpacing.small),
          _buildBulletPointsSection(
            title: AppStrings.whatYouCantDoTitle,
            points: AppStrings.whatYouCantDoPoints,
          ),
          _buildBulletPointsSection(
            title: AppStrings.whatYouCanDoTitle,
            points: AppStrings.whatYouCanDoPoints,
          ),
          const SizedBox(height: AppSpacing.medium),
          Text(
            AppStrings.commercialRightsText,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPointsSection({required String title, required List<String> points}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.small),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSpacing.small),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '- ', // The bullet character
                    style: TextStyle(fontWeight: FontWeight.w400), // Lighter font weight for the bullet
                  ),
                  Expanded(
                    child: Text(
                      point,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w100), // Lighter font weight for the text
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
