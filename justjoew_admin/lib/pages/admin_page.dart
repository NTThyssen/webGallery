import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justjoew_admin/utils/constants/AppStrings.dart';
import 'package:justjoew_admin/utils/theme/AppColors.dart';
import 'package:justjoew_admin/utils/theme/AppTextStyle.dart';
import 'package:justjoew_admin/utils/theme/spacing.dart';
import 'package:justjoew_admin/widgets/custom_header.dart';
import 'package:justjoew_admin/widgets/reorderable_section.dart';
import 'package:justjoew_admin/widgets/section_dialog.dart';
import 'package:justjoew_admin/cubit/section_cubit.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sectionCubit = context.read<SectionCubit>();

    final screenWidth = MediaQuery.of(context).size.width;

    // Define padding values for different screen sizes
    final horizontalPadding = screenWidth < AppSpacing.smallscreen
        ? screenWidth * 0.08
        : screenWidth * 0.20;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName, // Display the app name as the title
          style: AppTextStyles.pagetitle,
        ),
        
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 1.0,
      ),
      backgroundColor: AppColors.background,
      body: Stack(
        children: [          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CustomHeaderLarge(text: 'UPLOADS'),
                  ),
                  BlocBuilder<SectionCubit, SectionState>(
                    builder: (context, state) {
                      if (state is SectionLoading) {
                        return const Center(
                          child: CircularProgressIndicator(color: AppColors.primary),
                        );
                      }
                      if (state is SectionReady) {
                        return Column(
                          children: List.generate(
                            state.sectionList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
                              child: ReOrderableSection(section: state.sectionList[index]),
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          AppStrings.noDataAvailable,
                          style: AppTextStyles.bodyText.copyWith(color: AppColors.textSecondary),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.xxl), 

                ],
              ),
            ),
          ),
          Positioned(
            bottom: AppSpacing.large, // Position at the bottom right
            right: AppSpacing.xxl,
            child: ElevatedButton.icon(
              onPressed: () async {
                await showSectionDialog(context, sectionCubit);
              },
              label: Text(
                AppStrings.addNewSection,
                style: AppTextStyles.buttonText.copyWith(
                  fontSize: 16, // Button text should be a bit larger for better readability
                  color: AppColors.darkGray, // White text to contrast the button background
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.large, vertical: AppSpacing.medium*1.25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSpacing.small),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
