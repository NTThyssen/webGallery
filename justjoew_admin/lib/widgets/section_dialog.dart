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
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(
          AppStrings.addSectionTitle,
          style: AppTextStyles.headingSmall
        ),
        content: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: AppStrings.sectionTitleHint,
              hintStyle: AppTextStyles.formLabel.copyWith(color: AppColors.darkGray),
              filled: true,
              fillColor: AppColors.darkGray,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
            style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
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
