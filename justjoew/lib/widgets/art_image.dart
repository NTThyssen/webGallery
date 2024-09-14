import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class ArtImage extends StatefulWidget {
  final String path;
  bool isWarterMarked = true;
  ArtImage({super.key, required this.path, this.isWarterMarked = true});

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
        height: 80,
        child: Column(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isHover ? 80 : 70,
            child: PhysicalModel(
              elevation: isHover ? 16 : 0,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: SizedBox(
                  child: Stack(fit: StackFit.passthrough, children: [
                    // Your main content
                    Image.asset(
                      filterQuality: FilterQuality.medium,
                      widget.path,
                      width: AppSpacing.xl,
                      height: AppSpacing.xl,
                      fit: BoxFit.contain,
                    ),
                  ]),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
