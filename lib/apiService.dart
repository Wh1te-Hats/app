import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pragati_v1/Models/aptitude.dart';
import 'package:pragati_v1/Models/career.dart';
import 'package:pragati_v1/Models/job.dart';
import 'package:pragati_v1/Providers/userInfoProvider.dart';
import 'Models/college.dart';
import 'Models/stream.dart';

class apiCollege with ChangeNotifier {
  Future<List<college>?> getCollege(String url) async {
    var client = http.Client();

    var uri = Uri.parse(url);

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return collegeFromJson(json);
    }
    return null;
  }

  @override
  notifyListeners();

  Future<List<Stream>?> getStream(String url) async {
    var client = http.Client();

    var uri = Uri.parse(url);

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return streamFromJson(json);
    }
    return null;
  }

  Future<List<CareerModel>?> postSkills(List<String> skills) async {
    final url = Uri.parse(
        'https://b5bb-122-172-87-1.ngrok-free.app/career'); // Replace with your actual endpoint URL

    final Map<String, dynamic> data = {
      'skill': skills,
    };

    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    try {
      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var json = response.body;
        return careersFromJson(json);
        // print('POST request successful');
        // You can handle the response here if needed.
      } else {
        print('POST request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error making POST request: $error');
    }
    return null;
  }

  Future<List<Question>> postGeneralAptitude(
      String userId, String topic) async {
    final String url =
        'https://b5bb-122-172-87-1.ngrok-free.app/aptitude/general/dummy'; // Replace with your API endpoint

    final Map<String, String> data = {
      'user_id': userId,
      'topic': topic,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      return questionFromJson(jsonResponse);
    } else {
      throw Exception('Failed to post request');
    }
  }

  Future<List<Job>> postJobInfo(List<String> jobUserInfo) async {
    final String url =
        'https://b5bb-122-172-87-1.ngrok-free.app/job'; // Replace with your API endpoint

    final Map<String, String> data = {
      "role": jobUserInfo[0],
      "location": jobUserInfo[1],
      "type": jobUserInfo[2]
    };

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      return jobsFromJson(jsonResponse);
    } else {
      throw Exception('Failed to post request');
    }
  }

  Future<String> fetchChatbotResponse(String userMessage) async {
    final body = {
      'message': userMessage,
      'flow': 'EMPTY',
      'num': -1,
    };

    var response = await http.post(
      Uri.parse('https://cff2-122-172-84-239.ngrok-free.app/chat'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      // Parse and return the chatbot response
      // String responseBody = utf8.decode(response.bodyBytes);
      final Map<String, dynamic> res = json.decode(response.body);
      print(res['message']);
      return 'PRAGATI : ' + res['message']!;
    } else {
      // throw Exception('Failed to load chatbot response');
      return 'Failed to load chatbot response';
    }
  }

  Future<void> postUserInfo(
      UserInfoProvider userInfoProvider, String? id) async {
    final body = {
      'id': id,
      'name': userInfoProvider.name.text,
      'city': userInfoProvider.city.text,
      'state': userInfoProvider.state.text,
      'grade': userInfoProvider.grade,
      'gender': userInfoProvider.gender,
      'board': userInfoProvider.board,
    };

    var response = await http.post(
        Uri.parse('https://cff2-122-172-84-239.ngrok-free.app/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      print("Succesfully transfered user information");
    }
  }
}
