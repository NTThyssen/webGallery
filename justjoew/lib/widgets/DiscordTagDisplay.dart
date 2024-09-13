import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Required for clipboard functionality

class DiscordTagDisplay extends StatefulWidget {
  @override
  _DiscordTagDisplayState createState() => _DiscordTagDisplayState();
}

class _DiscordTagDisplayState extends State<DiscordTagDisplay> {
  // Your Discord tag
  final String discordTag = 'justjoew_83703'; // Replace with your actual Discord tag

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Clipboard.setData(ClipboardData(text: discordTag));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Discord tag copied to clipboard!'),
                duration: Duration(seconds: 2),
              ),
            );
          },
          child: Row(
            children: [
              FaIcon(FontAwesomeIcons.discord, color: Colors.blue, size: 32), // Discord icon
              const SizedBox(width: 8),
              Text(
                discordTag, // Display the Discord tag
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.underline, // Optional underline for style
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
