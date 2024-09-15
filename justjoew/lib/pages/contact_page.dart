import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:justjoew/constants/costum_colors.dart';
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
      path: 'justjoewjoew@gmail.com',
      query: 'subject=Hello', // Optional default subject
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
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
            const SizedBox(height: AppSpacing.large),
            const Center(
              child: CustomHeaderLarge(text: 'CONTACT'),
            ),
            const SizedBox(height: AppSpacing.large),
            _buildContactInfoSection(),
            const SizedBox(height: AppSpacing.xl),
            // Uncomment the following section when you want to include the contact form
            
            //_buildContactForm(),
            
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
          "Hello!\n\n"
          "If you want to request a commission or have any questions, feel free to reach out through this form or at my email address:\n",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: _launchEmail,
            child: Text(
              "justjoewjoew@gmail.com",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
        Text(
          "\nLet’s create something amazing together!",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  // Contact form section (currently commented out)
  Widget _buildContactForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormLabel('Name'),
          _buildTextFormField(
            controller: _firstNameController,
            hint: 'Please enter your name',
          ),
          const SizedBox(height: AppSpacing.medium),
          _buildFormLabel('Email Address'),
          _buildTextFormField(
            controller: _emailController,
            hint: 'Please enter your email address',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.medium),
          _buildFormLabel('Subject'),
          _buildTextFormField(
            controller: _subjectController,
            hint: 'Please enter the subject',
          ),
          const SizedBox(height: AppSpacing.medium),
          _buildFormLabel('Message'),
          _buildTextFormField(
            controller: _messageController,
            hint: 'Please enter your message',
            maxLines: 5,
          ),
          const SizedBox(height: AppSpacing.large),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Submitting form',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'SUBMIT',
                 style: Theme.of(context).elevatedButtonTheme.style?.textStyle?.resolve({}),
               ) // Explicit button text style
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
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
