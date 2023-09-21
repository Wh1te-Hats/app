import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pragati_v1/Models/aptitude.dart';
import 'package:pragati_v1/Models/career.dart';
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
        'https://0aa6-122-172-85-234.ngrok-free.app/career'); // Replace with your actual endpoint URL

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
        'https://0aa6-122-172-85-234.ngrok-free.app/aptitude/general'; // Replace with your API endpoint

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
}
