import 'dart:ui';
import 'dart:html' as html;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:justjoew_admin/client/grpc_client.dart';
import 'package:justjoew_admin/mapper/object_mapper.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final items = <Container>[
    Container(
      key: Key("1"),
      child: Text("item1"),
    ),
    Container(
      key: Key("2"),
      child: Text("item2"),
    ),
    Container(
      key: Key("3"),
      child: Text("item3"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await new GrpcClient().createSection("ScattRat");
        },
        label: Text('Add New Section'),
        icon: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: new GrpcClient().getAllSections(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Text("ERROR LOADING SECTIONS"),
                  );
                }
                return Column(
                  children: [
                    for (int i = 0; i < snapshot.data!.length; i++)
                      ReOrderbleSection(items: snapshot.data![i].assetList)
                  ],
                );
              },
            )
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
}

class ReOrderbleSection extends StatefulWidget {
  List<Asset> items;

  ReOrderbleSection({super.key, required this.items});

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
    return Column(
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
                  if (newindex == widget.items.length) {
                    newindex = newindex - 1;
                  }
                  var el = widget.items[oldIndex];
                  widget.items.removeAt(oldIndex);
                  widget.items.insert(newindex, el);
                });
              },
              children: [
                for (int index = 0; index < widget.items.length; index++)
                  ReorderableDragStartListener(
                      key: Key('$index'),
                      index: index,
                      child: Center(
                        child: Container(
                          child:
                              Text(widget.items[index].sectionName + "$index"),
                        ),
                      )),
              ]),
        ),
        FloatingActionButton.extended(
          onPressed: () async {
            await _pickFile();
            var bytes = _pickedFile!.bytes;
            await GrpcClient().createAsset(bytes!.toList(), 1);
          },
          label: Text('Add New Asset'),
          icon: Icon(Icons.add),
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
