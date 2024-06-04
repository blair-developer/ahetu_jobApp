import 'package:ahetu/views/common/app_bar.dart';
import 'package:ahetu/views/common/drawer/drawer_widget.dart';
import 'package:ahetu/views/common/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h), 
        child: CustomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(.0),
            child: DrawerWidget(color: Color(kDark.value),
            ),
          ))
        ),
      body: Center(
        child: ReusableText(text: 'Chat Page', style: appStyle(30, Color(kDark.value), FontWeight.bold))
      ),
    );
  }
}