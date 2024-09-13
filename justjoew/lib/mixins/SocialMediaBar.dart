import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart'; // Required for clipboard functionality


class SocialMediaBar extends StatefulWidget {
  @override
  _SocialMediaBarState createState() => _SocialMediaBarState();
}

class _SocialMediaBarState extends State<SocialMediaBar> {
  // Store hover states for each icon
  bool _isHoveringTwitter = false;
  bool _isHoveringTwitch = false;
  bool _isHoveringYouTube = false;
  bool _isHoveringInstagram = false;
  bool _isHoveringLink = false;
  bool _isHoveringFiverr = false;
  bool _isHoveringEtsy = false;
  bool _isHoveringDiscord = false;
  bool _isHoveringGmail = false;

  final String discordTag = 'justjoew_83703'; // Replace with your actual Discord tag


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the icons
      children: [
        // Discord icon button with hover effect and clipboard functionality
        /*MouseRegion(
          onEnter: (_) => setState(() => _isHoveringDiscord = true),
          onExit: (_) => setState(() => _isHoveringDiscord = false),
          child: GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: discordTag));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Discord tag copied to clipboard!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: Column(
              children: [
                // Discord icon
                FaIcon(
                  FontAwesomeIcons.discord,
                  color: _isHoveringDiscord ? Colors.blue : Colors.white, // Color changes on hover
                  size: 32,
                ),
              ],
            ),
          ),
        ),*/
        _buildCustomIconButton(
          _isHoveringFiverr ? 'images/fiverr_green.png' : 'images/fiverr.png', 
          'https://fiverr.com/justjoew', 
          () => setState(() => _isHoveringFiverr = true), 
          () => setState(() => _isHoveringFiverr = false)
        ),
        _buildSocialIconButton(
          FontAwesomeIcons.twitch, 
          'https://twitch.tv/imjustjoew', 
          _isHoveringTwitch ? Colors.purple : Colors.white, 
          () => setState(() => _isHoveringTwitch = true), 
          () => setState(() => _isHoveringTwitch = false),
        ),
        _buildSocialIconButton(
          FontAwesomeIcons.envelope, // Gmail icon (envelope icon)
          'mailto:justjoewjoew@gmail.com', // Replace with your Gmail address
          _isHoveringGmail ? Colors.red : Colors.white, // Hover effect
          () => setState(() => _isHoveringGmail = true), 
          () => setState(() => _isHoveringGmail = false),
        ),
        /*
        _buildSocialIconButton(
          FontAwesomeIcons.youtube, 
          'https://youtube.com/justjoewjoew', 
          _isHoveringYouTube ? Colors.red : Colors.white, 
          () => setState(() => _isHoveringYouTube = true), 
          () => setState(() => _isHoveringYouTube = false),
        ),
        _buildSocialIconButton(
          FontAwesomeIcons.instagram, 
          'https://instagram.com/yourprofile', 
          _isHoveringInstagram ? Colors.pink : Colors.white, 
          () => setState(() => _isHoveringInstagram = true), 
          () => setState(() => _isHoveringInstagram = false),
        ),
        _buildSocialIconButton(
          FontAwesomeIcons.etsy, 
          'https://etsy.com/shop/yourprofile', 
          _isHoveringEtsy ? Colors.orange : Colors.white, 
          () => setState(() => _isHoveringEtsy = true), 
          () => setState(() => _isHoveringEtsy = false),
        ),*/
      ],
    );
  }

  // Function to create each social media icon button with hover effect
  Widget _buildSocialIconButton(
    IconData icon, 
    String url, 
    Color color, 
    VoidCallback onHover, 
    VoidCallback onExit
  ) {
    return MouseRegion(
      onEnter: (_) => onHover(),
      onExit: (_) => onExit(),
      child: IconButton(
        icon: FaIcon(icon, color: color, size: 32), // Social media icon
        onPressed: () => _launchURL(url),
        padding: const EdgeInsets.all(8.0), // Space around the icon
      ),
    );
  }

// Function to create a custom icon button with a properly sized image
Widget _buildCustomIconButton(
  String imagePath, 
  String url, 
  VoidCallback onHover, 
  VoidCallback onExit
) {
  return MouseRegion(
    onEnter: (_) => onHover(),
    onExit: (_) => onExit(),
    child: IconButton(
      icon: SizedBox(
        width: 38, // Set the desired width
        height: 38, // Set the desired height
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain, // Ensures the image fits within the box
        ),
      ),
      onPressed: () => _launchURL(url),
      padding: const EdgeInsets.all(8.0),
    ),
  );
}


  // Function to launch URL when the icon is pressed
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
