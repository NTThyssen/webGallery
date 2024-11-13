import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:justjoew/cubit/section_cubit.dart';
import 'package:justjoew/utils/theme/spacing.dart';
import 'package:transparent_image/transparent_image.dart';

class ArtImage extends StatefulWidget {
  final String path;
  final bool isWaterMarked; // Indicates whether the image is watermarked.

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

  // Define default image size and hover elevation
  static const double _defaultImageSize = 70;
  static const double _hoverImageSize = 80;
  static const double _hoverElevation = 16;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: SizedBox(
        height: _hoverImageSize, // Container height matches hover size
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isHover
                  ? _hoverImageSize
                  : _defaultImageSize, // Change height on hover
              child: PhysicalModel(
                elevation: isHover ? _hoverElevation : 0, // Elevate on hover
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  child: BlocBuilder<SectionCubit, SectionState>(
                    builder: (context, state) {
                      return Stack(
                        children: [
                          // Main image content
                          if(state is SectionReady)
                            for(var asset in state.sectionList)
                            FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: state.sectionList[0].assetList[0].bloburl,
                              width: isHover
                                  ? _hoverImageSize
                                  : _defaultImageSize, // Adjust width dynamically
                              height: isHover
                                  ? _hoverImageSize
                                  : _defaultImageSize, // Adjust height dynamically
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.medium,
                            ),
                          if (widget
                              .isWaterMarked) // Conditionally show watermark
                            Positioned(
                              bottom: 4,
                              right: 4,
                              child: Opacity(
                                opacity: 0.5,
                                child: Container(
                                  color: Colors.black54,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4, vertical: 2),
                                  child: Text(
                                    'Watermarked',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    },
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
