import 'dart:convert';

List<Question> questionFromJson(String str) =>
    List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  Question({
    required this.questionNumber,
    required this.questionTextHtml,
    required this.optionsHtml,
  });

  String questionNumber;
  String questionTextHtml;
  List<String> optionsHtml;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionNumber: json["question_number"],
        questionTextHtml: json["question_text_html"],
        optionsHtml: List<String>.from(json["options_html"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "question_number": questionNumber,
        "question_text_html": questionTextHtml,
        "options_html": List<dynamic>.from(optionsHtml.map((x) => x)),
      };
}
