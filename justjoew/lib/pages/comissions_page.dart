import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
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
    final double maxContentWidth = 1100;
    bool isLargeScreen = screenWidth > AppSpacing.smallscreen;

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
              Center(
                child: CustomHeaderLarge(
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
              _buildOtherRequestsNote(),
              const SizedBox(height: AppSpacing.large),
              _buildLicenseSection(isLargeScreen),
              const SizedBox(height: AppSpacing.large),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Text(
      AppStrings.comissionsIntroductionText,
      style: AppTextStyles.bodyText,
    );
  }

  Widget _detailsSection() {
    return Text(
      AppStrings.emotesDescription,
      style: AppTextStyles.bodyText,
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: points
          .map(
            (point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small * 0.25),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '- ', // The bullet character
                    style: AppTextStyles.listText, // Updated to listText
                  ),
                  Expanded(
                    child: Text(
                      point,
                      style: AppTextStyles.listText, // Updated to listText
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
                    child: Container(
                      width: 300, // Set a fixed width for each package
                      child: package,
                    ),
                  ),
                )
                .toList(),
          );
  }

  Widget _buildOtherRequestsNote() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.large),
      child: Text(
        AppStrings.otherRequestsDescription,
        style: AppTextStyles.bodyText.copyWith(
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildLicenseSection(bool isLargeScreen) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.large),
      decoration: BoxDecoration(
        color: AppColors.packageBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.small),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: isLargeScreen ? Alignment.center : Alignment.centerLeft,
            child: Text(
              AppStrings.licenseTitle,
              style: AppTextStyles.headingSmall,
            ),
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            AppStrings.licenseDescription,
            style: AppTextStyles.bodyText,
          ),
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
            style: AppTextStyles.bodyText,
          ),
        ],
      ),
    );
  }

  Widget _buildBulletPointsSection({
    required String title,
    required List<String> points,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyTextBold.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.small),
          _buildBulletPoints(points),
        ],
      ),
    );
  }
}
