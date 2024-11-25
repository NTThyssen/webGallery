import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher.dart';

class WilldoesPage extends StatefulWidget {
  const WilldoesPage({super.key});

  @override
  State<WilldoesPage> createState() => _WilldoesPageState();
}

class _WilldoesPageState extends State<WilldoesPage> with BasicMixin {
  final List<Map<String, dynamic>> sections = [
    {
      "title": AppStrings.introductionSectionTitle,
      "isIntroduction": true,
      "items": AppStrings.introductionSectionItems,
    },
    {
      "title": AppStrings.generalSectionTitle,
      "items": AppStrings.generalSectionItems,
    },
  ];

   @override
  Widget body() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        const double maxContentWidth = 1100;

        return SingleChildScrollView(
          child: Center(
            child: Container(
              width: screenWidth < maxContentWidth ? screenWidth : maxContentWidth,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: CustomHeaderLarge(
                      text: AppStrings.termsAndConditionsTitle,
                    ),
                  ),
                  Text(
                    AppStrings.lastUpdatedDate,
                    style: AppTextStyles.bodyText.copyWith(
                      color: AppColors.textSecondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.large),
                  _buildContentSections(),
                  const SizedBox(height: AppSpacing.xxxl),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContentSections() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: sections.map((section) {
        bool isIntroduction = section["isIntroduction"] ?? false;

        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.large),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                section['title'],
                style: AppTextStyles.headingSmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppSpacing.small),
              isIntroduction
                  ? _buildIntroductionText(section["items"])
                  : _buildBulletList(section["items"], 0),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildIntroductionText(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            item,
            style: AppTextStyles.bodyText.copyWith(height: 1.6),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBulletList(List<dynamic> items, int depth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        if (item is String) {
          return _buildIndentedBullet(depth == 0 ? "•" : "-", item, depth);
        } else if (item is Map<String, dynamic>) {
          return _buildIndentedLinkBullet(item, depth);
        } else if (item is List<dynamic>) {
          return _buildBulletList(item, depth + 1);
        }
        return const SizedBox.shrink();
      }).toList(),
    );
  }
  
  Widget _buildIndentedBullet(String bullet, String text, int depth) {
    return Padding(
      padding: EdgeInsets.only(left: depth * 24.0, bottom: 8.0), // Added bottom spacing
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bullet,
            style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: AppSpacing.small),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.bodyText.copyWith(height: 1.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndentedLinkBullet(Map<String, dynamic> item, int depth) {
    return Padding(
      padding: EdgeInsets.only(left: depth * 24.0, bottom: 8.0), // Added bottom spacing
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            depth == 0 ? "•" : "-",
            style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: AppSpacing.small),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodyText.copyWith(height: 1.6),
                children: [
                  TextSpan(text: item["prefix"] ?? ""),
                  TextSpan(
                    text: item["linkText"],
                    style: AppTextStyles.bodyTextBold.copyWith(
                      color: AppColors.link,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (await canLaunch(item["link"])) {
                          await launch(item["link"]);
                        }
                      },
                  ),
                  TextSpan(text: item["suffix"] ?? ""),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
