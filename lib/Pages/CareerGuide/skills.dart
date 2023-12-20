import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import '../../main.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  final List<String> allSkills = [
    "API",
    "Accounting",
    "Accounting and analytical software",
    "Accounting and banking software",
    "Accounting software",
    "Active learning",
    "Active listening",
    "Adaptability",
    "Adaptable",
    "Adaptive",
    "Administration",
    "Adobe Photoshop",
    "Advanced numeracy",
    "Alertness",
    "Analysis",
    "Analytical and scientific software",
    "Analytical skill",
    "Analytical software",
    "Analytical thinking",
    "Analytical-oriented",
    "Analytics",
    "Anatomy",
    "Approachableness",
    "Arm-hand steadiness",
    "Art and design software",
    "Artistic",
    "Artistic ability",
    "Asana",
    "Assertive",
    "Assertiveness",
    "Athleticism",
    "Attention detail",
    "Attention to detail",
    "Auditory attention",
    "Basic math comprehension",
    "Biology",
    "Biology and chemistry",
    "Biology and ecology",
    "Blockchain Arcihtecture",
    "Blockchain platforms",
    "Bookkeeping",
    "Budget management",
    "Budgeting",
    "Building and construction",
    "Building and safety codes",
    "Building codes",
    "Business",
    "Business acumen",
    "Business management",
    "Cad software",
    "Calendar and scheduling software",
    "Call centre software",
    "Cataloguing and database software",
    "Chemistry",
    "Chemistry and physics",
    "Cms software",
    "Coaching",
    "Coding Languages",
    "Coding skill",
    "Cognos",
    "Collaboration",
    "Colour vision",
    "Commercial awareness",
    "Commitment",
    "Communication",
    "Communications and media",
    "Compassion",
    "Compassionate",
    "Complex mathematics",
    "Compliance software",
    "Computer",
    "Computer Forensics skill",
    "Computer Networking",
    "Computer aided design (cad) software",
    "Computer engineering",
    "Computer knowledge",
    "Computer literacy",
    "Computer software",
    "Computer-assisted translation software",
    "Concentration",
    "Confidence",
    "Conflict resolution",
    "Consistent",
    "Contract and import laws",
    "Cooperation",
    "Cooperative",
    "Coordination",
    "Court procedures",
    "Creative",
    "Creative thinking",
    "Creativity",
    "Criminal justice",
    "Critical Thinking",
    "Critical reasoning",
    "Critical thinking",
    "Crm software",
    "Cryptography",
    "Cryptography",
    "Css",
    "Cultural awareness",
    "Curiosity",
    "Customer service",
    "Customs and environmental regulations",
    "Data and financial analysis software",
    "Data entry",
    "Data skill",
    "Data visualization",
    "Data-driven",
    "Data-focused",
    "Database",
    "Database and spreadsheet software",
    "Database management software",
    "Database software",
    "Datastructure",
    "Decision making",
    "Decision-making",
    "Dedicated",
    "Dedication",
    "Deductive reasoning",
    "Deep Learning",
    "Dependability",
    "Dependable",
    "Design",
    "Design and sewing",
    "Design software",
    "Design tools",
    "Detail-oriented",
    "Determination",
    "Determined",
    "Dexterity",
    "Dexterous",
    "Digital media",
    "Diplomacy",
    "Discipline",
    "Discretion",
    "Dramatic arts",
    "Economics",
    "Editing",
    "Education and instruction",
    "Education and training",
    "Emotional control",
    "Emotional intelligence",
    "Empathy",
    "Endurance",
    "Energetic",
    "Energy",
    "Engineering",
    "Engineering and technology",
    "English language",
    "English spelling and grammar",
    "Enthusiasm",
    "Environmental laws",
    "Environmental science",
    "Ethical hacking",
    "Etiquette",
    "Facilities management software",
    "Far vision",
    "Figma",
    "Film editing equipment",
    "Film editing software",
    "Financial software",
    "Fine arts",
    "Fire safety codes and laws",
    "First aid",
    "Fiscal management",
    "Flexibility",
    "Fluency of ideas",
    "Focus",
    "Food production",
    "Food production and safety",
    "Foreign language",
    "Foreign languages",
    "Friendliness",
    "Friendly",
    "Geographical knowledge",
    "Geography",
    "Git",
    "Good eyesight",
    "Good judgment",
    "Good memory",
    "Good vision",
    "Government regulations",
    "Gradle",
    "Grammar and spelling",
    "Graphics and photo imaging software",
    "Graphics software",
    "Hand-eye coordination",
    "Handle stress",
    "Hardware Knowlegde",
    "Hearing sensitivity",
    "History and archaeology",
    "History and economics",
    "Honesty",
    "Honesty and integrity",
    "Housing laws",
    "Hr and employment law",
    "Hr software",
    "Html",
    "Improvisation",
    "Independence",
    "Independent",
    "Independent thinking",
    "Inductive reasoning",
    "Industrial control software",
    "Industry regulations and laws",
    "Information ordering",
    "Information retrieval software",
    "Initiative",
    "Innovation",
    "Instructing",
    "Instruction",
    "Instructional",
    "Integrity",
    "Interpersonal",
    "Interpersonal skill",
    "Interviewing",
    "Inventory management software",
    "It skill",
    "J2EEE",
    "JIRA",
    "Jenkins",
    "Js",
    "Judgement",
    "Judgment",
    "Lab and farm equipment",
    "Law and government",
    "Laws and government",
    "Leadership",
    "Legal databases",
    "Legal knowledge",
    "Linux",
    "Linux",
    "Listening",
    "Literacy",
    "Logical reasoning",
    "Logical thinking",
    "Machine Learning",
    "Management",
    "Management software",
    "Managing",
    "Manual dexterity",
    "Mapping software",
    "Marketing",
    "Marketing software",
    "Mathematical",
    "Mathematical reasoning",
    "Mathematics",
    "Mathematics and accounting",
    "Maths",
    "Mechanical",
    "Mechanical design and repair",
    "Mechanical drawing",
    "Medical software",
    "Medicine",
    "Medicine and dentistry",
    "Memorisation",
    "Mental endurance",
    "Metamask",
    "Methodical",
    "Methodological",
    "Microbiology",
    "Monitoring",
    "Motivated",
    "Motivation",
    "Motivational",
    "Motivational nature",
    "Multitasking",
    "Music and sound editing software",
    "Music editing software",
    "Musical talent",
    "Navigation",
    "Near vision",
    "Negotiation",
    "Networking",
    "Neural Networks",
    "Neuroscience",
    "Neutrality",
    "Node.js",
    "Notetaking",
    "Numeracy",
    "Numerical",
    "Numerical reasoning",
    "Nutrition",
    "Objectivity",
    "Observation",
    "Observational",
    "Operations analysis",
    "Oral expression",
    "Organisation",
    "Organisational",
    "Organization",
    "Originality",
    "Outdoor survival",
    "Passion",
    "Patience",
    "Perseverance",
    "Persistence",
    "Personal responsibility",
    "Personnel and human resources",
    "Persuasion",
    "Physical condition",
    "Physical coordination",
    "Physical fitness",
    "Physical fitness and strength",
    "Physical stamina",
    "Physical strength",
    "Physically fit",
    "Physics",
    "Physiology",
    "PivotalTracker",
    "Planning",
    "Pos software",
    "Precision",
    "Preparedness",
    "Presentation and conferencing software",
    "Pressure",
    "Prioritising",
    "Problem Solving",
    "Problem sensitivity",
    "Problem solving",
    "Problem-Solving skill",
    "Problem-solving",
    "Product knowledge",
    "Production and processing",
    "Professionalism",
    "Program testing software",
    "Programming",
    "Programming skill",
    "Project management",
    "Project management software",
    "Promotional",
    "Psychology",
    "Public safety",
    "Public safety and security",
    "Public speaking",
    "Punctual",
    "Python",
    "Quatitative Analysis",
    "Quick thinking",
    "R",
    "Reading",
    "Reading comprehension",
    "Recipe and menu software",
    "Record Maintenance",
    "Recordkeeping",
    "Reliability",
    "Remix",
    "Research",
    "Research, Capacity",
    "Researching",
    "Resilience",
    "Resourceful",
    "Resourcefulness",
    "Respectfulness",
    "Responsible",
    "Responsiveness",
    "Reverse Engineering",
    "Rhythm",
    "Risk management",
    "Risk management and assessment",
    "Robotics",
    "Robustness",
    "Safety management",
    "Safety standards",
    "Safety-conscious",
    "Sales",
    "Sales and marketing",
    "Sales software",
    "Scheduling and database software",
    "Science",
    "Scientific and medical software",
    "Scientific knowledge",
    "Scientific software",
    "Search Enigne Optimization",
    "Selective attention",
    "Self-confidence",
    "Self-discipline",
    "Self-motivation",
    "Self-sufficiency",
    "Sense of Humor",
    "Service orientation",
    "Situational awareness",
    "Smart contracts",
    "Social",
    "Social awareness",
    "Social media",
    "Social orientation",
    "Social perception",
    "Social perceptiveness",
    "Sociology",
    "Software Development",
    "Speaking",
    "Speech clarity",
    "Stamina",
    "State and federal regulations",
    "Statistical Learning",
    "Statistical skill",
    "Strategic",
    "Strength",
    "Strength and coordination",
    "Stress tolerance",
    "Strong writing skill",
    "Supervision",
    "Survival and tactical skill",
    "Swimming",
    "Systems analysis",
    "Tax and spreadsheet software",
    "Tax laws",
    "Teaching",
    "Team member",
    "Team working",
    "Teamwork",
    "Tech savviness",
    "Tech-savviness",
    "Tech-savvy",
    "Technical",
    "Technical aptitude",
    "Technical aptitude",
    "Technical writing",
    "Telecommunications",
    "Therapy and counselling",
    "Tidiness",
    "Time Management",
    "Time management",
    "Tolerance",
    "Tour management software",
    "Transcribing",
    "Transcription",
    "Troubleshooting",
    "Truffle",
    "Trustworthiness",
    "Trustworthy",
    "Typing",
    "Unix",
    "Unix",
    "Us law",
    "Vigilance",
    "Vision",
    "Visionary",
    "Visual",
    "Visualisation",
    "Visulization",
    "Webpage design",
    "Word processing",
    "Word processing software",
    "Work well under stress",
    "Workflow software",
    "Writing",
    "Writing Ability",
    "administration",
    "aiml",
    "algorithms",
    "Analytical skill",
    "angularjs",
    "animation",
    "api development",
    "ar",
    "c",
    "c++",
    "cloud computing",
    "cloud security",
    "cryptography",
    "data analysis",
    "data structures",
    "data warehousing",
    "database design",
    "decision making",
    "dicscipline",
    "dsa",
    "hardware architecture",
    "iot",
    "java",
    "javascript",
    "json",
    "libraries",
    "machine learning",
    "modelling",
    "mongoDb",
    "networking",
    "operting systems",
    "os",
    "patience",
    "php",
    "programming skill",
    "react.js",
    "risk taking",
    "social media",
    "sql",
    "typography",
    "ui/ux",
    "virtual machine",
    "vr",
    "xr",
    "xr sdk"
  ];

  List<String> selectedSkills = [];

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
          ),
          body: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 40,
                    child: Image.asset(
                      'assets/images/career-2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  customText(
                      'Career \nRecommendation',
                      Colors.white,
                      28.0,
                      EdgeInsets.fromLTRB(10.0, 25, 28, 9.0),
                      FontWeight.bold,
                      FontStyle.normal),
                ],
              ),
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
                    final isSelected = selectedSkills.contains(skill);

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
                              selectedSkills.remove(skill);
                            } else {
                              selectedSkills.add(skill);
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
                children: selectedSkills
                    .map(
                      (skill) => Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyApp.secondary),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              skill,
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 4.0),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSkills.remove(skill);
                                });
                              },
                              child: Icon(
                                Icons.close,
                                size: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
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
                        context.go('/ratings', extra: selectedSkills);
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
