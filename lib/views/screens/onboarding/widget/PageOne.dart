import 'package:flutter/material.dart';
import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/views/common/exports.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kDarkPurple.value),
        child: Column(
          children: [
            const SizedBox(height: 70,),
            Image.asset("assets/images/page1.png"),
            const SizedBox(height: 40,),
            Column(
               children: [
                ReusableText(text: 'Find your dream Job', style: appStyle(30, Color(kLight.value), FontWeight.w500)),
                Padding(

                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text('The app, which now is already available on Google Play store, embraces an interactive approach that makes learning enjoyable for students', 
                   textAlign: TextAlign.center,
                  style: appStyle(14, Color(kLight.value), FontWeight.normal)),
                ),
                const SizedBox(height: 10,),
               ],
            )
          ],
        ),
      ),
    );
  }
}
