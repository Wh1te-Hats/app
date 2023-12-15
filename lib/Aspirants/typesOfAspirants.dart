import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class typesOfAspirants extends StatefulWidget {
  const typesOfAspirants({super.key});

  @override
  State<typesOfAspirants> createState() => _typesOfAspirantsState();
}

class _typesOfAspirantsState extends State<typesOfAspirants> {
  final List<String> allSkills = [
    "Cyber Analyst",
    "Blockchain Expert",
    "IAS Officer",
    "Data Scientist"
  ];

  String selectedSkill = "";

  TextEditingController searchController = TextEditingController();

  bool isTextFieldFocused = false; // Track TextField focus state

  FocusNode searchFocusNode = FocusNode(); // FocusNode for the TextField
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return false;
      },
      child: GestureDetector(
         onTap: () {
          FocusScope.of(context).unfocus();
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
          body: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: customText(
                        'Be',
                        MyApp.secondary,
                        40.0,
                        EdgeInsets.fromLTRB(45, 40, 15, 15),
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
                          FadeAnimatedText(' ASPIRING'),
                          FadeAnimatedText(' OPTIMISTIC'),
                          FadeAnimatedText(' DIFFERENT'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                ],
              ),
              customText(
                  'Select your Category',
                  Colors.white,
                  30.0,
                  EdgeInsets.fromLTRB(5, 40, 15, 15),
                  FontWeight.w400,
                  FontStyle.normal),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 2),
                child: TextField(
                  cursorColor: Colors.white,
                  focusNode: searchFocusNode,
                  style: TextStyle(color: Colors.white),
                  controller: searchController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: MyApp.secondary, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: MyApp.secondary),
                    ),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w300),
                    labelText: 'Search for Skills',
                    suffixIcon: isTextFieldFocused
                        ? IconButton(
                            icon: Icon(Icons.clear,
                                size: 24.0, // Customize the icon size
                                color: Colors.white),
                            onPressed: () {
                              searchController.clear();
                              setState(() {});
                            },
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.search,
                              size: 24.0, // Customize the icon size
                              color: Colors.white,
                            ),
                            onPressed: () {
                              searchFocusNode.requestFocus();
                            },
                          ),
                  ),
                  onTap: () {
                    setState(() {
                      isTextFieldFocused = true;
                    });
                  },
                  onEditingComplete: () {
                    setState(() {
                      searchFocusNode.unfocus();
                      isTextFieldFocused = false;
                    });
                  },
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: allSkills.length,
                  itemBuilder: (context, index) {
                    final skill = allSkills[index];

                    // Check if the skill matches the search query
                    if (searchController.text.isNotEmpty &&
                        !skill
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                      return SizedBox
                          .shrink(); // Hide items that don't match the search
                    }

                    // Check if the skill is already selected
                    final isSelected = selectedSkill.contains(skill);

                    return Container(
                      padding: EdgeInsets.fromLTRB(10, 2, 20, 2),
                      child: ListTile(
                        title: customText(
                          skill,
                          Colors.white,
                          20.0,
                          EdgeInsets.fromLTRB(5, 2, 8, 02),
                          FontWeight.w300,
                          FontStyle.normal,
                        ),
                        trailing: isSelected
                            ? Icon(
                                Icons.check_box,
                                size: 24.0, // Customize the icon size
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.check_box_outline_blank,
                                size: 24.0, // Customize the icon size
                                color: Colors.white,
                              ),
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedSkill = "";
                            } else {
                              selectedSkill = skill;
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 25.0),
              Wrap(
                children: [
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: MyApp.secondary),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          selectedSkill,
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 4.0),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(MyApp.secondary),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onPressed: () {
                        // String name = _textFieldController1.text;
                        // String password = _textFieldController2.text;
                        print(selectedSkill);
                        context.go('/roadmap', extra: selectedSkill);
                      },
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 22,
                        ),
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
