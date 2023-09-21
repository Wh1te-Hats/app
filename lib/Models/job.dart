import 'dart:convert';

class Job {
  final String jobName;
  final String companyName;
  final String link;
  final String location;

  Job({
    required this.jobName,
    required this.companyName,
    required this.link,
    required this.location,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      jobName: json['job_name'] ?? '',
      companyName: json['company_name'] ?? '',
      link: json['link'] ?? '',
      location: json['location'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job_name': jobName,
      'company_name': companyName,
      'link': link,
      'location': location,
    };
  }
}

List<Job> jobsFromJson(String str) =>
    List<Job>.from(json.decode(str).map((x) => Job.fromJson(x)));

String jobsToJson(List<Job> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
