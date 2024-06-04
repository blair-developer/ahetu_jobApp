import 'package:http/http.dart' as https;
import 'package:ahetu/models/response/jobs/get_job.dart';
import 'package:ahetu/models/response/jobs/jobs_response.dart';
import 'package:ahetu/services/config.dart';

class JobsHelper {
  static var client = https.Client();

  static Future<List<JobsResponse>> getJobs() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };

    var url = Uri.parse('${Config.apiUrl}${Config.jobs}');
    print('URL: $url');
    var response = await client.get(url, headers: requestHeaders);
    //print('Response Status Code: ${response.statusCode}');
    //print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        var jobList = jobsResponseFromJson(response.body);
        return jobList;
      } catch (e) {
        print('Error Parsing Jobs Response: $e');
        throw Exception('Error Parsing Jobs Response');
      }
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  static Future<GetJobRes> getJob(String jobId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };

    var url = Uri.parse('${Config.apiUrl}${Config.jobs}/$jobId');
    print('URL: $url');
    var response = await client.get(url, headers: requestHeaders);
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        var job = getJobResFromJson(response.body);
        return job;
      } catch (e) {
        print('Error Parsing Job Response: $e');
        throw Exception('Error Parsing Job Response');
      }
    } else {
      throw Exception('Failed to load job');
    }
  }

   static Future<List<JobsResponse>> getRecent() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };

   var url = Uri.parse('${Config.apiUrl}${Config.jobs}?new=true');
    // var url = Uri.parse('${Config.apiUrl}${Config.jobs}?new=true');
    print('URL: $url');
    var response = await client.get(url, headers: requestHeaders);
    //print('Response Status Code: ${response.statusCode}');
    //print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        var jobList = jobsResponseFromJson(response.body);
        return jobList;
      } catch (e) {
        print('Error Parsing Jobs Response: $e');
        throw Exception('Error Parsing Jobs Response');
      }
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  static Future<List<JobsResponse>> searchJob(String query) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json'
    };

    var url = Uri.parse('${Config.apiUrl}${Config.search}/$query');
    print('URL: $url');
    var response = await client.get(url, headers: requestHeaders);
    //print('Response Status Code: ${response.statusCode}');
    //print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        var jobList = jobsResponseFromJson(response.body);
        return jobList;
      } catch (e) {
        print('Error Parsing Jobs Response: $e');
        throw Exception('Error Parsing Jobs Response');
      }
    } else {
      throw Exception('Failed to load jobs');
    }
  }

}
