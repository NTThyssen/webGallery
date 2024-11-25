import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:justjoew/mixins/SocialMediaBar.dart';
import 'package:justjoew/utils/navigator/navigator.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFooter extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const MyFooter({
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: AppSpacing.small),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor.withOpacity(0.3),
            width: 0.5,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SocialMediaBar(), // Social Media Bar at the top
          const SizedBox(height: AppSpacing.medium), // Add spacing
          _buildFooterLinks(context), // Add footer links
          const SizedBox(height: AppSpacing.small), // Add spacing
        ],
      ),
    );
  }

  // Function to build footer links
  Widget _buildFooterLinks(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: AppSpacing.medium, // Spacing between links
      children: [
        _buildFooterLink(context, "FAQ", AppRoutes.faq),
        _buildFooterLink(context, "Terms & Conditions", AppRoutes.terms),
        _buildFooterLink(context, "Usage License", AppRoutes.usage),
        //_buildFooterLink(context, "Policies", AppRoutes.policies),
        //_buildFooterLink(context, "Will do and Won't do", AppRoutes.willdo),
      ],
    );
  }

  // Function to create individual footer links
  Widget _buildFooterLink(BuildContext context, String text, String route) {
    return GestureDetector(
      onTap: () => context.go(route),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.primary,
            ),
      ),
    );
  }
}
