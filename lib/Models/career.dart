import 'dart:convert';

List<CareerModel> careersFromJson(String str) => List<CareerModel>.from(json.decode(str).map((x) => CareerModel.fromJson(x)));

String careersToJson(List<CareerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class CareerModel {
  String careerName;
  String careerGrowth;
  String careerDescription;

  CareerModel({
    required this.careerName,
    required this.careerGrowth,
    required this.careerDescription,
  });

  factory CareerModel.fromJson(Map<String, dynamic> json) {
    return CareerModel(
      careerName: json['career_name'],
      careerGrowth: json['career_growth'],
      careerDescription: json['career_description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'career_name': careerName,
      'career_growth': careerGrowth,
      'career_description': careerDescription,
    };
  }
}
