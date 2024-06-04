import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/models/request/bookmarks/bookmarks_model.dart';
import 'package:ahetu/models/response/bookmarks/all_bookmarks.dart';
import 'package:ahetu/models/response/jobs/get_job.dart';
import 'package:ahetu/models/response/jobs/jobs_response.dart';
import 'package:ahetu/services/helpers/book_helper.dart';
import 'package:ahetu/services/helpers/jobs_helper.dart';

class JobsNotifier extends ChangeNotifier {
  late Future<List<JobsResponse>> jobList;
  late Future<List<JobsResponse>> recentJob;
  late Future<GetJobRes> job;

  Future<List<JobsResponse>> getJobs(){
    jobList = JobsHelper.getJobs();
    return jobList;
    }
  Future<List<JobsResponse>> getRecent(){
    recentJob = JobsHelper.getRecent();
    return recentJob;
    }  

    Future<GetJobRes> getJob(String jobId){
    job = JobsHelper.getJob(jobId);
    return job;
    }
}
