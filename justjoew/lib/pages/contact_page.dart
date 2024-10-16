import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching email

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with BasicMixin {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchEmail() async {
    final emailUri = Uri(
      scheme: 'mailto',
      path: AppStrings.emailUrl,
      query: 'subject=Hello', // Optional default subject
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $emailUri', style: Theme.of(context).textTheme.labelSmall),
        ),
      );
    }
  }

  @override
  Widget body() {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define padding values for different screen sizes
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
            const SizedBox(height: AppSpacing.xl),
           // _buildContactForm(), // Add the form section here
          ],
        ),
      ),
    );
  }

  // Contact information section
  Widget _buildContactInfoSection() {
    return Column(
      children: [
        Text(
          AppStrings.contactIntroText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium, // Open Sans for body text
        ),
        const SizedBox(height: AppSpacing.medium),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _launchEmail,
            child: Text(
              AppStrings.email,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.link,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        Text(
          AppStrings.contactOutroText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium, // Open Sans for outro text
        ),
      ],
    );
  }

  // Contact form section
  Widget _buildContactForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormLabel(AppStrings.nameLabel),
          _buildTextFormField(
            controller: _firstNameController,
            hint: AppStrings.nameHint,
          ),
          const SizedBox(height: AppSpacing.medium),
          _buildFormLabel(AppStrings.emailLabel),
          _buildTextFormField(
            controller: _emailController,
            hint: AppStrings.emailHint,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.emailValidationError;
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return AppStrings.emailInvalidError;
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.medium),
          _buildFormLabel(AppStrings.subjectLabel),
          _buildTextFormField(
            controller: _subjectController,
            hint: AppStrings.subjectHint,
          ),
          const SizedBox(height: AppSpacing.medium),
          _buildFormLabel(AppStrings.messageLabel),
          _buildTextFormField(
            controller: _messageController,
            hint: AppStrings.messageHint,
            maxLines: 5,
          ),
          const SizedBox(height: AppSpacing.large),
          Center(
            child: SizedBox(
              width: 200, // Set width for button
              height: 50, // Set height for button
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppStrings.formSubmittingMessage,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary300,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.small),
                  ),
                ),
                child: Text(
                  AppStrings.submit,
                  style: Theme.of(context).textTheme.bodySmall
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build form labels
  Widget _buildFormLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold, // Emphasizing form labels
        ),
      ),
    );
  }

  // Helper method to build text form fields
  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppColors.formFill,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: AppColors.primary200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: AppColors.primary500, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: BorderSide(color: AppColors.error, width: 2.0),
        ),
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.primary300),
      ),
    );
  }
}
