import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:version1/screens/starting_screen.dart';
import 'package:version1/widgets/custom_page_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(237, 186, 72, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/splash_screen.json", controller: _controller,
              onLoaded: (compos) {
            _controller
              ..duration = compos.duration
              ..forward().then(
                (value) => Navigator.push(
                  context,
                  CustomPageroute(
                    child: const StartingScreen(),
                    direction: AxisDirection.left,
                  ),
                ),
              );
          }),
          // Center(child: Text("OnEV")),
        ],
      ),
    );
  }
}
