import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> with BasicMixin {
  static const String introText = 
      "Hi there!\n\n"
      "I'm Joe, a digital artist from Denmark. I specialize in custom emotes for Twitch and Discord, blending my background in software engineering with creative expression.\n\n"
      "Seeing my creations bring joy to others is what motivates me the most. If you have a concept in mind or simply want to explore ideas, I'd love to hear from you.\n\n"
      "Let’s create something amazing together!";

  static const String aboutMeText = 
      "I began my journey as a traditional artist, sketching on paper. My move into digital art was inspired by a friend who needed emotes for his Twitch channel. I decided to give it a try, and to my surprise, the emotes were a hit within his community. This success ignited my passion for digital art, and I've been exploring it ever since.\n\n"
      "I have a background in software engineering and have specialized in frontend design and UX, which greatly influences my approach to art.";

  static const String processText = 
      "My creative process involves a lot of collaboration. Here's how I work:\n"
      "• **Consult:** I start by understanding your vision and expectations. This helps me align my designs with your ideas.\n"
      "• **Concept:** Next, we brainstorm and develop concepts together, reviewing any references you might have. I value this collaborative stage as it sets the foundation for the final piece.\n"
      "• **Sketch:** I create rough drafts for approval. We go through a feedback loop to refine the design until you're happy with the direction.\n"
      "• **Finalize:** Finally, I polish the emote with coloring, shading, and highlights, ensuring it captures the essence of your idea.";

  static const String passionText = 
      "What I love most about my work is seeing ideas come to life. I thrive on transforming rough sketches into polished pieces that people can enjoy and use. One of my most memorable projects was my first one—it was both exciting and nerve-wracking, but the joy it brought to the client pushed me to keep improving.\n\n"
      "Feedback and revisions are a crucial part of my process. I believe in sharing the creative journey with my clients, making them feel involved in crafting something unique and personal. My goal is to produce emotes that both of us can take pride in, with the final result reflecting the effort and care put into its creation.";

  @override
  Widget body() {
    double screenWidth = MediaQuery.of(context).size.width;

    // Use the provided horizontal padding logic
    final horizontalPadding = screenWidth < AppSpacing.smallscreen
        ? screenWidth * 0.08
        : screenWidth * 0.20;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppSpacing.large),
            const Center(child: CustomHeaderLarge(text: 'ABOUT ME')),
            const SizedBox(height: AppSpacing.large),
            
            // Introduction Section
            const SizedBox(height: AppSpacing.medium),
            _buildIntroSection(screenWidth),
            
            // About Me Section
            const SizedBox(height: AppSpacing.xl),
            _buildSectionTitle('My Background'),
            const SizedBox(height: AppSpacing.medium),
            _buildTextSection(aboutMeText),
            
            // Process Section
            const SizedBox(height: AppSpacing.xl),
            _buildSectionTitle('My Creative Process'),
            const SizedBox(height: AppSpacing.medium),
            _buildProcessSection(),
            
            // Passion Section
            const SizedBox(height: AppSpacing.xl),
            _buildSectionTitle('What I Love'),
            const SizedBox(height: AppSpacing.medium),
            _buildTextSection(passionText),
            
            const SizedBox(height: AppSpacing.xxxl),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection(double screenWidth) {
    if (screenWidth < AppSpacing.smallscreen) {
      // Vertical layout for smaller screens
      return Column(
        children: [
          _buildTextSection(introText),
          const SizedBox(height: AppSpacing.large),
          _buildCenteredImage('images/joepfpsmoll.png', screenWidth),
        ],
      );
    } else {
      // Horizontal layout for larger screens
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: _buildTextSection(introText),
          ),
          const SizedBox(width: AppSpacing.xl),
          Expanded(
            child: _buildCenteredImage('images/joepfpsmoll.png', screenWidth),
          ),
        ],
      );
    }
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }

  Widget _buildTextSection(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
    );
  }

  Widget _buildProcessSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I love creating emotes for Twitch and experimenting with different styles. Here's my process:",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
        ),
        const SizedBox(height: AppSpacing.medium),
        _buildBulletPoint('Consult', 'I start by understanding your vision and expectations. This helps me align my designs with your ideas.'),
        _buildBulletPoint('Concept', 'We brainstorm and develop concepts together, reviewing any references you might have.'),
        _buildBulletPoint('Sketch', 'I create rough drafts for approval. We go through a feedback loop to refine the design until you\'re happy.'),
        _buildBulletPoint('Finalize', 'I polish the emote with coloring, shading, and highlights, ensuring it captures the essence of your idea.'),
      ],
    );
  }

  Widget _buildBulletPoint(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 1.5),
                children: [
                  TextSpan(
                    text: '$title: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: description,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenteredImage(String imagePath, double screenWidth) {
    double imageSize = screenWidth < AppSpacing.smallscreen ? 135 : 250;
    return Image.asset(
      imagePath,
      filterQuality: FilterQuality.high,
      width: imageSize,
    );
  }
}
