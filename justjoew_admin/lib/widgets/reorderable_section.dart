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
  final BuildContext cubitContext;

  const ReOrderableSection(
      {Key? key, required this.section, required this.cubitContext})
      : super(key: key);

  @override
  _ReOrderableSectionState createState() => _ReOrderableSectionState();
}

class _ReOrderableSectionState extends State<ReOrderableSection> {
  PlatformFile? _pickedFile;
  int? _hoveredIndex;
  final ScrollController _scrollController = ScrollController();

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _pickedFile = result.files.first;
      });
    }
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _showRenameDialog(BuildContext context) {
    final TextEditingController nameController =
        TextEditingController(text: widget.section.name);
    //final TextEditingController urlController = TextEditingController(text: widget.section.url);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          title: Text(
            'Rename Section',
            style: AppTextStyles.headingSmall,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter Title',
                    hintStyle: AppTextStyles.formLabel
                        .copyWith(color: AppColors.primary600),
                    filled: true,
                    fillColor: AppColors.darkGray,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 14.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style:
                      AppTextStyles.bodyText.copyWith(color: AppColors.white),
                ),
              ),
              TextField(
                //controller: urlController,
                decoration: InputDecoration(
                  hintText: 'Enter URL',
                  hintStyle: AppTextStyles.formLabel
                      .copyWith(color: AppColors.primary600),
                  filled: true,
                  fillColor: AppColors.darkGray,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 14.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: AppTextStyles.bodyText.copyWith(color: AppColors.white),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: AppTextStyles.buttonText
                    .copyWith(color: AppColors.primary600),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Update the section name and URL in the cubit
                // context.read<SectionCubit>().renameSection(widget.section.id, nameController.text, urlController.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
              ),
              child: Text(
                'Rename',
                style: AppTextStyles.buttonText,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var sectionCubit = widget.cubitContext.read<SectionCubit>();

    return Card(
      color: AppColors.surface,
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.medium),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.small),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header with title and actions in popup menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.section.name,
                  style: AppTextStyles.headingSmall
                      .copyWith(color: AppColors.primary),
                ),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'Rename':
                        _showRenameDialog(context);
                        break;
                      case 'Delete':
                        // sectionCubit.deleteSection(widget.section.id);
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'Rename',
                      child: Text(
                        'Rename Section',
                        style: AppTextStyles.bodyText
                            .copyWith(color: AppColors.primary),
                      ),
                    ),
                    PopupMenuItem(
                      value: 'Delete',
                      child: Text(
                        'Delete Section',
                        style: AppTextStyles.bodyText
                            .copyWith(color: Color.fromARGB(255, 229, 65, 62)),
                      ),
                      onTap: () {
                        sectionCubit.deleteSection(widget.section.id);
                      },
                    ),
                  ],
                  color: AppColors.darkGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  icon: Icon(Icons.more_vert, color: AppColors.white),
                )
              ],
            ),
            const SizedBox(height: AppSpacing.medium),

            // Scrollable ReorderableListView with left and right scroll buttons
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left, color: AppColors.white),
                  onPressed: _scrollLeft,
                ),
                Expanded(
                  child: SizedBox(
                    height: 130,
                    child: ReorderableListView.builder(
                      scrollController: _scrollController,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      onReorder: (oldIndex, newIndex) {
                        if (newIndex != 0) newIndex--;

                        sectionCubit.updateAssetOrder(
                            widget.section.assetList[oldIndex].id, newIndex);
                        sectionCubit.updateAssetOrder(
                            widget.section.assetList[newIndex].id, oldIndex);
                      },
                      buildDefaultDragHandles: false,
                      proxyDecorator: (Widget child, int index,
                          Animation<double> animation) {
                        return Material(
                          color: Color.fromARGB(20, 0, 0, 0),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: child,
                          ),
                        );
                      },
                      itemCount: widget.section.assetList.length,
                      itemBuilder: (context, index) {
                        final asset = widget.section.assetList[index];
                        return ReorderableDragStartListener(
                          key: Key(asset.id.toString()),
                          index: index,
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _hoveredIndex = index;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _hoveredIndex = null;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(AppSpacing.small),
                                  child: Padding(
                                    padding: AppSpacing.paddingMedium,
                                    child: Container(
                                      child: Image.network(
                                        widget.section.assetList[index].bloburl,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                // Show delete icon only on hover
                                if (_hoveredIndex == index)
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Color.fromARGB(255, 255, 4, 0),
                                        size: 28,
                                      ),
                                      onPressed: () {
                                        sectionCubit.deleteAsset(
                                            widget.section.assetList[index].id);
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right, color: AppColors.white),
                  onPressed: _scrollRight,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.medium),

            // "Add Asset" button aligned to the right
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.medium,
                      vertical: AppSpacing.small),
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
                  style: AppTextStyles.buttonText
                      .copyWith(color: AppColors.darkGray),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
