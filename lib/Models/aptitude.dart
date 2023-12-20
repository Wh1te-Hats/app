import 'dart:convert';

List<Question> questionFromJson(String str) =>
    List<Question>.from(json.decode(str).map((x) => Question.fromJson(x)));

String questionToJson(List<Question> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Question {
  Question({
    required this.questionNumber,
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    required this.explaination,
  });

  String questionNumber;
  String questionText;
  List<String> options;
  String correctAnswer;
  String explaination;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        questionNumber: json["question_number"],
        questionText: json["question"],
        options: List<String>.from(json["options"].map((x) => x)),
        correctAnswer: json["correct_option"],
        explaination: json["explaination"],
      );

  Map<String, dynamic> toJson() => {
        "question_number": questionNumber,
        "question": questionText,
        "options": List<dynamic>.from(options.map((x) => x)),
        "correct_option":correctAnswer,
        "explaination": explaination
      };
}
