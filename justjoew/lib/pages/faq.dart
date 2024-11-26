import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:justjoew/utils/constants/AppStrings.dart';
import 'package:justjoew/mixins/basic_mixin.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/AppTextStyle.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:justjoew/widgets/custom_header.dart';
import 'package:url_launcher/url_launcher.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> with BasicMixin {
  String searchQuery = ""; // To store the search input

  final Map<String, List<Map<String, String>>> faqData = {
    AppStrings.faqCategoryGeneral: AppStrings.faqGeneralQuestions,
    AppStrings.faqCategoryPayment: AppStrings.faqPaymentQuestions,
    AppStrings.faqCategoryDelivery: AppStrings.faqDeliveryQuestions,
    AppStrings.faqCategoryUsageLicensing: AppStrings.faqUsageLicensingQuestions,
    AppStrings.faqCategoryRevisions: AppStrings.faqRevisionsQuestions,
  };

  @override
  Widget body() {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < AppSpacing.smallscreen
        ? screenWidth * 0.08
        : screenWidth * 0.20;

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CustomHeaderLarge(text: AppStrings.faqPageTitle),
            ),
            _buildFaqSection(),
            const SizedBox(height: AppSpacing.xxxl),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqSection() {
    final filteredFaqData = faqData.map((category, faqs) {
      final filteredFaqs = faqs.where((faq) {
        return faq["question"]!.toLowerCase().contains(searchQuery) ||
            faq["answer"]!.toLowerCase().contains(searchQuery);
      }).toList();

      return MapEntry(category, filteredFaqs);
    });

    filteredFaqData.removeWhere((category, faqs) => faqs.isEmpty);

    if (filteredFaqData.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
        child: Center(
          child: Text(
            AppStrings.faqNoResultsMessage,
            style: AppTextStyles.bodyText.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return Column(
      children: filteredFaqData.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.medium),
          child: _buildCategorySection(
            category: entry.key,
            faqs: entry.value,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCategorySection({
    required String category,
    required List<Map<String, String>> faqs,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: AppTextStyles.headingMedium.copyWith(fontSize: 20),
        ),
        Column(
          children: faqs.map((faq) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: _buildCollapsibleQuestionAnswer(
                question: faq["question"]!,
                answer: faq["answer"]!,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCollapsibleQuestionAnswer({
    required String question,
    required String answer,
  }) {
    return ExpansionTile(
      title: Text(
        question,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      iconColor: AppColors.primary,
      collapsedIconColor: AppColors.white,
      leading: const Icon(Icons.question_answer, color: AppColors.white, size: 18),
      children: [
        Align(
          alignment: Alignment.centerLeft, // Ensures left alignment
          child: Padding(
            padding: const EdgeInsets.all(16), // Adjust padding
            child: RichText(
              text: TextSpan(
                style: AppTextStyles.bodyText.copyWith(
                  height: 1.6, // Line height for readability
                ),
                children: _buildAnswerWithLinks(answer),
              ),
            ),
          ),
        ),
      ],
    );
  }



  List<TextSpan> _buildAnswerWithLinks(String answer) {
    final List<TextSpan> spans = [];
    final regex = RegExp(r"\{(.+?)\|(.+?)\}"); // Matches {link_text|url}
    final matches = regex.allMatches(answer);

    int currentIndex = 0;

    for (final match in matches) {
      final linkText = match.group(1)!; // The text to display
      final url = match.group(2)!;      // The URL

      // Add text before the link
      if (match.start > currentIndex) {
        spans.add(TextSpan(
          text: answer.substring(currentIndex, match.start),
          style: AppTextStyles.bodyText,
        ));
      }

      // Add the link
      spans.add(TextSpan(
        text: linkText,
        style: AppTextStyles.bodyTextBold.copyWith(
          color: AppColors.link,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () async {
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
      ));

      currentIndex = match.end;
    }

    // Add remaining text after the last link
    if (currentIndex < answer.length) {
      spans.add(TextSpan(
        text: answer.substring(currentIndex),
        style: AppTextStyles.bodyText,
      ));
    }

    return spans;
  }

}
