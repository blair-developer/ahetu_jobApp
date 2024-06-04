import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/models/response/jobs/jobs_response.dart';
import 'package:ahetu/services/helpers/jobs_helper.dart';
import 'package:ahetu/views/common/loader.dart';
import 'package:ahetu/views/screens/Search/Widget/custom_field.dart';
import 'package:ahetu/views/screens/jobs/widget/JobsVerticalTile.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kLight.value),
        automaticallyImplyLeading: false,
        elevation: 0,
        title: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          child: CustomField(controller: controller,
          onTap: () {
            setState(() {
              
            });
          },),
        ),
      ),
      body: controller.text.isNotEmpty ?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: FutureBuilder<List<JobsResponse>>(
            future: JobsHelper.searchJob(controller.text), 
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
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index){
                    var job = jobs[index];
                    return JobsVerticalTile(
                      job: job,
                      
                    );
                  }
                  );
              }
            }))
            : const NoSearchResults(text: 'Start Searching....'),
    );
  }
}