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
              const Center(
                child: CustomHeaderLarge(
                  text: AppStrings.commissionsHeader,
                  subheader: AppStrings.commissionsSubheader,
                ),
              ),
              _buildIntroSection(),
              _buildOtherRequestsNote(),
              const SizedBox(height: AppSpacing.large),
              _detailsheader(),
              const SizedBox(height: AppSpacing.medium),
              _detailsSection(),
              const SizedBox(height: AppSpacing.medium),
              _buildBulletPoints(AppStrings.emotesDetails),
              const SizedBox(height: AppSpacing.xl),
              _buildPackagesSection(screenWidth),
              const SizedBox(height: AppSpacing.xl),
              _addsection(),
              const SizedBox(height: AppSpacing.medium),
              _buildContactButton(), // Inserted here
              const SizedBox(height: AppSpacing.xxl),
              _buildLicenseSection(isLargeScreen),
              const SizedBox(height: AppSpacing.xxxl),
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

  Widget _addsection() {
    return Text(
      AppStrings.additional,
      style: AppTextStyles.bodyText,
    );
  }

  Widget _detailsheader() {
    return Text(
      AppStrings.dets,
      style: AppTextStyles.headingSmall.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w600, // Emphasizing section titles
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

  Widget _buildContactButton() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Does this sound like something for you? Contact me!",
        style: AppTextStyles.bodyText
      ),
      const SizedBox(height: AppSpacing.xl), // Increase spacing for balance
      Center( // Centering the button to make it stand out more
        child: SizedBox(
          width: 150, // Set a fixed width for a better look
          height: 40,  // Set a fixed height to make the button more prominent
          child: ElevatedButton(
            onPressed: () {
               context.go(AppRoutes.contact); // Using context.go() for navigation
            },
            child: Text(
              'Contact',
              style: AppTextStyles.buttonText.copyWith(
                fontSize: 16, // Button text should be a bit larger for better readability
                color: AppColors.darkGray, // White text to contrast the button background
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

  Widget _buildLicenseSection(bool isLargeScreen) {
    return Container(      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [          
          Text(
              AppStrings.licenseTitle,
              style: AppTextStyles.headingSmall.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600, // Emphasizing section titles
              ),
          ),
          const SizedBox(height: AppSpacing.medium),
          Text(
            AppStrings.licenseDescription,
            style: AppTextStyles.bodyText,
          ),
          const SizedBox(height: AppSpacing.medium),
          _buildBulletPointsSection(
            title: AppStrings.whatYouCantDoTitle,
            points: AppStrings.whatYouCantDoPoints,
          ),
          _buildBulletPointsSection(
            title: AppStrings.whatYouCanDoTitle,
            points: AppStrings.whatYouCanDoPoints,
          ),
          const SizedBox(height: AppSpacing.large),
          Text(
            AppStrings.commercialRightsText,
            style: AppTextStyles.bodyText.copyWith(
              fontStyle: FontStyle.italic,
            ),
          )
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
