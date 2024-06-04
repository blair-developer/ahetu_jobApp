import 'package:ahetu/views/common/app_bar.dart';
import 'package:ahetu/views/common/drawer/drawer_widget.dart';
import 'package:ahetu/views/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h), 
        child: CustomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: DrawerWidget(color: Color(kDark.value),
            ),
          ))
        ),
      body: Center(
        child: ReusableText(text: 'Application Page', style: appStyle(30, Color(kDark.value), FontWeight.bold))
      ),
    );
  }
}