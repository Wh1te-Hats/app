import 'dart:convert';

List<Stream> streamFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Stream>.from(jsonData.map((x) => Stream.fromJson(x)));
}

String streamToJson(List<Stream> data) {
  final List<Map<String, dynamic>> jsonData =
      data.map((x) => x.toJson()).toList();
  return json.encode(jsonData);
}


class Stream{
  final String courseName;
  final String courseDescription;
  final String courseDuration;
  final String careerOpportunities;
  final String eligibilityRequirements;
  final String courseCurriculum;
  final String courseStructure;

  Stream({
    required this.courseName,
    required this.courseDescription,
    required this.courseDuration,
    required this.careerOpportunities,
    required this.eligibilityRequirements,
    required this.courseCurriculum,
    required this.courseStructure,
  });

  factory Stream.fromJson(Map<String, dynamic> json) {
    return Stream(
      courseName: json['course name'] ?? '',
      courseDescription: json['course description'] ?? '',
      courseDuration: json['course duration'] ?? '',
      careerOpportunities: json['career opportunities'] ?? '',
      eligibilityRequirements: json['eligibility requirements'] ?? '',
      courseCurriculum: json['course curriculum'] ?? '',
      courseStructure: json['course structure'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'course name': courseName,
      'course description': courseDescription,
      'course duration': courseDuration,
      'career opportunities': careerOpportunities,
      'eligibility requirements': eligibilityRequirements,
      'course curriculum': courseCurriculum,
      'course structure': courseStructure,
    };
  }
}
