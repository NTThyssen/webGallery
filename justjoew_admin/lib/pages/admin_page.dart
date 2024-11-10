import 'dart:math';
import 'dart:ui';
import 'dart:html' as html;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justjoew_admin/client/grpc_client.dart';
import 'package:justjoew_admin/cubit/section_cubit.dart';
import 'package:justjoew_admin/mapper/object_mapper.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var sectionCubit = context.read<SectionCubit>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _displayTextInputDialog(context);
          await GrpcClient().createSection(_textFieldController.text);
          sectionCubit.getAllSections();
        },
        label: const Text('Add New Section'),
        icon: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<SectionCubit, SectionState>(builder: (context, state) {
              if (state is SectionLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SectionReady) {
                return Column(
                  children: [
                    for (int i = 0; i < state.sectionList.length; i++)
                      ReOrderbleSection(section: state.sectionList[i])
                  ],
                );
              }
              return const Center(child: Text("NOT POSSIBLe"));
            }),
            /* Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Scatt Rat"),
                Container(
                  width: 800,
                  height: 50,
                  child: ReorderableListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      buildDefaultDragHandles: false,
                      onReorder: (oldIndex, newindex) {
                        setState(() {
                          if (newindex == items.length) {
                            newindex = newindex - 1;
                          }
                          var el = items[oldIndex];
                          items.removeAt(oldIndex);
                          items.insert(newindex, el);
                        });
                      },
                      children: [
                        for (int index = 0; index < items.length; index++)
                          ReorderableDragStartListener(
                              key: Key('$index'),
                              index: index,
                              child: Center(
                                child: Container(
                                  child: items[index],
                                ),
                              )),
                      ]),
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Title of section'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

class ReOrderbleSection extends StatefulWidget {
  Section section;
  ReOrderbleSection({super.key, required this.section});

  @override
  State<ReOrderbleSection> createState() => _ReOrderbleSectionState();
}

class _ReOrderbleSectionState extends State<ReOrderbleSection> {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    var sectionCubit = context.read<SectionCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.section.name),
        SizedBox(
            width: 800,
            height: 120,
            child: ReorderableListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemExtent: 80,
                buildDefaultDragHandles: false,
                onReorder: (oldIndex, newindex) {
                  setState(() {
                    if (newindex == widget.section.assetList.length) {
                      newindex = newindex - 1;
                    }
                    var el = widget.section.assetList[oldIndex];
                    widget.section.assetList.removeAt(oldIndex);
                    widget.section.assetList.insert(newindex, el);
                  });
                },
                children: [
                  for (int index = 0;
                      index < widget.section.assetList.length;
                      index++)
                    ReorderableDragStartListener(
                      key: Key(
                          '$index${Random(200).nextInt(200000)}'),
                      index: index,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Image.network(
                            widget.section.assetList[index].bloburl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                ])),
        FloatingActionButton.extended(
          onPressed: () async {
            await _pickFile();
            var bytes = _pickedFile!.bytes;
            
            sectionCubit.createAsset(bytes!.toList(), widget.section.id, _pickedFile!.name);
          },
          label: const Text('Add New Asset'),
          icon: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 50,
        )
      ],
    );
  }
}
