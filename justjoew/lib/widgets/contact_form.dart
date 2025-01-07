import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
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

  @override
  Widget build(BuildContext context) {
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
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppStrings.formSubmittingMessage,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    );
                  }
                },
                child: Text(
                AppStrings.submit,
                style: AppTextStyles.buttonText.copyWith(
                  fontSize: 16,
                  color: AppColors.darkGray,
                ),
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.small),
      child: Text(
        label,
        style: AppTextStyles.bodyText,
      ),
    );
  }

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
      decoration: InputDecoration(hintText: hint, ),
      cursorColor: AppColors.white.withOpacity(0.6),
      style: AppTextStyles.bodyText.copyWith(
        color: AppColors.white, // Set the text color here
        fontFamily: 'OpenSans',
      ),
    );
  }
}
