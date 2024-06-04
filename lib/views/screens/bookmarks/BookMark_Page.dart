import 'package:ahetu/views/common/app_bar.dart';
import 'package:ahetu/views/common/drawer/drawer_widget.dart';
import 'package:ahetu/views/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookMarksPage extends StatefulWidget {
  const BookMarksPage({super.key});

  @override
  State<BookMarksPage> createState() => _BookMarksPageState();
}

class _BookMarksPageState extends State<BookMarksPage> {
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
        child: ReusableText(text: 'Bookmark Page', style: appStyle(30, Color(kDark.value), FontWeight.bold))
      ),
    );
  }
}