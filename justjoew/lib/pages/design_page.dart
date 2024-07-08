import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:justjoew/widgets/art_image.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> with TickerProviderStateMixin {
  late final GifController controller1, controller2, controller3, controller4;
  int _fps = 20;

  @override
  void initState() {
    controller1 = GifController(vsync: this);
    controller2 = GifController(vsync: this);
    controller3 = GifController(vsync: this);
    controller4 = GifController(vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EmoteSection(
          controller1: controller1,
          controller2: controller2,
          header: "ScatRatt",
        ),
        EmoteSection(
          controller1: controller3,
          controller2: controller4,
          header: "NotScatRatt",
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.dispose();
  }
}

class EmoteSection extends StatelessWidget {
  const EmoteSection(
      {super.key,
      required this.controller1,
      required this.controller2,
      required this.header});

  final GifController controller1;
  final GifController controller2;
  final String header;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            header,
            style: TextStyle(
              // decoration: TextDecoration.underline,
              decorationColor: Colors.lightBlue,
              color: Colors.lightBlue,
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(
          thickness: 0.7,
          color: Colors.lightBlue,
          endIndent: 400,
          indent: 400,
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment:
                  WrapAlignment.center, // centers the children in the Wrap

              runSpacing: 40,
              spacing: 80,
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
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
