import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/views/common/app_style.dart';
import 'package:ahetu/views/common/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class CustomField extends StatelessWidget {
   const CustomField({super.key, this.onTap, required this.controller});

  final void Function()? onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      padding: EdgeInsets.only(bottom: 5),
      color: Color(kLightGrey.value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              WidthSpacer(width: 5),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Ionicons.chevron_back_circle, size: 30, color: Color(kOrange.value),),
                ),
              ),
          
          Container(
            padding: EdgeInsets.only(top: 20),
            width: width*0.7,
            child: TextFormField(
        decoration: InputDecoration(
            hintText: "Search a job",
            hintStyle: appStyle(14, Color(kDarkGrey.value), FontWeight.w500),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.red, width: 0.5)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.red, width: 0.5)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide:
                    BorderSide(color: Color(kDarkGrey.value), width: 0.5)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.transparent, width: 0.5)),
            border: InputBorder.none),
        controller: controller,
        cursorHeight: 25,
        style: appStyle(14, Color(kDark.value), FontWeight.w500),
      ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(Ionicons.search_circle_outline,
             size: 33, color: Color(kOrange.value),),
          ),
          
            ]
      )
        ],
      ),
    );
  }
}