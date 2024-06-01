import 'package:flutter/material.dart';
import 'package:web_gallery/widgets/art_image.dart';

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
        ) /*GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 200 / 150, // aspect ratio of the items
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ArtImage(
            path: index % 2 == 0 ? "images/rat1.png" : "images/rat2.png",
          );
        },
      ),*/
        );
  }
}
