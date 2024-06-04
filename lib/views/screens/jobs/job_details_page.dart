import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/controllers/jobs_provider.dart';
import 'package:ahetu/models/response/jobs/get_job.dart';
import 'package:ahetu/services/helpers/jobs_helper.dart';
import 'package:ahetu/views/common/BackBtn.dart';
import 'package:ahetu/views/common/app_bar.dart';
import 'package:ahetu/views/common/custom_outline_btn.dart';
import 'package:ahetu/views/common/exports.dart';
import 'package:ahetu/views/common/height_spacer.dart';
import 'package:ahetu/views/common/pages_loader.dart';
import 'package:ahetu/views/common/styled_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class JobDetails extends StatefulWidget {
  const JobDetails({super.key, required this.title, required this.id, required this.agentName});
 final String title;
 final String id;
 final String agentName;

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, JobsNotifier, child){
        JobsNotifier.getJob(widget.id);
        return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), 
        child: CustomAppBar(
          actions: [
            GestureDetector(
              onTap: () {
                
              },
              child: Padding(padding: EdgeInsets.only(right: 12),
              child: Icon(Fontisto.bookmark),
              ),
              
            )
          ],
          child: const BackBtn()
          )
        ),
        body: buildStyleContainer(context, 
           FutureBuilder<GetJobRes>(
            future: JobsNotifier.job, 
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const PageLoader();
              }else if(snapshot.hasError){
                return Text("Error: ${snapshot.error}" );
              }else{
                final jobs = snapshot.data;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    children: [
                      ListView(
                        padding: EdgeInsets.zero,
                        children: [
                           Container(
                            width: width,
                            height: hieght*0.27,
                            decoration: BoxDecoration(
                              color: Color(kLightGrey.value),
                              image: DecorationImage(image: AssetImage('assets/images/jobs.png'), opacity: 0.35),
                              borderRadius: BorderRadius.all(Radius.circular(9))
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 30.w,
                                  backgroundImage: NetworkImage(jobs!.imageUrl),
                                ),
                                HeightSpacer(size: 10),
                                ReusableText(text: jobs.title,
                                 style: appStyle(16, Color(kDark.value), FontWeight.w600)
                                 ),
                                 HeightSpacer(size: 5),
                                 ReusableText(text: jobs.location,
                                 style: appStyle(16, Color(kOrange.value), FontWeight.w600)
                                 ),
                                 HeightSpacer(size: 15),
                                 Padding(padding: EdgeInsets.symmetric(horizontal: 50),
                                 child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomOutlineBtn(
                                      width: width* .26,
                                      hieght: hieght* .04,
                                      text: jobs.contract, color: Color(kOrange.value)
                                      ),
                                     Row(
                                      children: [
                                        ReusableText(text: jobs.salary, 
                                        style: appStyle(16, Colors.blueGrey, FontWeight.w600)
                                        ),
                                         ReusableText(text: "/${jobs.period}", 
                                        style: appStyle(16, Colors.green, FontWeight.w600)
                                        )
                                      ],
                                     )
                                  ],
                                 ),
                                 )
                              ],
                            ),
                           ),
                       const HeightSpacer(size: 20),
                       ReusableText(text: "Description", 
                       style: appStyle(16, Colors.black12, FontWeight.w600)
                       ),
                       const HeightSpacer(size: 10),

                       Text(jobs.description, 
                       maxLines: 9,
                       style: appStyle(12, Colors.black38, FontWeight.normal),
                       ),
                       const HeightSpacer(size: 10),

                       ReusableText(text: "Requirements", 
                       style: appStyle(16, Colors.black54, FontWeight.w600)
                       ),
                       SizedBox(
                        height: hieght*0.6,
                        child: ListView.builder(
                          itemCount: jobs.requirements.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            var requirements = jobs.requirements[index];
                            String bullet = '\u2022';
                            return Padding(
                              padding: EdgeInsets.only(bottom: 20),
                              child: Text("$bullet $requirements",
                              style: appStyle(12, Color(kDarkGrey.value), FontWeight.normal),
                              ),
                              );
                        }),
                       )
                        ],
                      ),

                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CustomOutlineBtn(
                            text: "Please Login", 
                            hieght: hieght*0.06,
                            color: Color(kLight.value),
                            color2: Color(kOrange.value)
                            ),
                        ),
                      )
                    ],
                  ),
                );
              }
            }
            ),
        ),
    );
      }
      );
  }
}