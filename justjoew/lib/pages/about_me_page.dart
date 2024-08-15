import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:justjoew/mixins/scaffoldMixin.dart';
import 'package:justjoew/widgets/custom_header.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with BasicMixin {
  // Define text content as constants to reduce redundancy
  static const String introText = 
      "Hi there!\n\n"
      "I'm Joe, a digital artist from Denmark. I specialize in custom emotes for Twitch and Discord, blending my background in software engineering with creative expression to bring people's ideas to life.\n\n"
      "There's nothing more rewarding for me than seeing my creations enjoyed and used by others. If you have an idea in mind or just want to learn more about what I can do, feel free to reach out.\n\n"
      "Let’s create something amazing together!";

  static const String aboutMeText = 
      "Originally, I was a traditional artist working with paper. My journey into digital art began when a friend asked if I could help create sprites for a game they were working on. Around the same time, another friend who is a streamer was about to purchase emotes, and I thought, \"Maybe I can do that.\" The result was a hit, and those emotes became wildly popular within his community. This sparked my passion for digital art.\n\n"
      "I have a background as a software engineer, which is my full-time job. I've spent a lot of time specializing in frontend design, UX, and UI, even doing my thesis on UX. This experience greatly influences my approach to digital art, allowing me to blend technical precision with creative expression.\n\n"
      "I specialize in creating emotes for Twitch and Discord, but I also enjoy experimenting with different styles for variety. When starting a new project, I like to understand what the client has in mind and their expectations. We work together to develop a concept and look at any references they might have. I then create rough sketches for approval, and we make adjustments to choose the final direction. I spend a significant amount of time on the base shapes before moving on to coloring, shading, and highlights. The best part is revealing the final result.\n\n"
      "What I love most about my work is seeing ideas come to life, transforming rough sketches into polished pieces. One of my most memorable projects was my first one. I didn't know if I could do it, but I poured my heart into it. The results were fantastic, and their reaction fueled me to keep improving.\n\n"
      "I thrive on feedback and revisions, as they ensure that everyone is happy with the result. I like to share the creative journey with my clients, making them a part of the process. I take pride in my work and want the recipient to take pride in their emotes as well.\n\n"
      "What sets my work apart is my unique personal style and the amount of effort I put into every piece. I don't rush my creations, taking the time needed to make each one special.\n\n"
      "My goals are simple: to continue doing what I love. This isn't about making money but about pursuing a passion. Commissions reflect the value of my art and cover the costs of my tools, but profit is not the focus.\n\n"
      "Thanks for stopping by, and I hope you enjoy my work as much as I enjoy creating it!";

  @override
  Widget body() {
    // Get the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;

    // Define padding values based on the screen width
    EdgeInsetsGeometry padding = screenWidth < 600
        ? const EdgeInsets.symmetric(horizontal: 16.0)
        : const EdgeInsets.symmetric(horizontal: 64.0);

    return Center(
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: CustomHeaderLarge(text: 'ABOUT ME'), // Centered header
            ),
            screenWidth < 600
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        introText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: 'SourceCodePro',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20), // Space between text and image
                      Image.asset(
                        'images/about_round.png',
                        width: kIsWeb ? 135 : 150, // 10% smaller on the web
                      ),
                      const SizedBox(height: 50), // Space before the second paragraph
                      const Text(
                        aboutMeText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: 'SourceCodePro',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 200), // Space after the second paragraph
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            flex: 2,
                            child: Text(
                              introText,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'SourceCodePro',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 50), // Space between text and the image
                          Expanded(
                            child: Image.asset(
                              'images/about_round.png',
                              height: kIsWeb ? 350 : 150, // 10% smaller on the web
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50), // Space before the second paragraph
                      const Text(
                        aboutMeText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: 'SourceCodePro',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 200), // Space after the second paragraph
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
