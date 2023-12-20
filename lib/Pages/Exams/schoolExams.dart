import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class SchoolExams extends StatefulWidget {
  const SchoolExams({super.key});

  @override
  State<SchoolExams> createState() => _SchoolExamsState();
}

class _SchoolExamsState extends State<SchoolExams> {
  List<String> types = [
    "CBSE",
    "ICSE",
    "NTSE",
    "Cambridge"
        "IB",
    "State-wise",
    "Talent Based"
  ];

  List<String> routes = [
    'school/cbse',
    'school/icse',
    'school/ntse',
    'school/cambrigde',
    'school/ib',
    'school/state',
    'school/talent',
    'school/ntse'
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/typesOfExams');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
          actions: [],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              customText(
                'School Exams',
                Colors.white,
                30.0,
                EdgeInsets.fromLTRB(20, 20, 20, 20),
                FontWeight.w700,
                FontStyle.normal,
              ),
              // Replace with your list of strings

              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: ListView.builder(
                  itemCount: types.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              MyApp.primaryColor.withOpacity(0.3),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: MyApp.secondary,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            context.go('/examDetails', extra: routes[index]);
                          },
                          child: Text(
                            types[index],
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
