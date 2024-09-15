import 'package:flutter/material.dart';
import 'package:justjoew/utils/theme/spacing.dart';

class ArtImage extends StatefulWidget {
  final String path;
  final bool isWaterMarked; // Corrected the spelling and made it final.

  const ArtImage({
    super.key,
    required this.path,
    this.isWaterMarked = false,
  });

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
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isHover ? 80 : 70,
              child: PhysicalModel(
                elevation: isHover ? 16 : 0,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Stack(
                    children: [
                      // Main image content
                      Image.asset(
                        widget.path,
                        width: AppSpacing.xl,
                        height: AppSpacing.xl,
                        fit: BoxFit.contain,
                        filterQuality: FilterQuality.medium,
                      ),
                      if (widget.isWaterMarked) // Conditionally show watermark
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Opacity(
                            opacity: 0.5,
                            child: Text(
                              'Watermarked',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                backgroundColor: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                    ],
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
