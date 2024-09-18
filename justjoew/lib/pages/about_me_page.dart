import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/constants/ImageStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with BasicMixin {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: CustomHeaderLarge(text: AppStrings.aboutMeHeader)),
            
            // Introduction Section
            _buildIntroSection(screenWidth),
            
            // About Me Section
            const SizedBox(height: AppSpacing.large*1.25),
            _buildSectionTitle(AppStrings.backgroundTitle),
            const SizedBox(height: AppSpacing.medium),
            _buildTextSection(AppStrings.aboutMeText),
            
            // Process Section
            const SizedBox(height: AppSpacing.large*1.25),
            _buildSectionTitle(AppStrings.processTitle),
            const SizedBox(height: AppSpacing.medium),
            _buildProcessSection(),
            
            // Passion Section
            const SizedBox(height: AppSpacing.large*1.25),
            _buildSectionTitle(AppStrings.passionTitle),
            const SizedBox(height: AppSpacing.medium),
            _buildTextSection(AppStrings.passionText),
            const SizedBox(height: AppSpacing.large),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection(double screenWidth) {
    if (screenWidth < AppSpacing.smallscreen) {
      // Vertical layout for smaller screens
      return Column(
        children: [
          _buildTextSection(AppStrings.introText),
          const SizedBox(height: AppSpacing.large),
          _buildCenteredImage(ImageStrings.profileImage, screenWidth),
        ],
      );
    } else {
      // Horizontal layout for larger screens
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: _buildTextSection(AppStrings.introText),
          ),
          const SizedBox(width: AppSpacing.xl),
          Expanded(
            child: _buildCenteredImage(ImageStrings.profileImage, screenWidth),
          ),
        ],
      );
    }
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildTextSection(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
    );
  }

  Widget _buildProcessSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBulletPoint('Consult', AppStrings.processConsult),
        _buildBulletPoint('Concept', AppStrings.processConcept),
        _buildBulletPoint('Sketch', AppStrings.processSketch),
        _buildBulletPoint('Finalize', AppStrings.processFinalize),
      ],
    );
  }

  Widget _buildBulletPoint(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: description,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenteredImage(String imagePath, double screenWidth) {
    double imageSize = screenWidth < AppSpacing.smallscreen ? 135 : 250;
    return Image.asset(
      imagePath,
      filterQuality: FilterQuality.high,
      width: imageSize,
    );
  }
}
