import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart'; // Required for clipboard functionality

class SocialMediaBar extends StatefulWidget {
  const SocialMediaBar({super.key});

  @override
  _SocialMediaBarState createState() => _SocialMediaBarState();
}

class _SocialMediaBarState extends State<SocialMediaBar> {
  // Hover states for each icon
  bool _isHoveringTwitch = false;
  bool _isHoveringGmail = false;
  bool _isHoveringFiverr = false;

  final String discordTag = 'justjoew_83703'; // Your Discord tag

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Example custom icon button (Fiverr)
        _buildCustomIconButton(
          _isHoveringFiverr ? 'images/fiverr_green.png' : 'images/fiverr.png',
          'https://fiverr.com/justjoew',
          () => setState(() => _isHoveringFiverr = true),
          () => setState(() => _isHoveringFiverr = false),
        ),
        // Example social media icon buttons
        _buildSocialIconButton(
          FontAwesomeIcons.envelope,
          'mailto:justjoewjoew@gmail.com',
          _isHoveringGmail ? Colors.red : Colors.white,
          () => setState(() => _isHoveringGmail = true),
          () => setState(() => _isHoveringGmail = false),
        ),
        _buildSocialIconButton(
          FontAwesomeIcons.twitch,
          'https://twitch.tv/imjustjoew',
          _isHoveringTwitch ? Colors.purple : Colors.white,
          () => setState(() => _isHoveringTwitch = true),
          () => setState(() => _isHoveringTwitch = false),
        ),
      ],
    );
  }

  // Function to create social media icon buttons with hover effects
  Widget _buildSocialIconButton(
    IconData icon,
    String url,
    Color color,
    VoidCallback onHover,
    VoidCallback onExit,
  ) {
    return MouseRegion(
      onEnter: (_) => onHover(),
      onExit: (_) => onExit(),
      child: IconButton(
        icon: FaIcon(icon, color: color, size: AppSpacing.large),
        onPressed: () => _launchURL(url),
        padding: const EdgeInsets.all(AppSpacing.small),
      ),
    );
  }

  // Function to create custom icon buttons with an image asset
  Widget _buildCustomIconButton(
    String imagePath,
    String url,
    VoidCallback onHover,
    VoidCallback onExit,
  ) {
    return MouseRegion(
      onEnter: (_) => onHover(),
      onExit: (_) => onExit(),
      child: IconButton(
        icon: SizedBox(
          width: AppSpacing.large,
          height: AppSpacing.large,
          child: Image.asset(
            imagePath,
            fit: BoxFit.contain,
          ),
        ),
        onPressed: () => _launchURL(url),
        padding: const EdgeInsets.all(AppSpacing.small),
      ),
    );
  }

  // Function to launch URL when an icon is pressed
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url', style: Theme.of(context).textTheme.labelSmall),
        ),
      );
    }
  }
}
