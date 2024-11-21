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
static const String passionTitle = 'My Passion';
static const String introText = 
    "I'm Joe!\n\n"
    "A digital artist from Denmark. I create custom emotes for Twitch, blending my background in UX design with creative expression. "
    "I love seeing my work light up a chat and bring joy to others.\n\n"
    "When I'm not drawing, gaming, or lurking, I work full-time as a software developer."
   ;

// Background Section
static const String aboutMeText = 
    "I have always loved drawing and sketching on paper. My move into digital art was inspired by a friend who needed emotes for his Twitch channel. I gave it a try, and to my surprise, the emotes were a hit. This experience sparked my passion for digital art, and I’ve been creating ever since.\n\n"
    "I have a degree in software engineering and have studied frontend design and UX. I believe these have had a huge and positive influence on my approach to art and how to best visualize it.";

// Passion Section
static const String passionText = 
    "What I love most about creating emotes is seeing ideas come to life. From rough sketches to finished pieces, the journey brings me so much joy, and I love sharing this process with the people I’m creating for. \n\n" 
    "Creating art is both exciting and nerve-wracking, but the joy it brings others motivates me to keep improving and growing.";
// Creative Process Section
static const String combinedProcessDescription = 
    "From start to finish, it's a shared journey. To begin, I like to understand your vision, making sure my designs align with your expectations. If you have any references, we’ll review them, and together, we’ll work out the concept. Then, I'll sketch the initial designs, and together we'll refine the design based on your feedback, ensuring we're both satisfied. Once the concept and design are clear, I’ll create the final emote.\n\n"
    "Feedback is an important part of my process. Our goal is ensuring the final emote reflects the effort, care, and pride we both put into it, as well as the channel it represents.";

  // Commissions Page
  static const String commissionsSubheader = '(Open)';
  static const String comissionsIntroductionText = 
      "Welcome and hello!\n\n"
      "I'm Joe, and I make custom emotes designed to match you and your channel, whether you have a clear vision or just a rough idea, we can work together to bring it to life. \n\n"
      "If you have a concept in mind or simply want to explore ideas, I'd love to hear from you. \n"
      "If you have any questions or other request than listed here, feel free to reach out."
      ;
  static const String emotesTitle = 'Emotes';
  static const String dets = 'Details';
  static const String emotesDescription = 
      "When you commission me, unless anything else is agreed upon you will get: ";
  static const List<String> emotesDetails = [
      "1 PNG file in sizes 128x128 px",
      "At a 300 dpi resulotion",
  ];
  static const String additional = 
  "When getting the Premium pack, additional emotes can be added for \$5 each. \n"
  "If you want a big change or want a design redone after you approved the sketch, it counts as a new emote."
  //"I do animated emotes as well, upgrading an emote to animation will be additional \$5 for simple animations and "
  ;

  static const String letscreate = "Let’s create something amazing together!";
  static const String otherRequestsDescription = 
      "Looking for something else? I specialize in emotes, but feel free to reach out and let's have a chat about it.";
  // Commission Packages
  static const String basicPackageTitle = 'Basic';
  static const String basicPackagePrice = '\$10';
  static const String basicPackageDescription = '1 custom static emotes.';
  static const String basicPackageDelivery = '5-day delivery';
  static const String basicPackageRevisions = '2 Revisions';
  static const String basicPackageEmotes = '1 emote';

  static const String standardPackageTitle = 'Standard';
  static const String standardPackagePrice = '\$25';
  static const String standardPackageDescription = '3 custom static emotes.';
  static const String standardPackageDelivery = '10-day delivery';
  static const String standardPackageRevisions = '2 Revisions';
  static const String standardPackageEmotes = '3 emotes';

  static const String premiumPackageTitle = 'Premium';
  static const String premiumPackagePrice = '\$45';
  static const String premiumPackageDescription = '6 custom static emotes.';
  static const String premiumPackageDelivery = '14-day delivery';
  static const String premiumPackageRevisions = '4 Revisions';
  static const String premiumPackageEmotes = '6 - emotes';

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
    "Commission other artists in the future, but they may not replicate my style.",
  ];
  static const String commercialRightsText = 
      "Commercial Rights: If you want to use the emotes for merchandise or need full copyright, we can discuss a commercial rights agreement.";

  // Socials and Links
  static const String fiverrUrl = 'https://fiverr.com/justjoew';
  static const String emailUrl = 'mailto:justjoew@outlook.com';
  static const String email = 'justjoew@outlook.com';
  static const String twitchUrl = 'https://twitch.tv/imjustjoew';
  static const String privacyPolicyLink = 'Privacy Policy';
  static const String termsOfServiceLink = 'Terms of Service';

  // Contact Page
  static const String contactIntroText = "Hello!\n\nIf you want to request a commission or have any questions, feel free to reach out to me:\n";
  static const String contactOutroText = "\nLet’s create something amazing together!";
  
  // Emotes Page
  static const String emotesHeader = 'EMOTES';
  static const String scatrattHeader = 'ScatRatt';
  static const String scatrattUrl = 'https://www.twitch.tv/scatratt/about';
  static const String olmaphHeader = 'Olmaph';
  static const String olmaphUrl = 'https://www.twitch.tv/olmaph/about';
  static const String joeHeader = 'JustJoew';
  static const String joeUrl = 'https://www.twitch.tv/imjustjoew/about';
}
