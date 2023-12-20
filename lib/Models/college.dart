import 'dart:convert';

List<college> collegeFromJson(String str) =>
    List<college>.from(json.decode(str).map((x) => college.fromJson(x)));

String collegeToJson(List<college> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class college {
  college({
    required this.name,
    required this.icon,
    required this.fees,
    required this.duration,
    required this.examAccepted,
    required this.eligibility,
    required this.ranking,
    required this.highestPackage,
    required this.averagePackage,
  });

  String name;
  String icon;
  String fees;
  String duration;
  String examAccepted;
  String eligibility;
  String ranking;
  String highestPackage;
  String averagePackage;

  factory college.fromJson(Map<String, dynamic> json) => college(
      name: json["college_name"],
      icon: json["college_icon"],
      fees: json["fees"],
      duration: json["duration"],
      examAccepted: json["exam"],
      eligibility: json["eligibility"],
      ranking: json["college_nirf"],
      highestPackage: json["highest_package"],
      averagePackage: json["average_package"]);

  Map<String, dynamic> toJson() => {
        "college_name": name,
        "college_icon": icon,
        "fees": fees,
        "duartion": duration,
        "exam": examAccepted,
        "eligibility": eligibility,
        "college_nirf": ranking,
        "highest_package": highestPackage,
        "average_package": averagePackage,
      };
}
