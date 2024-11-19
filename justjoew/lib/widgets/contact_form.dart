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
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: SelectableText(
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
                  style: Theme.of(context).textTheme.bodySmall,
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
      child: SelectableText(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
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
          borderSide: const BorderSide(color: AppColors.primary200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: const BorderSide(color: AppColors.primary500, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.small),
          borderSide: const BorderSide(color: AppColors.error, width: 2.0),
        ),
        hintStyle:
            Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.primary300),
      ),
    );
  }
}
