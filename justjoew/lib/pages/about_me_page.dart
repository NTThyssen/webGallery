import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/constants/ImageStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with BasicMixin {
  final List<ProcessStep> processSteps = [
    ProcessStep(
      title: 'Consult',
      description: AppStrings.processConsult,
      icon: Icons.chat_bubble_outline,
    ),
    ProcessStep(
      title: 'Concept',
      description: AppStrings.processConcept,
      icon: Icons.lightbulb_outline,
    ),
    ProcessStep(
      title: 'Sketch',
      description: AppStrings.processSketch,
      icon: Icons.brush,
    ),
    ProcessStep(
      title: 'Finalize',
      description: AppStrings.processFinalize,
      icon: Icons.check_circle_outline,
    ),
  ];

  @override
  Widget body() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        final double maxContentWidth = 1100;

        return SingleChildScrollView(
          child: Center(
            child: Container(
              width: screenWidth < maxContentWidth ? screenWidth : maxContentWidth,
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomHeaderLarge(
                      text: AppStrings.aboutMeHeader,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.large),
                  _buildIntroSection(screenWidth),
                  const SizedBox(height: AppSpacing.xl),
                  _buildSection(
                    title: AppStrings.backgroundTitle,
                    content: AppStrings.aboutMeText,
                  ),
                  const SizedBox(height: AppSpacing.large),
                  _buildSection(
                    title: AppStrings.processTitle,
                    content: AppStrings.combinedProcessDescription,
                  ),
                  const SizedBox(height: AppSpacing.large),
                  _buildSection(
                    title: AppStrings.passionTitle,
                    content: AppStrings.passionText,
                  ),
                  const SizedBox(height: AppSpacing.large),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIntroSection(double screenWidth) {
    return screenWidth < AppSpacing.smallscreen
        ? Column(
            children: [
              _buildCenteredImage(ImageStrings.profileImage, screenWidth),
              const SizedBox(height: AppSpacing.large),
              _buildTextSection(AppStrings.introText),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: _buildCenteredImage(ImageStrings.profileImage, screenWidth),
              ),
              const SizedBox(width: AppSpacing.large),
              Expanded(
                flex: 2,
                child: _buildTextSection(AppStrings.introText),
              ),
            ],
          );
  }

  Widget _buildSection({
    required String title,
    String? content,
    Widget? contentWidget,
    double verticalPadding = 0,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        const SizedBox(height: AppSpacing.medium),
        if (content != null) _buildTextSection(content),
        if (contentWidget != null) contentWidget,
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.headingSmall.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w600, // Emphasizing section titles
      ),
    );
  }

  Widget _buildTextSection(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      child: Text(
        text,
        style: AppTextStyles.bodyText.copyWith(
          height: 1.6, // Increased line height for readability
        ),
      ),
    );
  }

  Widget _buildProcessSection(double screenWidth) {
    double itemWidth = screenWidth < AppSpacing.smallscreen ? 130 : 150;
    double spacing = AppSpacing.medium;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: processSteps.map((step) {
          return Container(
            width: itemWidth,
            margin: EdgeInsets.symmetric(horizontal: spacing / 2),
            decoration: BoxDecoration(
              color: AppColors.darkGray,
              borderRadius: BorderRadius.circular(AppSpacing.small),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(AppSpacing.small),
            child: _buildProcessStep(step.title, step.description, step.icon),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProcessStep(String title, String description, IconData iconData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(iconData, color: AppColors.primary, size: 30),
        const SizedBox(height: AppSpacing.small),
        Text(
          title,
          style: AppTextStyles.bodyTextBold.copyWith(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.small),
        Text(
          description,
          style: AppTextStyles.bodyText.copyWith(fontSize: 12, height: 1.4),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCenteredImage(String imagePath, double screenWidth) {
    double imageSize = screenWidth < AppSpacing.smallscreen ? 150 : 250;
    imageSize = imageSize > 250 ? 250 : imageSize;

    return Center(
      child: ClipOval(
        child: Image.asset(
          imagePath,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

class ProcessStep {
  final String title;
  final String description;
  final IconData icon;

  ProcessStep({
    required this.title,
    required this.description,
    required this.icon,
  });
}
