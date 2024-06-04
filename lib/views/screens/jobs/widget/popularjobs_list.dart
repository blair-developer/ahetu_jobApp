import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/controllers/jobs_provider.dart';
import 'package:ahetu/models/response/jobs/jobs_response.dart';
import 'package:ahetu/views/common/pages_loader.dart';
import 'package:ahetu/views/screens/jobs/widget/uploaded_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularJobList extends StatelessWidget {
  const PopularJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
       builder: (context, JobsNotifier, child){
         JobsNotifier.getJobs();
         return Padding(
           padding: const EdgeInsets.symmetric(horizontal: 12),
           child: FutureBuilder<List<JobsResponse>>(
              future: JobsNotifier.jobList, 
              builder: (context, snapshot){
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return PageLoader();
                }else if(snapshot.hasError){
                  return Text("Error: ${snapshot.error}" );
                }else if(snapshot.data!.isEmpty){
                  return const Text("No job available");
                }else{
                  final jobs = snapshot.data;
                  return ListView.builder(
                    itemCount: jobs!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                      var job = jobs[index];
                      return UploadedTile(job: job, text: 'Popular',);
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