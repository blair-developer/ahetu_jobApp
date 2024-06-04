import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/views/common/app_style.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: hieght,
        color: Color(kDarkBlue.value),
        child: Column(
          children: [
            const SizedBox(height: 70,),
            Image.asset("assets/images/page2.png"),
            const SizedBox(height: 40,),
            Column(
               children: [
                Text('Stable yourself \n with your abilities',
                textAlign: TextAlign.center, 
                style: appStyle(30, Color(kLight.value), FontWeight.w500)),
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