import 'package:flutter/material.dart';
import 'package:justjoew/constants/AppStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
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
            const CustomHeaderLarge(text: AppStrings.commissionsHeader, subheader: AppStrings.commissionsSubheader),
            Padding(
              padding: textPadding,
              child: _buildIntroSection(),
            ),
            const SizedBox(height: AppSpacing.xl),
            Padding(
              padding: textPadding,
              child: _buildTextSection(
                AppStrings.emotesTitle,
                AppStrings.emotesDescription,
                AppStrings.emotesDetails,
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildPackagesSection(boxAreaPadding, screenWidth),
            const SizedBox(height: AppSpacing.xl),
            Padding(
              padding: textPadding,
              child: _buildTextSection(
                AppStrings.otherRequestsTitle,
                AppStrings.otherRequestsDescription,
                [],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _buildLicenseSection(textPadding),
            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Text(
      AppStrings.introductionText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _buildPackagesSection(EdgeInsetsGeometry boxAreaPadding, double screenWidth) {
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
            AppStrings.licenseTitle,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            AppStrings.licenseDescription,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
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
          const SizedBox(height: AppSpacing.small),
          Text(
            AppStrings.commercialRightsText,
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
        color: AppColors.packageBackground.withOpacity(0.1),
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
    return Row(
      children: [
        Icon(icon, color: AppColors.commissionIcons, size: 20),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
