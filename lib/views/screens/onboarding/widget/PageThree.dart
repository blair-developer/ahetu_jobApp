import 'package:ahetu/views/common/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/views/common/custom_outline_btn.dart';
import 'package:ahetu/views/common/exports.dart';
import 'package:ahetu/views/screens/mainscreen.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: hieght,
          color: Color(kLightBlue.value),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Image.asset("assets/images/page3.png"),
              const SizedBox(height: 20,),
              ReusableText(text: 'Welcome to Blair', style: appStyle(30, Color(kLight.value), FontWeight.w600),),
              const SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.all(8.0.h),
                child: Text("I am writing to express my keen interest in the Coding Trainer.",
                textAlign: TextAlign.center,
                style: appStyle(15, Color(kLight.value), FontWeight.normal),
                ),
              ),
               const SizedBox(height: 10,),
               CustomOutlineBtn(
                onTap: () {
                  Get.to(()=> const Mainscreen());
                },
                text: "Continue as Guest",
               hieght: hieght*0.05,
               width: width*0.9,
                color: Color(kLight.value))
            ],
          ),
        ),
      ),

    );
  }
}
