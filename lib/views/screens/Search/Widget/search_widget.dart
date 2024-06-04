import 'package:ahetu/views/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.OnTap});
  
  final void Function()? OnTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTap,
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(kLightGrey.value),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Row(

          ),
        ),
      ),
    );
  }
}