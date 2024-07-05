import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://rr1---sn-gwpa-cvhe7.googlevideo.com/videoplayback?expire=1720143370&ei=qvmGZrXaL8v-mLAPyYaU0A4&ip=46.4.48.22&id=o-AF1mntrlaJOyOdtB1SJtVAPq6ptJKzGU_lvnqEqkj8jx&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=723999&ratebypass=yes&dur=14.058&lmt=1713210289147796&c=ANDROID_TESTSUITE&txp=6300224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRgIhAIWrtRAzcmV_O76Etfmlm2Lmp4eDGcslUE8N3ySC0k2xAiEA-rsF0X7Qk7hrCdgAH6iH-K8LrjGXhJ5zGzq6O1zYd5o%3D&title=Pedro%20pedro%20pedro%20racoon&rm=sn-4g5e6l7l&fexp=24350518&req_id=4fb1b2a5db02a3ee&ipbypass=yes&redirect_counter=2&cm2rm=sn-gwpa-civel7s&cms_redirect=yes&cmsv=e&mh=nA&mip=2405:201:3022:583c:6501:ec36:d265:2987&mm=29&mn=sn-gwpa-cvhe7&ms=rdu&mt=1720121346&mv=m&mvi=1&pcm2cms=yes&pl=49&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pcm2cms,pl&lsig=AHlkHjAwRQIhANmoYLWwH50wHgmHJY6MOFwX0Qml-NxKWy2333PBrVc1AiAltiKPtZBDSVHDDxapJi2JTO1Q6FCiY2bfZF8CQIrWEg%3D%3D',
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Pedro Edit By Prahant', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                              } else {
                                // If the video is paused, play it.
                                _controller.play();
                              }
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 20,
                            shadowColor: Colors.grey,
                          ),
                          child: const Text('Feed Cute Racoon', style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 15
                          ),)))
                ],
              ),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}