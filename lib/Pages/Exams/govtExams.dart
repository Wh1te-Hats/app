import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class GovtExams extends StatefulWidget {
  const GovtExams({super.key});

  @override
  State<GovtExams> createState() => _GovtExamsState();
}

class _GovtExamsState extends State<GovtExams> {

  List<String> types= ["Insurance",
"Defence",
"APSCB",
"BCB",
"Ibps",
"Nainital_banking_exam",
"Rbi",
"Sbi",
"Sib"];

    List<String> routes= ['govt/insurance',
'govt/defence',
'govt/apscb',
'govt/bcb',
'govt/ibps',
'govt/nainital_banking_exam',
'govt/rbi',
'govt/sbi',
'govt/sib'];
  

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
          
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              customText(
                'Governnment Exams',
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
                            shape:
                                MaterialStateProperty.all<RoundedRectangleBorder>(
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
