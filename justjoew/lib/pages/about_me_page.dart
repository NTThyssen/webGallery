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
  return screenWidth < AppSpacing.smallscreen
      ? Column(
          children: [
            _buildCenteredImage(ImageStrings.profileImage, screenWidth),
            const SizedBox(height: AppSpacing.large),
            _buildTextSectionNoPadding(AppStrings.introText),
          ],
        )
      : Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the top
          children: [
            Expanded(
              flex: 1,
              child: _buildCenteredImage(ImageStrings.profileImage, screenWidth),
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
    double verticalPadding = 0,
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
        style: AppTextStyles.bodyText
      ),
    );
  }

  Widget _buildTextSectionNoPadding(String text) {
    return Text(
      text,
      style: AppTextStyles.bodyText
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

