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

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    var sectionCubit = context.read<SectionCubit>();

    final screenWidth = MediaQuery.of(context).size.width;

    // Define padding values for different screen sizes
    final horizontalPadding = screenWidth < AppSpacing.smallscreen
        ? screenWidth * 0.08
        : screenWidth * 0.20;
    final ScrollController _scrollController = ScrollController();
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
                    builder: (blocontext, state) {
                      if (state is SectionLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                              color: AppColors.primary),
                        );
                      }
                      if (state is SectionReady) {
                        if (state.sectionList.isEmpty) {
                          return Center(
                            child: Text(
                              AppStrings.noDataAvailable,
                              style: AppTextStyles.bodyText
                                  .copyWith(color: AppColors.textSecondary),
                            ),
                          );
                        }
                        return ReorderableListView.builder(
                          scrollController: _scrollController,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ReorderableDragStartListener(
                              key: Key(state.sectionList[index].id.toString()),
                              index: index,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSpacing.small),
                                child: ReOrderableSection(
                                  section: state.sectionList[index],
                                  cubitContext: blocontext,
                                ),
                              ),
                            );
                          },
                          itemCount: state.sectionList.length,
                          onReorder: (oldIndex, newIndex) {
              
                              if(newIndex > oldIndex){
                                if (newIndex != 0) newIndex--;
                              }
                               sectionCubit.updateSectionOrder(
                                  state.sectionList[oldIndex].id, newIndex);
                              sectionCubit.updateSectionOrder(
                                  state.sectionList[newIndex].id, oldIndex);
                            


                          },
                        ); /*List.generate(
                            state.sectionList.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
                              child: ReOrderableSection(section: state.sectionList[index]),
                            ),
                          ),*/
                      }
                      if (state is SectionError) {
                        return Center(
                          child: Text(
                            AppStrings.errorLoadingData,
                            style: AppTextStyles.bodyText
                                .copyWith(color: AppColors.error),
                          ),
                        );
                      }
                      return const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.primary),
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
                showDialog(
                  context: context,
                  barrierDismissible: false, // Prevent dismissing the dialog
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  ),
                );

                try {
                  await showSectionDialog(context, sectionCubit);
                } catch (e) {
                  // Handle errors appropriately
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppStrings.errorAddingSection)),
                  );
                } finally {
                  Navigator.of(context).pop(); // Close the spinner dialog
                }
              },
              label: Text(
                AppStrings.addNewSection,
                style: AppTextStyles.buttonText.copyWith(
                  fontSize:
                      16, // Button text should be a bit larger for better readability
                  color: AppColors
                      .darkGray, // White text to contrast the button background
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.large,
                    vertical: AppSpacing.medium * 1.25),
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
