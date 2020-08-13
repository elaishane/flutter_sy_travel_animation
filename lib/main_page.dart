import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            children: [
              LeopardPage(),
              VulturePage(),
            ],
          ),
          Image.asset("assets/leopard.png")
        ],
      ),
    );
  }
}

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/leopard.png");
  }
}

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/vulture.png");
  }
}
