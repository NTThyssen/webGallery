import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:justjoew_admin/utils/constants/AppStrings.dart';
import 'package:justjoew_admin/utils/theme/AppColors.dart';
import 'package:justjoew_admin/utils/theme/AppTextStyle.dart';
import 'package:justjoew_admin/utils/theme/spacing.dart';

class FileUploadWidget extends StatefulWidget {
  const FileUploadWidget({super.key});

  @override
  _FileUploadWidgetState createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  String? _fileName;
  PlatformFile? _pickedFile;
  FilePickerResult? _result;
  bool _isUploading = false; // Tracks upload progress

  Future<void> _pickFile() async {
    _result = await FilePicker.platform.pickFiles();

    if (_result != null) {
      _pickedFile = _result!.files.first;
      setState(() {
        _fileName = _pickedFile!.name;
      });
      _uploadFile();
    }
  }

  Future<void> _uploadFile() async {
    if (_pickedFile != null) {
      setState(() {
        _isUploading = true; // Show spinner when upload starts
      });

      try {
        final html.File file = html.File(_pickedFile!.bytes!, _pickedFile!.name);
        final html.FormData formData = html.FormData();
        formData.appendBlob('file', file, _pickedFile!.name);

        final html.HttpRequest request = html.HttpRequest();
        request.open('POST', 'YOUR_SERVER_UPLOAD_URL');
        request.onLoadEnd.listen((_) {
          setState(() {
            _isUploading = false; // Hide spinner when upload completes
          });
        });
        request.send(formData);
      } catch (e) {
        setState(() {
          _isUploading = false; // Hide spinner on error
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppStrings.snackbarFailure),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _isUploading ? null : _pickFile, // Disable button while uploading
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.large,
              vertical: AppSpacing.medium,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.small),
            ),
          ),
          child: _isUploading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(
                  AppStrings.pickAndUploadFile,
                  style: AppTextStyles.buttonText,
                ),
        ),
        if (_fileName != null)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.medium),
            child: Text(
              '${AppStrings.selectedFile} $_fileName',
              style: AppTextStyles.bodyText,
            ),
          ),
      ],
    );
  }
}
