import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Providers/timeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/customText.dart';
import '../../main.dart';

class GeneralAptitude extends StatefulWidget {
  const GeneralAptitude({super.key});

  @override
  State<GeneralAptitude> createState() => _GeneralAptitudeState();
}

class _GeneralAptitudeState extends State<GeneralAptitude> {
  late TimeProvider timeProvider;

  @override
  Widget build(BuildContext context) {
    timeProvider = Provider.of<TimeProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        context.go('/aptitudeHome');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              customText(
                'General Aptitude',
                Colors.white,
                30.0,
                EdgeInsets.fromLTRB(20, 20, 20, 20),
                FontWeight.w400,
                FontStyle.normal,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('subtype', 'gk');

                      timeProvider.startTest();
                      context.go('/test', extra: 'general knowledge');
                    },
                    child: const Text(
                      'General Knowledge',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                    onPressed: () async{
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('subtype', 'lr');
                      timeProvider.startTest();
                      context.go('/test', extra: 'logical reasoning');
                    },
                    // onPressed: () => context.go('/currentAnalysis' ),
                    child: Text(
                      'Logical Reasoning',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                     onPressed: () async{
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('subtype', 'ar');
                      timeProvider.startTest();
                      context.go('/test', extra: 'arithmetic');
                    },
                    child: const Text(
                      'Arithmetic',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                     onPressed: () async{
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('subtype', 'vr');
                      timeProvider.startTest();
                      context.go('/test', extra: 'verbal reasoning');
                    },
                    child: const Text(
                      'Verbal Reasoning',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                  onPressed: () async{
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('subtype', 'nvr');
                      timeProvider.startTest();
                      context.go('/test', extra: 'non verbal reasoning');
                    },
                    child: const Text(
                      'Non-Verbal Reasoning',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                     onPressed: () async{
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString('subtype', 'va');
                      timeProvider.startTest();
                      context.go('/test', extra: 'verbal ability');
                    },
                    child: const Text(
                      'Verbal Ability',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
