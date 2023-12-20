import 'dart:convert';

List<TestScore> testScoreFromJson(String str) =>
    List<TestScore>.from(json.decode(str).map((x) => TestScore.fromJson(x)));

String testScoreToJson(List<TestScore> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestScore {
  TestScore({
    required this.totalTimeSpent,
    required this.totalTestTaken,
    required this.courseScore,
    required this.generalScore,
    required this.careerScore,
    // required this.courseChapterScore,
    // required this.generalChapterScore,
    // required this.careerChapterScore,
  });

  int totalTimeSpent;
  int totalTestTaken;
  int courseScore;
  int generalScore;
  int careerScore;
  // List<ChapterScore> courseChapterScore;
  // List<ChapterScore> generalChapterScore;
  // List<ChapterScore> careerChapterScore;

  factory TestScore.fromJson(Map<String, dynamic> json) => TestScore(
        totalTimeSpent: json["total_time_spent"],
        totalTestTaken: json["total_test_taken"],
        courseScore: json["course_score"],
        generalScore: json["general_score"],
        careerScore: json["career_score"],
        // courseChapterScore: List<ChapterScore>.from(
        //     json["course_chapter_score"]
        //         .map((x) => ChapterScore.fromJson(x))),
        // generalChapterScore: List<ChapterScore>.from(
        //     json["general_chapter_score"]
        //         .map((x) => ChapterScore.fromJson(x))),
        // careerChapterScore: List<ChapterScore>.from(
        //     json["career_chapter_score"]
        //         .map((x) => ChapterScore.fromJson(x))),
      );

  Map<String, int> toJson() => {
        "total_time_spent": totalTimeSpent,
        "total_test_taken": totalTestTaken,
        "course_score": courseScore,
        "general_score": generalScore,
        "career_score": careerScore,
      //   "course_chapter_score":
      //       List<dynamic>.from(courseChapterScore.map((x) => x.toJson())),
      //   "general_chapter_score":
      //       List<dynamic>.from(generalChapterScore.map((x) => x.toJson())),
      //   "career_chapter_score":
      //       List<dynamic>.from(careerChapterScore.map((x) => x.toJson())),
      // };
};}

// class ChapterScore {
//   ChapterScore({
//     required this.subtype,
//     required this.score,
//   });

//   List<String> subtype;
//   List<double> score;

//   factory ChapterScore.fromJson(Map<String, dynamic> json) => ChapterScore(
//         subtype: List<String>.from(json["subtype"].map((x) => x)),
//         score: List<double>.from(json["score"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "subtype": List<dynamic>.from(subtype.map((x) => x)),
//         "score": List<dynamic>.from(score.map((x) => x)),
//       };
// }
