import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_sy_travel_animation/leopard_page.dart';
import 'package:flutter_sy_travel_animation/styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page;
      notifyListeners();
    });
  }

  double get offset => _offset;

  double get page => _page;
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageOffsetNotifier(_pageController),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              PageView(
                controller: _pageController,
                physics: ClampingScrollPhysics(),
                children: [
                  LeopardPage(),
                  VulturePage(),
                ],
              ),
              AppBar(),
              LeopardImage(),
              VultureImage(),
              ShareButton(),
              PageIndicator(),
              ArrowIcon(),
              TravelDetailsLabel(),
              StartCampLabel(),
              StartTimeLabel(),
              BaseCampLabel(),
              BaseTimeLabel(),
              DistanceLabel(),
              TravelDots(),
              MapButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ArrowIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 128.0 + 400 + 32 - 1.5,
      right: 24.0,
      child: Icon(
        Icons.keyboard_arrow_up,
        size: 28.0,
        color: lighterGrey,
      ),
    );
  }
}

class PageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, _) => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: notifier.page.round() == 0 ? white : lightGrey,
                ),
                height: 8.0,
                width: 8.0,
              ),
              SizedBox(
                width: 8.0,
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: notifier.page.round() == 1 ? white : lightGrey,
                ),
                height: 8.0,
                width: 8.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VultureImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          left:
              1.20 * MediaQuery.of(context).size.width - 0.85 * notifier.offset,
          child: child,
        );
      },
      child: IgnorePointer(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 90.0),
        child: Image.asset(
          "assets/vulture.png",
          height: MediaQuery.of(context).size.height / 3,
        ),
      )),
    );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 24.0,
        ),
        child: Row(
          children: [
            Text(
              "SY",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Spacer(),
            Icon(
              Icons.menu,
            ),
          ],
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24.0,
      bottom: 16.0,
      child: Icon(Icons.share),
    );
  }
}

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: VultureCircle(),
    );
  }
}

class TravelDetailsLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          top: 128.0 + 400 + 32 - 1.5,
          left: 24.0 + MediaQuery.of(context).size.width - notifier.offset,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: Text(
        "Travel Details",
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}

class StartCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Start camp",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class StartTimeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32 + 40,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          left: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          DateFormat.jm().format(DateTime.now()),
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class BaseCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Base camp",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class BaseTimeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32 + 40,
          width: (MediaQuery.of(context).size.width - 48) / 3,
          right: opacity * 24.0,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "07:48 pm",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}

class DistanceLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 400 + 32 + 16 + 32 + 40,
          width: MediaQuery.of(context).size.width,
          child: Opacity(
            opacity: opacity,
            child: child,
          ),
        );
      },
      child: Center(
        child: Text(
          "72 km",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
    );
  }
}

class TravelDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(builder: (context, notifier, _) {
      double opacity = math.max(0, 4 * notifier.page - 3);
      return Positioned(
        top: 128.0 + 400 + 32 + 16 + 32 + 4,
        left: 0,
        right: 0,
        child: Center(
          child: Opacity(
            opacity: opacity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: opacity * 40.0),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: white),
                  height: 8.0,
                  width: 8.0,
                ),
                Container(
                  margin: EdgeInsets.only(left: opacity * 10.0),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: lightGrey),
                  height: 4.0,
                  width: 4.0,
                ),
                Container(
                  margin: EdgeInsets.only(right: opacity * 10.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightGrey,
                  ),
                  height: 4.0,
                  width: 4.0,
                ),
                Container(
                  margin: EdgeInsets.only(right: opacity * 40.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: white,
                    ),
                  ),
                  height: 8.0,
                  width: 8.0,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class VultureCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(builder: (context, notifier, child) {
      double mulitplier = math.max(0, 4 * notifier.page - 3);
      double size = MediaQuery.of(context).size.width * 0.5 * mulitplier;
      return Container(
        margin: EdgeInsets.only(bottom: 320.0, left: 30),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: lightGrey,
        ),
        width: size,
        height: size,
      );
    });
  }
}

class MapButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 8,
        bottom: 0,
        child: Consumer<PageOffsetNotifier>(
          builder: (context, notifier, child) {
            double opacity = math.max(0, 4 * notifier.page - 3);
            return Opacity(
              opacity: opacity,
              child: child,
            );
          },
          child: FlatButton(
            onPressed: () {},
            child: Text(
              "ON MAP",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ));
  }
}
