import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/career.dart';
import '../../Widgets/customText.dart';
import '../../main.dart';

class CareerInfo extends StatefulWidget {
  CareerModel info;
  CareerInfo({super.key, required this.info});

  @override
  State<CareerInfo> createState() => _CareerInfoState();
}

class _CareerInfoState extends State<CareerInfo> {
  List<String> skillList = ['Coding', 'AI/Ml', 'Algorithms', 'Networking'];
  late CareerModel info;

  @override
  Widget build(BuildContext context) {
    info = widget.info;
    return WillPopScope(
      onWillPop: () async {
        context.go('/skills');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: customText(
                    info.careerName,
                    Colors.white,
                    34.0,
                    EdgeInsets.fromLTRB(0.0, 25, 0, 10.0),
                    FontWeight.bold,
                    FontStyle.normal),
              ),
              customText(
                  'Job Stats',
                  Colors.white,
                  22.0,
                  EdgeInsets.fromLTRB(21.0, 12, 0, 9.0),
                  FontWeight.w400,
                  FontStyle.normal),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 12, 0, 12),
                    child: Container(
                      width: 120,
                      height: 120,
                      child: CircularProgressIndicator(
                        value: 0.4,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(MyApp.secondary),
                        backgroundColor: Colors.white,
                        strokeWidth: 10.0,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(
                          '40%',
                          MyApp.secondary,
                          51.0,
                          EdgeInsets.fromLTRB(25.0, 2, 0, 2.0),
                          FontWeight.bold,
                          FontStyle.normal),
                      customText(
                          'increase in',
                          Colors.white,
                          22.0,
                          EdgeInsets.fromLTRB(25.0, 0, 0, 2.0),
                          FontWeight.bold,
                          FontStyle.normal),
                      customText(
                          '2023',
                          Color.fromARGB(255, 29, 73, 109),
                          45.0,
                          EdgeInsets.fromLTRB(25.0, 0, 0, 2.0),
                          FontWeight.bold,
                          FontStyle.normal),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 31, 35, 1),
                child: LinearProgressIndicator(
                  value: 0.4,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  backgroundColor: Colors.white,
                ),
              ),
              customText(
                  '2022',
                  Colors.white,
                  17.0,
                  EdgeInsets.fromLTRB(25.0, 0, 0, 9.0),
                  FontWeight.w400,
                  FontStyle.normal),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 11, 35, 1.0),
                child: LinearProgressIndicator(
                  value: 0.7,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                  backgroundColor: Colors.white,
                ),
              ),
              customText(
                  '2021',
                  Colors.white,
                  17.0,
                  EdgeInsets.fromLTRB(25.0, 0, 0, 9.0),
                  FontWeight.w400,
                  FontStyle.normal),
              customText(
                  '${info.careerName}  ?',
                  Colors.white,
                  22.0,
                  EdgeInsets.fromLTRB(21.0, 17, 115, 9.0),
                  FontWeight.w400,
                  FontStyle.normal),
              customText(
                  info.careerDescription,
                  Colors.white,
                  16.0,
                  EdgeInsets.fromLTRB(22, 5, 22, 20),
                  FontWeight.w400,
                  FontStyle.normal),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                margin: EdgeInsets.only(
                    top: 0.0, bottom: 5.0, left: 25.0, right: 25.0),
                padding: EdgeInsets.only(
                    top: 16.0, bottom: 5.0, left: 0.0, right: 5.0),
                width: 377.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(10, 30, 46, 0.6),
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customText(
                        'Average Annual Salary',
                        Colors.white,
                        20.0,
                        EdgeInsets.fromLTRB(0, 0, 0, 0),
                        FontWeight.w400,
                        FontStyle.normal),
                    customText(
                        'Rs 3.2 LPA',
                        MyApp.secondary,
                        20.0,
                        EdgeInsets.fromLTRB(0, 10, 0, 0),
                        FontWeight.bold,
                        FontStyle.normal),
                  ],
                ),
              ),
              customText(
                  'Skills',
                  Colors.white,
                  26.0,
                  EdgeInsets.fromLTRB(34.0, 12, 0, 29.0),
                  FontWeight.w400,
                  FontStyle.normal),
              Container(
                height: skillList.length * 50,
                width: 400,
                child: ListView.builder(
                  itemCount: skillList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      margin: EdgeInsets.only(
                          top: 1.0, bottom: 1.0, left: 25.0, right: 25.0),
                      padding: EdgeInsets.only(
                          top: 16.0, bottom: 1.0, left: 124.0, right: 5.0),
                      width: 27.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(239, 5, 17, 28),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: MyApp.primaryColor,
                            spreadRadius: 1.0,
                            blurRadius: 3.0,
                          ),
                        ],
                        border: Border.all(
                          color:
                              MyApp.secondary, // Specify the border color here
                          width: 0.6, // Specify the border width here
                        ),
                      ),
                      child: customText(
                          skillList[index],
                          Colors.white,
                          22.0,
                          EdgeInsets.fromLTRB(0.0, 0, 0, 0.0),
                          FontWeight.w400,
                          FontStyle.normal),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(44, 42, 0, 44),
                child: SizedBox(
                  height: 38,
                  width: 320,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MyApp.secondary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    onPressed: () => {},
                    child: const Text(
                      'Interested',
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
