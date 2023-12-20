import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/courseList.dart';
import 'package:pragati_v1/Providers/timeProvider.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';
import 'package:provider/provider.dart';

class Chapters extends StatefulWidget {
  final CourseList list;

  const Chapters({super.key, required this.list});

  @override
  State<Chapters> createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  late CourseList list;

  late TimeProvider timeProvider;

  @override
  Widget build(BuildContext context) {
    list = widget.list;
    timeProvider = Provider.of<TimeProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        context.go('/courseBased');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
        ),
        body: Center(
          child: Column(
            children: [
              customText(
                'Chapters Based',
                MyApp.secondary,
                30.0,
                EdgeInsets.fromLTRB(20, 20, 20, 20),
                FontWeight.w400,
                FontStyle.normal,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: ListView.builder(
                  itemCount: list.chapter.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
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
                            List<dynamic> postList = [];
                            postList.add(list);
                            postList.add(index);
                            timeProvider.startTest();
                            context.go('/test2', extra: postList);
                          },
                          child: Text(
                            list.chapter[index],
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
