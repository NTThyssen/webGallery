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
            BlocBuilder<SectionCubit, SectionState>(builder: (context, state) {
              if(state is SectionLoading){
                return Center(
                    child: CircularProgressIndicator()
                  );
              }
              if(state is SectionReady){
                return Column(
                  children: [
                    for (int i = 0; i < state.sectionList.length; i++)
                      ReOrderbleSection(items: state.sectionList[i].assetList, sectionId: state.sectionList[i].id)
                  ],
                );
              }
              return Center(child: Text("NOT POSSIBLe"));
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
}

class ReOrderbleSection extends StatefulWidget {
  List<Asset> items;
  int sectionId;
  ReOrderbleSection({super.key, required this.items, required this.sectionId});

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
    var section_cubit = context.read<SectionCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Scatt Rat"),
        Container(
          width: 800,
          height: 120,
          child: ReorderableListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemExtent: 80,
              
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
                  key: Key('$index'+Random(200).nextInt(200000).toString()),
                  index: index,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child:
                            Image.network(widget.items[index].bloburl, fit: BoxFit.fill,),
                      ),
                    ),
                  )
              ])
        ),
        FloatingActionButton.extended(
          onPressed: () async {
            await _pickFile();
            var bytes = _pickedFile!.bytes;
            section_cubit.createAsset(bytes!.toList(), widget.sectionId);
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
