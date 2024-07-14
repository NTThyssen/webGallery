import 'package:flutter/material.dart';
import 'package:justjoew/mixins/scaffoldMixin.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with BasicMixin {
  @override
  @override
  Widget body() {
    return const Center(
      child: Text(
        "contact page",
        style: TextStyle(
          color: Colors.lightBlue,
        ),
      ),
    );
  }
}
