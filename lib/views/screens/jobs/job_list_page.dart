import 'package:ahetu/views/common/BackBtn.dart';
import 'package:ahetu/views/common/app_bar.dart';
import 'package:ahetu/views/screens/jobs/widget/popularjobs_list.dart';
import 'package:flutter/material.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(50), 
      child: CustomAppBar(
         text: "Jobs",
         child: BackBtn(),
        )
      ),
      body: PopularJobList(),
    );
  }
}