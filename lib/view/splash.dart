
import 'package:coinapp/view/tabbar.dart';
import 'package:flutter/material.dart';
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

            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const TabbarPage();
                }));
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: PageColor.componentColor),
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  alignment: Alignment.center,
                  child: Text(
                    "Devam",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color:PageColor.pageColor),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
