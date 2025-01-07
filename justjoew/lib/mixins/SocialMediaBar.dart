import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:flutter/services.dart'; // For clipboard functionality
import 'package:url_launcher/url_launcher.dart';

class SocialMediaBar extends StatefulWidget {
  const SocialMediaBar({super.key});

  @override
  _SocialMediaBarState createState() => _SocialMediaBarState();
}

class _SocialMediaBarState extends State<SocialMediaBar> {
  final Map<String, bool> _hoverStates = {
    'twitch': false,
    'discord': false,
    'gmail': false,
    'fiverr': false,
    'instagram': false,
  };
  final GlobalKey _discordTooltipKey = GlobalKey(); // Key for controlling the Tooltip
  String _discordTooltipMessage = AppStrings.discordUserID;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          _buildIconButton(
          FaIcon(
            FontAwesomeIcons.solidEnvelope,
            color: _hoverStates['gmail']! ? Color(0xFF0099E6) : AppColors.icons,
            size: 32,
          ),
          AppStrings.emailUrl,
          'gmail',
        ),
        const SizedBox(width: AppSpacing.small),
        _buildIconButton(
          FaIcon(
            FontAwesomeIcons.instagram,
            color: _hoverStates['instagram']! ? Colors.pink : AppColors.icons,
            size: 32,
          ),
          AppStrings.instagramUrl,
          'instagram',
        ),
        const SizedBox(width: AppSpacing.small),
        _buildDiscordIconButton(), // Discord button with tooltip and copy functionality
        const SizedBox(width: AppSpacing.small),
        _buildIconButton(
          FaIcon(
            FontAwesomeIcons.twitch,
            color: _hoverStates['twitch']! ? Colors.purple : AppColors.icons,
            size: 32,
          ),
          AppStrings.twitchUrl,
          'twitch',
        ),
      ],
    );
  }

Widget _buildDiscordIconButton() {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(const ClipboardData(text: AppStrings.discordUserID));
        setState(() {
          _discordTooltipMessage = "Copied to clipboard!";
        });

        // Show the updated tooltip programmatically
        final dynamic tooltip = _discordTooltipKey.currentState;
        tooltip?.ensureTooltipVisible();

        // Reset tooltip message after a short delay
        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _discordTooltipMessage = AppStrings.discordUserID;
          });
        });
      },
      child: Tooltip(
        key: _discordTooltipKey, // Assign the GlobalKey to the Tooltip
        message: _discordTooltipMessage, // Dynamic tooltip message
        preferBelow: false,
        child: MouseRegion(
          onEnter: (_) => setState(() => _hoverStates['discord'] = true),
          onExit: (_) => setState(() => _hoverStates['discord'] = false),
          child: FaIcon(
            FontAwesomeIcons.discord,
            color: _hoverStates['discord']! ? Colors.blueAccent : AppColors.icons,
            size: 32,
          ),
        ),
      ),
    );
  }

  // Generic icon button for other platforms
  Widget _buildIconButton(Widget icon, String url, String hoverKey) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hoverStates[hoverKey] = true),
      onExit: (_) => setState(() => _hoverStates[hoverKey] = false),
      child: IconButton(
        icon: icon,
        onPressed: () => _launchURL(url),
        padding: const EdgeInsets.all(AppSpacing.small),
      ),
    );
  }

  // Launch URL method
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Could not launch $url',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      );
    }
  }
}
