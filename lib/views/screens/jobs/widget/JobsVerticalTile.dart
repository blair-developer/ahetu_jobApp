import 'package:ahetu/models/response/jobs/jobs_response.dart';
import 'package:ahetu/views/common/exports.dart';
import 'package:ahetu/views/screens/jobs/job_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class JobsVerticalTile extends StatelessWidget {
  const JobsVerticalTile({super.key, required this.job});
  
  final JobsResponse job;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          Get.to(()=> JobDetails(title: job.title, id: job.id, agentName: job.agentName));
        },
        child: Padding(
                 padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        height: hieght*0.12,
                        width: width,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 203, 199, 199),
                          borderRadius: BorderRadius.all(Radius.circular(9))
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(job.imageUrl),
                                    ),
                                    const SizedBox(width: 10,),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ReusableText(
                                         text: job.company, 
                                         style: appStyle(16, Colors.black38, FontWeight.w500)
                                        ),

                                         SizedBox(
                                           width: width * 0.5,
                                           child: ReusableText(
                                           text: job.title, 
                                           style: appStyle(12, Color.fromARGB(95, 16, 16, 16), FontWeight.w500)
                                                                                   ),
                                         ),
                                        ReusableText(
                                         text: "${job.salary} per ${job.period}", 
                                         style: appStyle(12, Colors.black38, FontWeight.w500)
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 18,
                                  backgroundColor: Color(kLight.value),
                                  child: Center(
                                    child: Icon(
                                      Ionicons.chevron_forward
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                           
                          ),
                        ),
      ),
    );
  }
}