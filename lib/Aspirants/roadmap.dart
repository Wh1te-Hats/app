import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customLine.dart';
import 'package:pragati_v1/Widgets/customLine2.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class RoadMap extends StatefulWidget {
  const RoadMap({super.key, required String selectedSkill});

  @override
  State<RoadMap> createState() => _RoadMapState();
}

class _RoadMapState extends State<RoadMap> {
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.cubicTo(size.width / 4, 3 * size.height / 4, 3 * size.width / 4,
        size.height / 4, size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
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
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: customText(
                        '',
                        MyApp.secondary,
                        40.0,
                        EdgeInsets.fromLTRB(5, 40, 15, 25),
                        FontWeight.w500,
                        FontStyle.normal),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 40, 5, 15),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 40.0,
                        fontFamily: 'Aeonik',
                        fontWeight: FontWeight.bold,
                        color: MyApp.secondary,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(' Roadmap for You'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 15.0, 20.0, 0.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 223, 75, 105)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                        side: BorderSide(color: MyApp.primaryColor),
                      ),
                    ),
                  ),
                  onPressed: () => {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 20.0, 30.0, 20.0),
                    child: customText(
                        ' HandleInputStart=1099820308192157, AnimationStart=1099820308196324',
                        Colors.white,
                        18.0,
                        EdgeInsets.fromLTRB(0, 5, 0, 5),
                        FontWeight.w400,
                        FontStyle.normal),
                  ),
                ),
              ),
              Center(
                child: CustomPaint(
                  size:
                      Size(150, 175), // Set the size of the CustomPaint widget
                  painter: CustomLine(color: Color.fromARGB(255, 223, 75, 105)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, .0, 20.0, 0.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 238, 245, 44),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                        side:
                            BorderSide(color: Color.fromARGB(255, 68, 59, 61)),
                      ),
                    ),
                  ),
                  onPressed: () => {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 20.0, 30.0, 20.0),
                    child: customText(
                        ' HandleInputStart=1099820308192157, AnimationStart=1099820308196324',
                        Colors.black,
                        18.0,
                        EdgeInsets.fromLTRB(0, 5, 0, 5),
                        FontWeight.w400,
                        FontStyle.normal),
                  ),
                ),
              ),
              Center(
                child: CustomPaint(
                  size:
                      Size(150, 175), // Set the size of the CustomPaint widget
                  painter: CustomLine2(
                    color: Color.fromARGB(255, 238, 245, 44),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20.0, 0.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyApp.secondary),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                        side: BorderSide(color: MyApp.primaryColor),
                      ),
                    ),
                  ),
                  onPressed: () => {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 20.0, 30.0, 20.0),
                    child: customText(
                        'HandleInputStart=1099820308192157, AnimationStart=1099820308196324',
                        Colors.black,
                        18.0,
                        EdgeInsets.fromLTRB(0, 5, 0, 5),
                        FontWeight.w400,
                        FontStyle.normal),
                  ),
                ),
              ),
              Center(
                child: CustomPaint(
                  size:
                      Size(150, 175), // Set the size of the CustomPaint widget
                  painter: CustomLine(color: MyApp.secondary),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20.0, 0.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyApp.primaryColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(70),
                        side: BorderSide(color: MyApp.secondary),
                      ),
                    ),
                  ),
                  onPressed: () => {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(30, 20.0, 30.0, 20.0),
                    child: customText(
                        'HandleInputStart=1099820308192157, AnimationStart=1099820308196324',
                        Colors.white,
                        18.0,
                        EdgeInsets.fromLTRB(0, 5, 0, 5),
                        FontWeight.w400,
                        FontStyle.normal),
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
