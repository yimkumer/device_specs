import 'package:flutter/material.dart';
import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:audioplayers/audioplayers.dart';

import 'main.dart';

class Splash extends StatefulWidget {
  const Splash ({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    startTime();
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    AudioPlayer().play(AssetSource('humm.mp3'));
    AudioPlayer().stop();
    AudioPlayer().dispose();

    return AnimatedSplashScreen(
      splash: Image.asset("assets/spec.gif"),
      nextScreen: const MyApp(),
      backgroundColor: Colors.black,
      splashIconSize: 450,
      splashTransition: SplashTransition.rotationTransition,
      animationDuration: const Duration(seconds: 6),
      disableNavigation: true,
    );
  }

  startTime() async {
    var duration = const Duration(seconds: 8);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const MyApp()
    )
    );
  }
}

