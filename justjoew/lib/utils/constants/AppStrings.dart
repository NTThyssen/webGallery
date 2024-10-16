class AppStrings {
  // General
  static const String appName = 'JustJoew';
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String submit = 'Submit';
  static const String loading = 'Loading...';
  static const String noDataAvailable = 'No data available at this time.';
  static const String taglineText = "Your digital artist tagline here";


  // Messages
  static const String welcomeMessage = 'Welcome to JustJoeW!';
  static const String errorNetwork = 'Network error, please try again.';
  static const String errorFormValidation = 'Please fill in all required fields.';
  static const String snackbarSuccess = 'Operation completed successfully!';
  static const String snackbarFailure = 'Something went wrong. Please try again.';
  static const String formSubmittingMessage = 'Submitting form';
  static const String welcomeText = 'Welcome to JustJoeW!';
  static const String introductionText = 'Your introduction here...';

  // Form Labels
  static const String nameLabel = 'Name';
  static const String nameHint = 'Please enter your name';
  static const String emailLabel = 'Email Address';
  static const String emailHint = 'Please enter your email address';
  static const String emailValidationError = 'Please enter your email address';
  static const String emailInvalidError = 'Please enter a valid email address';
  static const String subjectLabel = 'Subject';
  static const String subjectHint = 'Please enter the subject';
  static const String messageLabel = 'Message';
  static const String messageHint = 'Please enter your message';
  
  // Buttons
  static const String loginButton = 'Login';
  static const String registerButton = 'Register';
  static const String forgotPasswordButton = 'Forgot Password?';

  // Section Headers
  static const String contactUsHeader = 'Contact Us';
  static const String servicesHeader = 'Our Services';
  static const String commissionsHeader = 'COMMISSIONS';
  static const String portfolio = 'PORTFOLIO';
  static const String aboutMeHeader = 'ABOUT ME';
  static const String contact = 'CONTACT';

  // About Me Page
  static const String backgroundTitle = 'My Background';
  static const String processTitle = 'My Creative Process';
  static const String passionTitle = 'What I Love';
  static const String introText = 
      "I'm Joe!\n\n"
      "A digital artist from Denmark. I create custom emotes for Twitch, blending my background in software engineering with creative expression.\n\n"
      "Seeing my creations bring joy to others is what motivates me the most. If you have a concept in mind or simply want to explore ideas, I'd love to hear from you.\n\n"
     ;
  static const String aboutMeText = 
      "I began my journey as a traditional artist, sketching on paper. My move into digital art was inspired by a friend who needed emotes for his Twitch channel. I decided to give it a try, and to my surprise, the emotes were a hit within his community. This success ignited my passion for digital art, and I've been exploring it ever since.\n\n"
      "I have a background in software engineering and have specialized in frontend design and UX, which greatly influences my approach to art.";
  static const String passionText = 
      "What I love most about my work is seeing ideas come to life. I thrive on transforming rough sketches into polished pieces that people can enjoy and use. One of my most memorable projects was my first one—it was both exciting and nerve-wracking, but the joy it brought to the client pushed me to keep improving.\n\n"
      "Feedback and revisions are a crucial part of my process. I believe in sharing the creative journey with my clients, making them feel involved in crafting something unique and personal. My goal is to produce emotes that both of us can take pride in, with the final result reflecting the effort and care put into its creation.";

  // Creative Process Section
  /*static const String processConsult = 
      "I start by understanding your vision and expectations. This helps me align my designs with your ideas.";
  static const String processConcept = 
      "We brainstorm and develop concepts together, reviewing any references you might have. I value this collaborative stage as it sets the foundation for the final piece.";
  static const String processSketch = 
      "I create rough drafts for approval. We go through a feedback loop to refine the design until you're happy with the direction.";
  static const String processFinalize = 
      "I polish the emote with coloring, shading, and highlights, ensuring it captures the essence of your idea.";
*/

  // Shortened process descriptions
static const String processConsult = "Understanding your vision.";
static const String processConcept = "Developing concepts together.";
static const String processSketch = "Creating drafts and refining.";
static const String processFinalize = "Polishing the final emote.";
static const String combinedProcessDescription = "My process is a collaborative journey from start to finish. I begin by understanding your vision and expectations, aligning my designs with your ideas. Together, we brainstorm and explore concepts, reviewing any references you might have to set a solid foundation. I then create rough sketches for your approval, refining the design through feedback loops until we’re both satisfied with the direction. Once finalized, I bring the emote to life with careful coloring, shading, and highlights, ensuring it captures the essence of your idea. I take pride in every step, making each creation uniquely special.";
/*'''
My creative process is a collaborative journey that involves you every step of the way. We start by understanding your vision and expectations, brainstorm concepts together, create drafts, and refine the design until you're happy. Finally, I polish the emote to capture the essence of your idea.
''';*/


  // Commissions Page
  static const String commissionsSubheader = '(Open)';
  static const String comissionsIntroductionText = 
      "Custom emotes designed to match your channel's and community's personality and style. "
      "Whether you have a clear vision or just a rough idea, we'll work together to bring it to life.";
  static const String emotesTitle = 'Emotes';
  static const String emotesDescription = 
      "Delivery times are set generously to account for life’s demands, but they are usually shorter. "
      "Unless anything else is agreed upon you will get: ";
  static const List<String> emotesDetails = [
    "4 PNG files in sizes (28x28, 56x56, 112x112, 128x128) px",
    "At a 600 dpi resulotion",
  ];
  static const String letscreate = "Let’s create something amazing together!";
  static const String otherRequestsDescription = 
      "Looking for something else? I specialize in emotes, but feel free to reach out and let's have a chat about it.";
  // Commission Packages
  static const String basicPackageTitle = 'Basic';
  static const String basicPackagePrice = '\$10';
  static const String basicPackageDescription = '1 custom static emote, tailored to your specifications.';
  static const String basicPackageDelivery = '5-day delivery';
  static const String basicPackageRevisions = '2 Revisions';
  static const String basicPackageEmotes = '1 emote';

  static const String standardPackageTitle = 'Standard';
  static const String standardPackagePrice = '\$25';
  static const String standardPackageDescription = '3 custom static emotes, tailored to your specifications.';
  static const String standardPackageDelivery = '10-day delivery';
  static const String standardPackageRevisions = '3 Revisions';
  static const String standardPackageEmotes = '3 emotes';

  static const String premiumPackageTitle = 'Premium';
  static const String premiumPackagePrice = '\$40';
  static const String premiumPackageDescription = '6 custom static emotes, tailored to your specifications.';
  static const String premiumPackageDelivery = '14-day delivery';
  static const String premiumPackageRevisions = '4 Revisions';
  static const String premiumPackageEmotes = '6 emotes';

  // License Section
  static const String licenseTitle = 'License / Terms of Use';
  static const String licenseDescription = 
      "By commissioning me, you're purchasing a license to use my emotes/art on your streaming platforms and community chatrooms (e.g., Discord). As the artist, I retain full copyright to the artwork.";
  static const String whatYouCantDoTitle = "What You Can’t Do:";
  static const List<String> whatYouCantDoPoints = [
    "Transform, recolor, or edit the emotes without my consent.",
    "Sell the emotes or use them on merchandise without purchasing commercial rights.",
    "Use the emotes for NFTs or AI art purposes.",
  ];
  static const String whatYouCanDoTitle = "What You Can Do:";
  static const List<String> whatYouCanDoPoints = [
    "Hire an animator to animate the emotes, provided they don’t claim rights to the original artwork.",
    "Commission other artists in the future, but they should not directly replicate my style.",
  ];
  static const String commercialRightsText = 
      "Commercial Rights: If you want to use the emotes for merchandise or need full copyright, we can discuss a commercial rights agreement.";

  // Socials and Links
  static const String fiverrUrl = 'https://fiverr.com/justjoew';
  static const String emailUrl = 'mailto:justjoewjoew@gmail.com';
  static const String email = 'justjoewjoew@gmail.com';
  static const String twitchUrl = 'https://twitch.tv/imjustjoew';
  static const String privacyPolicyLink = 'Privacy Policy';
  static const String termsOfServiceLink = 'Terms of Service';

  // Contact Page
  static const String contactIntroText = "Hello!\n\nIf you want to request a commission or have any questions, feel free to reach out at my email address:\n";
  static const String contactOutroText = "\nLet’s create something amazing together!";
  
  // Emotes Page
  static const String emotesHeader = 'EMOTES';
  static const String scatrattHeader = 'ScatRatt';
  static const String scatrattUrl = 'https://www.twitch.tv/scatratt/about';
  static const String olmaphHeader = 'Olmaph';
  static const String olmaphUrl = 'https://www.twitch.tv/olmaph/about';
}
