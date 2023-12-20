import 'dart:convert';

List<Exam> examFromJson(String str) =>
    List<Exam>.from(json.decode(str).map((x) => Exam.fromJson(x)));

String examToJson(List<Exam> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exam {
  Exam({
    required this.title,
  required this.description,
  required this.subjects,
  required this.eligibility,
  required this.passCriteria,
  required this.link,
  required this.fees,
  required this.logo,
  required this.pyp
  });

  String title;
  String description;
  List<dynamic> subjects;
  String eligibility;
  String passCriteria;
  String link;
  String fees;
  String logo;
  String pyp; 

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
      title: json["Title"],
      description: json["Description"],
      subjects: json["Subjects Covered"],
      eligibility: json["Eligibility Criteria"],
      passCriteria: json["Pass Criteria"],
      link: json["Link to Website"],
      fees: json["Registration fee"],
      logo: json["Logo"],
      pyp: json["Previous year Question papers"],
);

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Description" : description,
        "Subjects Covered" : subjects,
        "Eligibility Criteria" : eligibility,
        "Pass Criteria"  : passCriteria,
        "Link to Website":link,
        "Registration fee":fees,
        "Logo": logo,
        "Previous year Question papers": pyp
      };
}
