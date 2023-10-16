// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:muyu/setting.dart';

import 'controller.dart';

Future<void> main() async {
  await GetStorage.init(); //*初始化本地存储
  Get.put(Controller()); //*初始化语言
  C = Get.find(); //*获取控制器
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;
  List<Widget> textAnimations = [];

  @override
  void initState() {
    super.initState();
    C.get(); //*从本地获取数据
    controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    sizeAnimation = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween<double>(begin: 200.0, end: 220.0), weight: 50),
      TweenSequenceItem(
          tween: Tween<double>(begin: 220.0, end: 200.0), weight: 50),
    ]).animate(controller);
  }

  Future<void> _onButtonPress() async {
    AudioPlayer player = AudioPlayer();
    setState(() {
      textAnimations.add(DeedAnimation());
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      } else if (controller.status == AnimationStatus.dismissed) {
        controller.forward();
      } else {
        controller.forward(from: 0.0);
      }
    });
    await player.play(AssetSource('audio/muyu.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return SizedBox(
                    width: 200.0,
                    height: 300.0,
                    child: Stack(
                      children: textAnimations,
                    ));
              },
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: _onButtonPress,
              child: AnimatedBuilder(
                animation: sizeAnimation,
                builder: (BuildContext context, Widget? child) {
                  return Image.asset(
                    'assets/images/my.png',
                    width: sizeAnimation.value,
                    height: sizeAnimation.value,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        clipBehavior: Clip.antiAlias,
        onPressed: () {
          Get.to(() => const Setting(), transition: Transition.topLevel);
        },
        child: const Icon(Icons.settings, color: Colors.black, size: 30),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class DeedAnimation extends StatefulWidget {
  const DeedAnimation({super.key});

  @override
  _DeedAnimationState createState() => _DeedAnimationState();
}

class _DeedAnimationState extends State<DeedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _textController;
  late Animation<double> _textPositionAnimation;
  late Animation<double> _textOpacityAnimation;

  @override
  void initState() {
    super.initState();

    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _textPositionAnimation = Tween<double>(begin: 58.0, end: 0.0).animate(
      CurvedAnimation(parent: _textController, curve: Curves.easeOut),
    );
    _textOpacityAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _textController,
        curve: const Interval(0.7, 1.0, curve: Curves.easeOut),
      ),
    );

    _textController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            // Remove this widget after animation completes.
            setState(() {
              // Remove this widget after animation completes.
              // textAnimations.removeAt(0);
            });
          }
        });
      }
    });

    _textController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _textController,
      builder: (context, child) {
        return Positioned(
          right: 0,
          top: _textPositionAnimation.value,
          child: Opacity(
            opacity: _textOpacityAnimation.value,
            child: Text(C.text.value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }
}
