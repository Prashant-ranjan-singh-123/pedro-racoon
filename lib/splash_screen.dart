import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'pedro_pedro.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> showOnboard() async {
    Future.delayed(const Duration(seconds: 3, milliseconds: 500), () {
      Get.off(const VideoPlayerScreen(),
          transition: Transition.rightToLeft, duration: 300.ms);
    });
  }

  double returnSmall(){
    if(Get.width>Get.height){
      return Get.height;
    }else{
      return Get.width;
    }
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
        width: returnSmall()*0.7,
        height: returnSmall()*0.7,
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
