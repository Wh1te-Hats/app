import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Widgets/customText.dart';
import '../../main.dart';

class GeneralAptitude extends StatefulWidget {
  const GeneralAptitude({super.key});

  @override
  State<GeneralAptitude> createState() => _GeneralAptitudeState();
}

class _GeneralAptitudeState extends State<GeneralAptitude> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/aptitudeHome');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
          actions: [
            IconButton(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 10),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
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
                    onPressed: () =>
                        context.go('/test', extra: 'general knowledge'),
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
                    onPressed: () => context.go('/test', extra: 'dummy'),
                    // onPressed: () => context.go('/currentAnalysis' ),
                    child: const Text(
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
                    onPressed: () => context.go('/test', extra: 'arithmetic'),
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
                    onPressed: () =>
                        context.go('/test', extra: 'verbal reasoning'),
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
                    onPressed: () =>
                        context.go('/test', extra: 'logical reasoning'),
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
                    onPressed: () =>
                        context.go('/test', extra: 'logical reasoning'),
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
