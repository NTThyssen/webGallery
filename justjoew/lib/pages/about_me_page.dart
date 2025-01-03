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
                      text: AppStrings.aboutMeHeader,
                    ),
                  ),
                  //const SizedBox(height: AppSpacing.large),
                  _buildIntroSection(screenWidth),
                  const SizedBox(height: AppSpacing.xl),
                  _buildSection(
                    title: AppStrings.passionTitle,
                    content: AppStrings.passionText,
                  ),
                  const SizedBox(height: AppSpacing.large),
                  _buildSection(
                    title: AppStrings.processTitle,
                    content: AppStrings.combinedProcessDescription,
                  ),   
                  const SizedBox(height: AppSpacing.large),
                  _buildSection(
                    title: AppStrings.backgroundTitle,
                    content: AppStrings.aboutMeText,
                  ),                                              
                  const SizedBox(height: AppSpacing.xxxl),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildIntroSection(double screenWidth) {
  // Use different layouts depending on the screen width
  return screenWidth < 800 // Adjust the breakpoint as needed
      ? Column(
          children: [
            _buildCenteredImage(ImageStrings.aboutImage, screenWidth),
            const SizedBox(height: AppSpacing.large),
            _buildTextSectionNoPadding(AppStrings.introText),
          ],
        )
      : Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Aligns to the center
          children: [
            Flexible(
              flex: 1,
              child: _buildCenteredImage(ImageStrings.aboutImage, screenWidth),
            ),
            const SizedBox(width: AppSpacing.xl),
            Expanded(
              flex: 3,
              child: _buildTextSectionNoPadding(AppStrings.introText),
            ),
          ],
        );
}



  Widget _buildSection({
    required String title,
    String? content,
    Widget? contentWidget,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        if (content != null) _buildTextSection(content),
        if (contentWidget != null) contentWidget,
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return SelectableText(
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
      child: SelectableText(
        text,
        style: AppTextStyles.bodyText
      ),
    );
  }

  Widget _buildTextSectionNoPadding(String text) {
    return SelectableText(
      text,
      style: AppTextStyles.bodyText
     );
  }

  Widget _buildCenteredImage(String imagePath, double screenWidth) {
  // Define image sizes for different screen widths
  double imageSize;

  if (screenWidth < 600) {
    // Small screens (e.g., mobile)
    imageSize = 150;
  } else if (screenWidth < 1200) {
    // Medium screens (e.g., tablets, small desktops)
    imageSize = 200;
  } else {
    // Large screens (e.g., large desktops)
    imageSize = 250;
  }

  return Center(
    child: ClipOval(
      child: Image.asset(
        imagePath,
        width: imageSize,
        height: imageSize,
        fit: BoxFit.cover, // Keep the aspect ratio while covering the container
        filterQuality: FilterQuality.high,
      ),
    ),
  );
}

}

