import 'package:flutter/material.dart';
import 'package:justjoew_admin/client/grpc_client.dart';

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
        onPressed: () {

        },
        label: Text('Add New Section'),
        icon: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
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
                FloatingActionButton.extended(
                  onPressed: () {
                    GrpcClient().sayHello("futte");
                  },
                  label: Text('Add New Asset'),
                  icon: Icon(Icons.add),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
            Column(
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
            ),
          ],
        ),
      ),
    );
  }
}
