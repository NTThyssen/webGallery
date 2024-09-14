import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import for kIsWeb
import 'package:justjoew/constants/costum_colors.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher.dart'; // Import for url_launcher

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
      query: 'subject=Hello', // Optional: you can add a default subject
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

    // Define padding values for narrow and wide screens
    final horizontalPadding = screenWidth < AppSpacing.smallscreen
        ? screenWidth * 0.08 // Less padding for narrow screens (including mobile web)
        : screenWidth * 0.20; // Larger padding for wider screens

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding), // Apply responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.large),
            const Center(
              child: CustomHeaderLarge(text: 'CONTACT'),
            ),
            Column(
              children: [
                Text(
                  "Hello!\n\n"
                  "If you want to request a commission or have any questions, feel free to reach out through this form or at my email address: \n",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium, // Using paragraph style
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _launchEmail,
                    child: Text(
                      "justjoewjoew@gmail.com",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelMedium, // Using link style
                    ),
                  ),
                ),
                Text(
                  "\nLet’s create something amazing together!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium, // Using paragraph style
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: Appspacing.small),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: Theme.of(context).textTheme.bodySmall, // Using form label style
                    ),
                    TextFormField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSpacing.medium),
                    Text(
                      'Email Address',
                      style: Theme.of(context).textTheme.bodySmall, // Using form label style
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                      ),
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
                    Text(
                      'Subject',
                      style: Theme.of(context).textTheme.bodySmall, // Using form label style
                    ),
                    TextFormField(
                      controller: _subjectController,
                      decoration: const InputDecoration(
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the subject';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSpacing.medium),
                    Text(
                      'Message',
                      style: Theme.of(context).textTheme.bodySmall, // Using form label style
                    ),
                    TextFormField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSpacing.large),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process data
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Submitting form',
                                  style: Theme.of(context).textTheme.labelSmall, // Using snackbar text style
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          'SUBMIT',
                          style: Theme.of(context).elevatedButtonTheme.style?.textStyle?.resolve({}), // Explicit button text style
                        ),
                      ),
                    ),
                    const SizedBox(height:AppSpacing.xl),
                  ],
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
