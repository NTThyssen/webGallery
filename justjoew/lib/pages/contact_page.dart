import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import for kIsWeb
import 'package:justjoew/constants/costum_colors.dart';
import 'package:justjoew/mixins/scaffoldMixin.dart';
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
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
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
    final horizontalPadding = screenWidth < 600
        ? screenWidth * 0.08 // Less padding for narrow screens (including mobile web)
        : screenWidth * 0.20; // Larger padding for wider screens

    const buttonColor = blueThemePrimary300; // Define the button color
    const snackBarTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'SourceCodePro',
      fontSize: 16,
      color: Colors.black,
    ); // Define the SnackBar text style

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding), // Apply responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: CustomHeaderLarge(text: 'CONTACT'),
            ),
            Column(
              children: [
                const Text(
                  "Hello!\n\n"
                  "If you want to request a commission or have any questions, feel free to reach out through this form or at my email address: \n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'SourceCodePro',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: _launchEmail,
                    child: const Text(
                      "justjoewjoew@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SourceCodePro',
                        fontSize: 18,
                        decoration: TextDecoration.underline, // Underline to indicate a link
                        color: blueThemePrimary,
                        shadows: [
                          Shadow(
                            color: Colors.black, // Specify shadow color and opacity
                            offset: Offset(2, 2), // Specify shadow offset
                            blurRadius: 4, // Specify shadow blur radius
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Text(
                  "\nLet’s create something amazing together!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'SourceCodePro',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SourceCodePro',
                        fontSize: 16,
                        color: blueThemePrimary300,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _firstNameController,
                            decoration: const InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blueThemePrimary900),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blueThemePrimary700),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blueThemePrimary900),
                              ),
                              errorStyle: TextStyle(
                                color: blueThemePrimary, // Set error text color
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                fontFamily: 'SourceCodePro',
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Email Address ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SourceCodePro',
                        fontSize: 16,
                        color: blueThemePrimary300,
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueThemePrimary900),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueThemePrimary700),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueThemePrimary900),
                        ),
                        errorStyle: TextStyle(
                          color: blueThemePrimary, // Set error text color
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'SourceCodePro',
                        ),
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
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Subject ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SourceCodePro',
                        fontSize: 16,
                        color: blueThemePrimary300,
                      ),
                    ),
                    TextFormField(
                      controller: _subjectController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueThemePrimary900),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueThemePrimary700),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueThemePrimary900),
                        ),
                        errorStyle: TextStyle(
                          color: blueThemePrimary, // Set error text color
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'SourceCodePro',
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the subject';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Message ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SourceCodePro',
                        fontSize: 16,
                        color: blueThemePrimary300,
                      ),
                    ),
                    TextFormField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(color: Colors.black),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueThemePrimary900),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueThemePrimary700),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueThemePrimary900),
                        ),
                        errorStyle: TextStyle(
                          color: blueThemePrimary, // Set error text color
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'SourceCodePro',
                        ),
                      ),
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                      style: const TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 36.0),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Process data
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Submitting form',
                                  style: snackBarTextStyle, // Apply custom text style
                                ),
                                backgroundColor: buttonColor, // Set the SnackBar background color to match the button
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blueThemePrimary300, // Light blue button color
                          minimumSize: Size(screenWidth * 0.25, 60), // Responsive width
                          padding: EdgeInsets.zero, // Remove extra padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // Adjust the radius for rounded corners
                          ),
                        ),
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            fontWeight: FontWeight.w600, // Font weight
                            fontFamily: 'SourceCodePro', // Use the Source Pro font
                            fontSize: 18, // Adjust font size as needed
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0), // Adjust bottom space as needed
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

