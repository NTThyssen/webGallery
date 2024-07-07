import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:justjoew/widgets/art_image.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> with TickerProviderStateMixin {
  late final GifController controller1, controller2, controller3;
  int _fps = 20;

  @override
  void initState() {
    controller1 = GifController(vsync: this);
    controller2 = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          alignment: WrapAlignment.center, // centers the children in the Wrap

          runSpacing: 150,
          spacing: 150,
          children: [
            ArtImage(path: 'images/cry15.png'),
            ArtImage(path: 'images/ez8.png'),
            ArtImage(path: 'images/heart2.png'),
            ArtImage(path: 'images/helloRat.png'),
            ArtImage(path: 'images/lulrat.png'),
            ArtImage(path: 'images/pat7.png'),
            Gif(
              width: 80,
              height: 80,
              image: AssetImage("images/RatDanceJam10.gif"),
              controller:
                  controller1, // if duration and fps is null, original gif fps will be used.
              fps: 20,
              //duration: const Duration(seconds: 3),
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller1.reset();
                controller1.forward();
              },
            ),
            Gif(
              width: 80,
              height: 80,
              image: AssetImage("images/RatShyNotNaked.gif"),
              controller:
                  controller2, // if duration and fps is null, original gif fps will be used.
              fps: 20,
              //duration: const Duration(seconds: 3),
              autostart: Autostart.loop,
              placeholder: (context) => const Text('Loading...'),
              onFetchCompleted: () {
                controller2.reset();
                controller2.forward();
              },
            ),
          ]),
    );
  }
}
