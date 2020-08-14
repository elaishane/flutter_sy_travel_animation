import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_sy_travel_animation/main_page.dart';
import 'package:provider/provider.dart';

import 'styles.dart';

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 128.0,
        ),
        The72Text(),
        SizedBox(
          height: 32.0,
        ),
        TravelDescriptionLabel(),
        SizedBox(
          height: 32.0,
        ),
        LeopardDescription(),
      ],
    );
  }
}

class LeopardDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * notifier.page),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Text(
          "The leopard is distinguished by its well-camouflaged fur, opportunistic hunting behaviour, broad diet, and strength.",
          style: TextStyle(
            fontSize: 17.0,
            color: lightGrey,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}

class The72Text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Transform.translate(
          offset: Offset(-60 - 0.5 * notifier.offset, 0),
          child: child,
        );
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: SizedBox(
          width: 400,
          child: FittedBox(
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            child: Text(
              "72",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TravelDescriptionLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Opacity(
          opacity: math.max(0, 1 - 4 * notifier.page),
          child: child,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: Text(
          "Travel Description",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

class LeopardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          left: -0.85 * notifier.offset,
          width: MediaQuery.of(context).size.width * 1.6,
          child: child,
        );
      },
      child: IgnorePointer(child: Image.asset("assets/leopard.png")),
    );
  }
}
