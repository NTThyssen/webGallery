import 'package:flutter/material.dart';
import 'package:justjoew_admin/utils/constants/AppStrings.dart';
import 'package:justjoew_admin/utils/theme/AppColors.dart';
import 'package:justjoew_admin/utils/theme/AppTextStyle.dart';
import 'package:justjoew_admin/cubit/section_cubit.dart';

Future<void> showSectionDialog(BuildContext context, SectionCubit sectionCubit) async {
  final TextEditingController _textFieldController = TextEditingController();

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text(
          AppStrings.addSectionTitle,
          style: AppTextStyles.headingSmall.copyWith(color: AppColors.primary),
        ),
        content: TextField(
          controller: _textFieldController,
          decoration: InputDecoration(
            hintText: AppStrings.sectionTitleHint,
            hintStyle: AppTextStyles.formLabel.copyWith(color: AppColors.textSecondary),
            filled: true,
            fillColor: AppColors.formFill,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.primary300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.primary200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.primary600, width: 2.0),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppStrings.cancel,
              style: AppTextStyles.buttonText.copyWith(color: AppColors.primary600),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              sectionCubit.createSection(_textFieldController.text);
              sectionCubit.getAllSections();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
            ),
            child: Text(
              AppStrings.addSectionButton,
              style: AppTextStyles.buttonText,
            ),
          ),
        ],
      );
    },
  );
}
