import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/AppColors.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class CommissionPackage extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String deliveryTime;
  final String revisions;
  final String emotes;

  const CommissionPackage({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.deliveryTime,
    required this.revisions,
    required this.emotes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.large),
      decoration: BoxDecoration(
        color: AppColors.packageBackground.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5), // Soft shadow effect
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
               SelectableText(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600, // Emphasize the package title
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.small),
               SelectableText(
                  price,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600, // Emphasize the package title
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.medium),
          /*Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.4, // Improve readability with line height
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: AppSpacing.medium),*/
          Divider(
            color: Theme.of(context).dividerTheme.color,
            thickness: Theme.of(context).dividerTheme.thickness,
          ),
          const SizedBox(height: AppSpacing.medium),
          
          _buildIconTextRow(context, Icons.check, emotes),
          const SizedBox(height: AppSpacing.small),
          _buildIconTextRow(context, Icons.access_time, deliveryTime),
          const SizedBox(height: AppSpacing.small),
          _buildIconTextRow(context, Icons.replay, revisions),
          
        ],
      ),
    );
  }

  Widget _buildIconTextRow(BuildContext context, IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.commissionIcons, size: 20),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child:SelectableText(
            text,
            style: Theme.of(context).textTheme.bodyMedium
          ),
        ),
      ],
    );
  }
}
