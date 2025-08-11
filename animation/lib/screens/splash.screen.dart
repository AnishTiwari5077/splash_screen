import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  final List<String> imagePaths = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image6.png',
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(imagePaths.length, (index) {
        bool isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: isActive ? 14 : 10,
          height: isActive ? 14 : 10,
          decoration: BoxDecoration(
            color: isActive ? Colors.red : Colors.grey[400],
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
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
        children: [
          // Animated text under AppBar
          TweenAnimationBuilder(
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: -50, end: 0),
            duration: const Duration(seconds: 2),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, value),
                child: Opacity(
                  opacity: 1 - (value / -50),
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

          // PageView with images
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: TweenAnimationBuilder(
                    curve: Curves.easeInOut,
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: Duration(seconds: 2 + index),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Image.asset(
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
                );
              },
            ),
          ),

          // The scrolling circle indicator
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: buildIndicator(),
          ),
        ],
      ),
    );
  }
}
