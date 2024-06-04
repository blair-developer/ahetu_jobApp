import 'dart:convert';

List<JobsResponse> jobsResponseFromJson(String str) => List<JobsResponse>.from(json.decode(str).map((x) => JobsResponse.fromJson(x)));

class JobsResponse {
    JobsResponse({
        required this.id,
        required this.title,
        required this.location,
        required this.agentName,
        required this.company,
        required this.hiring,
        required this.description,
        required this.salary,
        required this.period,
        required this.contract,
        required this.requirements,
        required this.imageUrl,
        required this.agentId,
        // required this.createdAt,
        // required this.updatedAt,
    });

    final String id;
    final String title;
    final String location;
    final String company;
    final bool hiring;
    final String description;
    final String salary;
    final String period;
    final String contract;
    final List<String> requirements;
    final String imageUrl;
    final String agentId;
    final String agentName;
    // final DateTime createdAt;
    // final DateTime updatedAt;

    factory JobsResponse.fromJson(Map<String, dynamic> json) => JobsResponse(
        id: json["_id"] ?? '', // Provide default empty string if null
      title: json["title"] ?? '', // Provide default empty string if null
      location: json["location"] ?? '', // Provide default empty string if null
      company: json["company"] ?? '', // Provide default empty string if null
      hiring: json["hiring"] ?? false, // Provide default value if null
      description: json["description"] ?? '', // Provide default empty string if null
      salary: json["salary"] ?? '', // Provide default empty string if null
      period: json["period"] ?? '', // Provide default empty string if null
      agentName: json["agentName"] ?? '', // Provide default empty string if null
      contract: json["contract"] ?? '', // Provide default empty string if null
      requirements: json["requirements"] != null 
        ? List<String>.from(json["requirements"].map((x) => x ?? '')) 
        : [], // Provide empty list if null, default empty string for each item
      imageUrl: json["imageUrl"] ?? '', // Provide default empty string if null
      agentId: json["agentId"] ?? '', // Provide default empty string if null
      // createdAt: DateTime.parse(json["createdAt"]),
      // updatedAt: DateTime.parse(json["updatedAt"]),
    );

}
