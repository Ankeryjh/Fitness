import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:fithealth/Login/LoginPage.dart';
class FitnessIntroScreen extends StatefulWidget {
  const FitnessIntroScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FitnessIntroScreenState createState() => _FitnessIntroScreenState();
}

class _FitnessIntroScreenState extends State<FitnessIntroScreen> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onDoneTap() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _onSkipTap() {
    // 处理点击“SKIP”按钮的事件
  }

  @override
  Widget build(BuildContext context) {
    return GFIntroScreen(
      pageController: _pageController,
      currentIndex: _currentIndex,
      pageCount: 3, // 总共有三个介绍屏幕
      onDoneTap: _onDoneTap,
      onSkipTap: _onSkipTap,
      slides: [
        // 第一个介绍屏幕
        Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  "assets/images/Runner_9.png",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Welcome to Fitness, Running Brings Joy",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),

// 第二个介绍屏幕
        Container(
          color: Colors.pinkAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  "assets/images/fitgirl_3.png",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Easily track your workout progress and see how far you've come.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),

// 第三个介绍屏幕
        Container(
          color: Colors.blueGrey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  "assets/images/weightlifter_17.png",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Connect with other fitness enthusiasts and stay motivated on your fitness journey.",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 30),

            ],
          ),
        ),
      ],
      introScreenBottomNavigationBar: GFIntroScreenBottomNavigationBar(
        showPagination: true,
        navigationBarColor:Colors.white,
        currentIndex: _currentIndex,
        pageController: _pageController,
        activeColor: Colors.green,
        inactiveColor:Colors.grey,

        pageCount: 3,
        dotWidth: 10,
        dotHeight: 10,
        dotMargin: EdgeInsets.symmetric(horizontal: 4),
        forwardButtonText: "NEXT",
        doneButtonText: "GO",
        skipButtonText: "SKIP",
        onSkipTap: _onSkipTap,
        onDoneTap: _onDoneTap,
        showButton: true,
        showDivider: false,
      ),
    );
  }
}