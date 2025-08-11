import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/image1.png',
      'assets/images/image2.png',
      'assets/images/image3.png',
      'assets/images/image4.png',
      'assets/images/image5.png',
      'assets/images/image6.png',
    ];

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 96, 139, 118),
        title: const Text(
          "Splash Screen",
          style: TextStyle(
            color: Color.fromARGB(255, 215, 75, 75),
            fontSize: 23,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Animated text directly under AppBar
          TweenAnimationBuilder(
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: -50, end: 0), // slide from top
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, value),
                child: Opacity(
                  opacity: 1 - (value / -50), // fade in while sliding
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: const Text(
                        'Welcome to Splash Screen',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 22, 49),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          // Rest of content (centered)
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  imagePaths.length, // use your image list here
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 50,
                    ),
                    child: TweenAnimationBuilder(
                      curve: Curves.easeInOut,
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: Duration(
                        seconds: 2 + index,
                      ), // stagger duration
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Image.asset(
                            alignment: Alignment.center,
                            imagePaths[index],
                            width: 350,
                            height: 550,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            gaplessPlayback: true,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
