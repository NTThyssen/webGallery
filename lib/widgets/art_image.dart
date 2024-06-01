import 'package:flutter/material.dart';

class ArtImage extends StatefulWidget {
  final String path;
  const ArtImage({super.key, required this.path});

  @override
  State<ArtImage> createState() => _ArtImageState();
}

class _ArtImageState extends State<ArtImage> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      child: SizedBox(
        height: 220,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isHover ? 220 : 200,
              child: PhysicalModel(
                elevation: isHover ? 16 : 0,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    widget.path,
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
