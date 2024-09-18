import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';
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
      
      child: Column(
        children: [
          SingleChildScrollView(
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
                
                
                // Contact Form Section
                //_buildContactForm(),
              ],
              
            ),
            
          ),
        ],
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
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _launchEmail,
            child: Text(
              AppStrings.email,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
        Text(
          AppStrings.contactOutroText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  // Contact form section
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
            width: 200, // Set the width for the button
            height: 50, // Set the height for the button
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
              child: Text(AppStrings.submit), // Remove explicit styling here
            ),
          ),
        ),
      ],
    ),
  );
}


  // Helper method to build form labels
  Widget _buildFormLabel(String label) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodySmall,
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
      decoration: InputDecoration(
        hintText: hint,
      ),
      maxLines: maxLines,
      validator: validator,
    );
  }
}
