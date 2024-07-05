import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/splash_screen.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoPlayerApp());

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Player Demo',
      home: SplashScreen(),
    );
  }
}