import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';
import 'package:justjoew/widgets/contact_form.dart'; // Import the ContactForm
import 'package:url_launcher/url_launcher.dart'; // For launching email
import 'package:flutter/gestures.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with BasicMixin {
  Future<void> _launchEmail() async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: AppStrings.email,
      query: 'subject=Hello', // Optional default subject
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: SelectableText(
            'Could not launch $emailUri',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      );
    }
  }

  @override
  Widget body() {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < AppSpacing.smallscreen
        ? screenWidth * 0.08
        : screenWidth * 0.20;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: CustomHeaderLarge(text: AppStrings.contact),
            ),
            const SizedBox(height: AppSpacing.large),
            _buildContactInfoSection(),
            const SizedBox(height: AppSpacing.xxxl),
            const ContactForm(), // Use the new ContactForm widget
          ],
        ),
      ),
    );
  }

  

  Widget _buildContactInfoSection() {
    return Column(
      children: [
        SelectableText(
          AppStrings.contactIntroText,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyText.copyWith(
            height: 1.6, // Increased line height for readability
          ),
        ),
        const SizedBox(height: AppSpacing.medium),
        SelectableText.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.email,
                style: AppTextStyles.linkText,
                recognizer: TapGestureRecognizer()..onTap = _launchEmail,
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.small),
        SelectableText(
          AppStrings.contactOutroText,
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyText.copyWith(
            height: 1.6, // Increased line height for readability
          ),
        ),
      ],
    );
  }

}
