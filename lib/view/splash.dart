
import 'package:coinapp/view/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';

import '../core/shared/theme/app_color.dart';


class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageColor.pageColor,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// 28 27 55
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.width / 2.5),
              child:
              Lottie.asset("assets/images/splash.json", fit: BoxFit.cover),
            ),

           const SpinKitChasingDots(
              color: PageColor.componentColor,
            )
          ],
        ),
      ),
    );
  }
}
