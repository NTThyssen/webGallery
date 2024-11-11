import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:justjoew_admin/cubit/section_cubit.dart';
import 'package:justjoew_admin/mapper/object_mapper.dart';
import 'package:justjoew_admin/utils/constants/AppStrings.dart';
import 'package:justjoew_admin/utils/theme/AppColors.dart';
import 'package:justjoew_admin/utils/theme/AppTextStyle.dart';
import 'package:justjoew_admin/utils/theme/spacing.dart';

class ReOrderableSection extends StatefulWidget {
  final Section section;

  const ReOrderableSection({Key? key, required this.section}) : super(key: key);

  @override
  _ReOrderableSectionState createState() => _ReOrderableSectionState();
}

class _ReOrderableSectionState extends State<ReOrderableSection> {
  PlatformFile? _pickedFile;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _pickedFile = result.files.first;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var sectionCubit = context.read<SectionCubit>();

    return Card(
      color: AppColors.surface,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.small),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section title with cleaner typography
            Text(
              widget.section.name,
              style: AppTextStyles.headingSmall.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: AppSpacing.medium),

            // Reorderable list of images
            SizedBox(
              height: 100,
              child: ReorderableListView.builder(
                scrollDirection: Axis.horizontal,
                onReorder: (oldIndex, newIndex) {
                  setState(() {
                    if (newIndex > widget.section.assetList.length) newIndex--;
                    final item = widget.section.assetList.removeAt(oldIndex);
                    widget.section.assetList.insert(newIndex, item);
                  });
                },
                itemCount: widget.section.assetList.length,
                itemBuilder: (context, index) {
                  final asset = widget.section.assetList[index];
                  return Padding(
                    key: Key(asset.id.toString()),
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSpacing.small),
                      child: Image.network(
                        asset.bloburl,
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: AppSpacing.medium),

            // "Add Asset" button aligned to the right with subtle styling
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.medium, vertical: AppSpacing.small),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.small),
                  ),
                ),
                onPressed: () async {
                  await _pickFile();
                  if (_pickedFile != null) {
                    sectionCubit.createAsset(
                      _pickedFile!.bytes!.toList(),
                      widget.section.id,
                      _pickedFile!.name,
                    );
                  }
                },
                label: Text(
                  AppStrings.addAssetButton,
                  style: AppTextStyles.buttonText.copyWith(
                    fontSize: 16, // Button text should be a bit larger for better readability
                    color: AppColors.darkGray, // White text to contrast the button background
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
