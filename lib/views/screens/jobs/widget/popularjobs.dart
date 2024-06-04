import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/controllers/jobs_provider.dart';
import 'package:ahetu/models/response/jobs/jobs_response.dart';
import 'package:ahetu/views/common/loader.dart';
import 'package:ahetu/views/common/pages_loader.dart';
import 'package:ahetu/views/common/styled_container.dart';
import 'package:ahetu/views/screens/jobs/job_details_page.dart';
import 'package:ahetu/views/screens/jobs/widget/JobsHorizontalTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PopularJobs extends StatelessWidget {
  const PopularJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
       builder: (context, JobsNotifier, child){
        JobsNotifier.getJobs();
         return SizedBox(
          height: hieght*0.28,
           child: FutureBuilder<List<JobsResponse>>(
            future: JobsNotifier.jobList, 
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator.adaptive(),);
              }else if(snapshot.hasError){
                return Text("Error: ${snapshot.error}" );
              }else if(snapshot.data!.isEmpty){
                return const NoSearchResults(text: "No job available");
              }else{
                final jobs = snapshot.data;
                return ListView.builder(
                  itemCount: jobs!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    var job = jobs[index];
                    return JobsHorizontalTile(
                      job: job,
                      onTap: () {
                        Get.to(()=> JobDetails(id: job.id,title: job.title, agentName: job.agentName,));
                      },
                    );
                  }
                  );
              }
            }
            ),
         );
       },
    );
  }
}