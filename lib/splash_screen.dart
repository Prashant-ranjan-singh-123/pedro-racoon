import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:untitled/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> showOnboard() async {
    Future.delayed(const Duration(seconds: 3, milliseconds: 500), () {
      Get.to(const VideoPlayerScreen(),
          transition: Transition.rightToLeft, duration: 300.ms);
    });
  }

  @override
  void initState() {
    super.initState();
    showOnboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: myCustomColumn(children: [
        logo()
            .animate()
            .fadeIn(duration: 2000.ms)
            .slideY(duration: 1000.ms, curve: Curves.decelerate),
        SizedBox(height: 20,),
        nameOfApp()
            .animate()
            .fadeIn(duration: 1000.ms, delay: 500.ms),
        SizedBox(height: 10,),
        shortDiscription()
            .animate()
            .fadeIn(duration: 1200.ms, delay: 500.ms),
      ]),
    );
  }

  Widget myCustomColumn({required List<Widget> children}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget logo() {
    return SizedBox(
        width: Get.width*0.5,
        height: Get.width*0.5,
        child: Image.asset('asset/image/icon.png'));
  }

  Widget nameOfApp() {
    return const Text(
      maxLines: 1,
      'Cute Racoon',
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          fontFamily: 'Poppins',
          color: Colors.white),
    );
  }

  Widget shortDiscription() {
    return const Text(
      maxLines: 1,
      '---By Prashant---',
      style: TextStyle(fontFamily: 'OpenSans', color: Colors.white, fontSize: 25),
    );
  }
}
