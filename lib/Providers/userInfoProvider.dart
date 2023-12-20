import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  String grade="";
  String gender="";
  String board="";

  // Text controllers
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();

}