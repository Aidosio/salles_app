import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenWidgets extends StatelessWidget {
  const SplashScreenWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),
          // Container(
          //   padding: EdgeInsets.all(40),
          //   child: Center(
          //     child: SvgPicture.asset(
          //       'assets/Sales_Assistant.svg',
          //       width: double.infinity,
          //       height: double.infinity,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
