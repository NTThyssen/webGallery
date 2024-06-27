import 'package:flutter/material.dart';
import 'package:justjoew/widgets/art_image.dart';

class DesignPage extends StatelessWidget {
  const DesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.70,
        child: Wrap(
          runSpacing: 150,
          spacing: 150,
          children: List.generate(20, (index) {
            return ArtImage(
              path: index % 2 == 0 ? "images/rat1.png" : "images/rat2.png",
            );
          }),
        ) 
        );
  }
}
