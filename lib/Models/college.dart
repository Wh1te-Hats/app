import 'dart:convert';

List<college> collegeFromJson(String str) => List<college>.from(json.decode(str).map((x) => college.fromJson(x)));

String collegeToJson(List<college> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class college {
    college({
        required this.id,
        required this.logo,
        required this.name,
        required this.location,
        required this.information,
        required this.ranking,
        required this.fee,
        required this.duration,
        required this.examAccepted,
        required this.eligibility,
    });

    int id;
    String logo;
    String name;
    String location;
    String information;
    String ranking;
    String fee;
    String duration;
    String examAccepted;
    String eligibility;

    factory college.fromJson(Map<String, dynamic> json) => college(
        id: json["id"],
        logo: json["logo"],
        name: json["name"],
        location: json["location"],
        information: json["information"],
        ranking: json["ranking"],
        fee: json["fee"],
        duration: json["duration"],
        examAccepted: json["exam_accepted"],
        eligibility: json["eligibility"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo": logo,
        "name": name,
        "location": location,
        "information": information,
        "ranking": ranking,
        "fee": fee,
        "duration": duration,
        "exam_accepted": examAccepted,
        "eligibility": eligibility,
    };
}