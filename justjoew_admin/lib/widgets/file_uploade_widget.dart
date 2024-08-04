import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class FileUploadWidget extends StatefulWidget {
  @override
  _FileUploadWidgetState createState() => _FileUploadWidgetState();
}

class _FileUploadWidgetState extends State<FileUploadWidget> {
  String? _fileName;
  PlatformFile? _pickedFile;
  FilePickerResult? _result;

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

  void _uploadFile() {
    if (_pickedFile != null) {
      final html.File file = html.File(_pickedFile!.bytes!, _pickedFile!.name);
      final html.FormData formData = html.FormData();
      formData.appendBlob('file', file, _pickedFile!.name);

      final html.HttpRequest request = html.HttpRequest();
      request.open('POST', 'YOUR_SERVER_UPLOAD_URL');
      request.send(formData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _pickFile,
          child: Text('Pick and Upload File'),
        ),
        if (_fileName != null) Text('Selected file: $_fileName'),
      ],
    );
  }
}
