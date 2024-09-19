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
                  _buildIntroSection(screenWidth),
                  const SizedBox(height: AppSpacing.xl),
                  _buildSection(
                    title: AppStrings.backgroundTitle,
                    content: AppStrings.aboutMeText,
                  ),
                  /*const SizedBox(height: AppSpacing.large),
                  _buildSection(
                    title: AppStrings.processTitle,
                    content: AppStrings.combinedProcessDescription,
                    verticalPadding: AppSpacing.large,
                    contentWidget: _buildProcessSection(screenWidth),
                  ),*/
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
    if (screenWidth < AppSpacing.smallscreen) {
      return Column(
        children: [
          _buildCenteredImage(ImageStrings.profileImage, screenWidth),
          const SizedBox(height: AppSpacing.large),
          _buildTextSection(AppStrings.introText),
        ],
      );
    } else {
      return Row(
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
        SizedBox(height: verticalPadding),
        if (content != null) _buildTextSection(content),
        if (contentWidget != null) contentWidget,
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.smallTitle.copyWith(
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildTextSection(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      child: Text(
        text,
        style: AppTextStyles.paragraph.copyWith(height: 1.6),
      ),
    );
  }

  Widget _buildProcessSection(double screenWidth) {
    final double horizontalPadding = AppSpacing.medium * 2;
    final int numberOfSteps = processSteps.length;

    // Available width for the boxes after subtracting padding
    double availableWidth = screenWidth - horizontalPadding;

    // Set desired width for each box
    double itemWidth = 150; // Adjust as needed

    // Calculate total required width for all boxes and spacing
    double totalItemWidth = itemWidth * numberOfSteps;
    double spacing = AppSpacing.small;

    // Check if total required width exceeds available width
    if (totalItemWidth + spacing * (numberOfSteps - 1) > availableWidth) {
      // Adjust itemWidth to fit all boxes
      itemWidth = (availableWidth - spacing * (numberOfSteps - 1)) / numberOfSteps;
      // Ensure itemWidth doesn't go below a minimum value
      if (itemWidth < 120) {
        itemWidth = 120;
        // Allow horizontal scrolling
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: processSteps.map((step) {
          return Container(
            width: itemWidth,
            margin: EdgeInsets.symmetric(horizontal: spacing / 2),
            child: _buildProcessStep(
              step.title,
              step.description,
              step.icon,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProcessStep(String title, String description, IconData iconData) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.small),
      decoration: BoxDecoration(
        color: AppColors.darkGray,
        borderRadius: BorderRadius.circular(AppSpacing.small),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: AppColors.primary,
            size: 30,
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            title,
            style: AppTextStyles.paragraph.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.small),
          Text(
            description,
            style: AppTextStyles.paragraph.copyWith(
              fontSize: 12,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCenteredImage(String imagePath, double screenWidth) {
    double imageSize = screenWidth < AppSpacing.smallscreen ? 150 : 250;
    imageSize = imageSize > 250 ? 250 : imageSize;

    return Center(
      child: ClipOval(
        child: Image.asset(
          imagePath,
          filterQuality: FilterQuality.high,
          width: imageSize,
          height: imageSize,
          fit: BoxFit.cover,
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
