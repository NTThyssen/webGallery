import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/constants/ImageStrings.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaBar extends StatefulWidget {
  const SocialMediaBar({super.key});

  @override
  _SocialMediaBarState createState() => _SocialMediaBarState();
}

class _SocialMediaBarState extends State<SocialMediaBar> {
  final Map<String, bool> _hoverStates = {
    'twitch': false,
    'gmail': false,
    'fiverr': false,
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /*_buildIconButton(
          Image.asset(
            _hoverStates['fiverr']! ? ImageStrings.fiverGreen : ImageStrings.fiverr,
            width: 32, // Set the image icon size to 32
            height: 32, // Set the image icon size to 32
            fit: BoxFit.contain,
          ),
          AppStrings.fiverrUrl,
          'fiverr',
        ),*/
        const SizedBox(width: AppSpacing.medium), // Add spacing between icons
        _buildIconButton(
          FaIcon(
            FontAwesomeIcons.envelope,
            color: _hoverStates['gmail']! ? Colors.red : AppColors.icons,
            size: 32, // Set the icon size to 32
          ),
          AppStrings.emailUrl,
          'gmail',
        ),
        const SizedBox(width: AppSpacing.medium), // Add spacing between icons
        _buildIconButton(
          FaIcon(
            FontAwesomeIcons.twitch,
            color: _hoverStates['twitch']! ? Colors.purple : AppColors.icons,
            size: 32, // Set the icon size to 32
          ),
          AppStrings.twitchUrl,
          'twitch',
        ),
      ],
    );
  }

  // Function to create icon buttons with hover effects
  Widget _buildIconButton(Widget icon, String url, String hoverKey) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoverStates[hoverKey] = true),
      onExit: (_) => setState(() => _hoverStates[hoverKey] = false),
      child: IconButton(
        icon: icon,
        onPressed: () => _launchURL(url),
        padding: const EdgeInsets.all(AppSpacing.small), // Consistent padding with theme
      ),
    );
  }

  // Function to launch URL when an icon is pressed
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url', style: Theme.of(context).textTheme.labelSmall),
        ),
      );
    }
  }
}
