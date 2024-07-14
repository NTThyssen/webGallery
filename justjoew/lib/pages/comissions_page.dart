import 'package:flutter/material.dart';
import 'package:justjoew/mixins/scaffoldMixin.dart';

class CommissionPage extends StatefulWidget {
  const CommissionPage({super.key});

  @override
  State<CommissionPage> createState() => _CommissionPageState();
}

class _CommissionPageState extends State<CommissionPage> with BasicMixin {
  @override
  Widget body() {
    return const Center(
        child: Text(
      "Comissions page",
      style: TextStyle(color: Colors.lightBlue),
    ));
  }
}
