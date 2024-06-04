import 'package:ahetu/models/response/auth/login.dart';
import 'package:ahetu/views/common/app_bar.dart';
import 'package:ahetu/views/common/drawer/drawer_widget.dart';
import 'package:ahetu/views/common/exports.dart';
import 'package:ahetu/views/common/heading_widget.dart';
import 'package:ahetu/views/common/search.dart';
import 'package:ahetu/views/screens/Search/Widget/search_page.dart';
import 'package:ahetu/views/screens/auth/profile_page.dart';
import 'package:ahetu/views/screens/jobs/job_list_page.dart';
import 'package:ahetu/views/screens/jobs/widget/Recentlist.dart';
import 'package:ahetu/views/screens/jobs/widget/popularjobs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String imageUrl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShB7IwN9gr4q2Tn-1CRfbgANRN-8SWlYMMy9iq467T1A&s';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h), 
        child: CustomAppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  //Get.to(()=> const ProfilePage(drawer: false));
                  Get.to(()=> const LoginPage());
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: CachedNetworkImage(
                    height: 25.w,
                    width: 25.h,
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    ),
                ),
              ),
            )
          ],
          child: Padding(
            padding: EdgeInsets.all(10.h),
            child: DrawerWidget(color: Color(kDark.value),
            ),
          ))
        ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Search \n find & Apply", 
                style: appStyle(38, Color(kDark.value), FontWeight.bold) ,),
                SizedBox(
                  height: 20.h,
                ),
                SearchWidget(
                onTap: () {
                  Get.to(() => const SearchPage());
                },
               ),
               const SizedBox(height: 30,),
                HeadingWidget(text: "Popular jobs", onTap: () {
                 Get.to(() => const JobListPage());
               },),
               const SizedBox(height: 15,),
               const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: PopularJobs()
                ),


               const SizedBox(height: 15,),
                HeadingWidget(text: "Recently posted", onTap: () {
                  Get.to(() => const JobListPage());
               },),
               const SizedBox(height: 15,),
               const RecentJobs(),
              ],
            ),
          ),
        )
        )
    );
  }
}