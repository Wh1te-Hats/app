import 'dart:convert';

List<CourseList> courseListFromJson(String str) => List<CourseList>.from(json.decode(str).map((x) => CourseList.fromJson(x)));

String courseListToJson(List<CourseList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseList {
  String subject;
  List<dynamic> chapter;


  CourseList({
    required this.subject,
    required this.chapter,
  });

  factory CourseList.fromJson(Map<String, dynamic> json) {
    return CourseList(
      subject: json["subject"],
      chapter: json["chapter"],

    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subject": subject,
      "chapter":chapter
    };
  }
}
