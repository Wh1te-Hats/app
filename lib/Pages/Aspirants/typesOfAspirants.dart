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
    "AR-based Surgical Navigation Specialist",
    "Blockchain Real-time Supply Chain Analyst",
    "IT Business Analyst",
    "Nursery Manager",
    "Food Service Manager",
    "Substance Abuse Counsellor",
    "Quantum Cryptographic Engineer",
    "Healthcare AI Systems Developer",
    "Quantum Computing Researcher",
    "Chemical Engineer",
    "Blockchain Smart Contract Security Auditor",
    "Correctional Officer",
    "AI Infrastructure Engineer",
    "Quantum Quantum Environmental Scientist",
    "Copywriting",
    "Healthcare AI Integration Specialist",
    "AI-Enhanced Cybersecurity Engineer",
    "AI-driven Conversational AI Developer",
    "Dentist",
    "AI-Optimized Software Architect",
    "Training & Development Manager",
    "Satellite Communication Systems Engineer",
    "Social Worker",
    "Satellite Image Processing Engineer",
    "Quantum Social Scientist",
    "Blockchain Digital Identity Specialist",
    "Principal",
    "Machine Learning Hardware Engineer",
    "Satellite Ground Station Engineer",
    "Police Officer",
    "Astronaut",
    "Software Developer",
    "Agricultural Technician",
    "AI-Optimized Hardware Design Specialist",
    "AI-driven Autonomous Systems Engineer",
    "RTOS Firmware Engineer",
    "AI-driven Supply Chain Traceability Analyst",
    "Quantum Quantum Biologist",
    "Quantum Aerospace Engineer",
    "Humanoid Robotics Engineer",
    "AI/ML Researcher",
    "Satellite Antenna Systems Engineer",
    "Embedded Systems Engineer",
    "IT Auditor",
    "Sales Engineer",
    "Blockchain Renewable Energy Solutions Architect",
    "Quantum Quantum Cognitive Computing Engineer",
    "AI-Optimized Network Security Analyst",
    "Content Creator",
    "Quantum Machine Translation Scientist",
    "AI-driven Supply Chain Optimization Engineer",
    "Data Center Architect",
    "Astrodynamics Engineer",
    "Blockchain Smart City Architect",
    "IT Specialist",
    "Quantum Computing Research Engineer",
    "Quantum Information Scientist",
    "Logistics Manager",
    "Full Stack Engineer",
    "Blockchain Solutions Architect",
    "Reporter",
    "Administrative Services Manager",
    "Blockchain Engineer",
    "Flight Attendant",
    "Natural Language Processing Engineer",
    "Quantum Cryptanalyst",
    "Blockchain Identity Verification Analyst",
    "Landscape Architect",
    "Space Debris Analyst",
    "Scrum Master",
    "Quantum Robotics Engineer",
    "Legal Secretary",
    "Biological Data Engineer",
    "Quantum Machine Learning Research Scientist",
    "Satellite Attitude Determination and Control Engineer",
    "AI Platform Engineer",
    "Investment Underwriter",
    "Quantum Neural Network Scientist",
    "Satellite Systems Integration Analyst",
    "Database Analyst",
    "Edge Computing Engineer",
    "Spacecraft Systems Engineer",
    "Satellite Software Developer",
    "Quantum Quantum Astrophysicist",
    "AI-Enhanced GIS Developer",
    "Set Designer",
    "Quantum Simulation Engineer",
    "Quantum Machine Learning Scientist",
    "Wireless Network Security Engineer",
    "UX Researcher",
    "AI in Digital Marketing Automation Developer",
    "Space Robotics Engineer",
    "AI-powered Autonomous Drone Systems Engineer",
    "cloud architect",
    "AI System Administrator",
    "AI-powered Virtual Reality Interaction Designer",
    "Quantum Astrophysicist",
    "Insurance Sales Agent",
    "Embedded Security Engineer",
    "Network Security Analyst",
    "Biometric Security Engineer",
    "Healthcare AI Systems Integration Specialist",
    "Locomotive Engineer",
    "AI-Enhanced Robotics Engineer",
    "Quantum Information Security Engineer",
    "Satellite Radiation Protection Engineer",
    "Aerospace Materials Engineer",
    "Industrial IoT Security Analyst",
    "Aerospace Engineer",
    "Android App Developer",
    "Blockchain Healthcare Solutions Architect",
    "Satellite Systems Security Engineer",
    "Purchasing Manager",
    "Neuromorphic Computing Engineer",
    "Embedded Linux Systems Engineer",
    "Biomechanics Software Engineer",
    "Mobile Application Tester",
    "Quantum Cognitive Scientist",
    "Geospatial Data Scientist",
    "Neural Network Hardware Engineer",
    "Blockchain Music Streaming Developer",
    "IT Compliance Analyst",
    "Cloud Data Architect",
    "Quantum Error Correction Scientist",
    "Edge AI Developer",
    "Quantum Software Engineer",
    "Quantum Software Security Analyst",
    "Cyber Security Professionals",
    "Human Genome Editing Specialist",
    "Blockchain Tokenized Art Solutions Architect",
    "Robotics Vision Engineer",
    "Animator",
    "Quantum Machine Learning Engineer",
    "Transportation Manager",
    "Blockchain Supply Chain Analyst",
    "Healthcare AI Systems Engineer",
    "Secure Mobile App Developer",
    "Blockchain Security Engineer",
    "Clinical Informatics Specialist",
    "AI-driven Cyber Physical Systems Engineer",
    "AI-driven Augmented Reality Interaction Designer",
    "Composer",
    "Secure Software Development Engineer",
    "Judge",
    "Animal Trainer",
    "Quantum Cybersecurity Analyst",
    "Management Analyst",
    "Blockchain Digital Music Streaming Developer",
    "Middle School Teacher",
    "IT Support Specialist",
    "Digital Agriculture Solutions Developer",
    "Electrical Engineer",
    "Conversational AI Engineer",
    "Quantum Communication Engineer",
    "Office Clerk",
    "Cloud Solutions Architect",
    "Aquacultural Manager",
    "Drone Software Developer",
    "Biometric Security Analyst",
    "Cloud Security Architect",
    "Biomedical Signal Processing Engineer",
    "Data Warehouse Architect",
    "Administrative Assistant",
    "IT Technician",
    "Nuclear Technician",
    "Clinical Data Manager",
    "Healthcare AI Quality Assurance Engineer",
    "DevOps Engineer",
    "Tutor",
    "Robotics Technician",
    "Quantum Hardware Verification Engineer",
    "AI-Optimized UX/UI Designer",
    "Singer",
    "Electrician",
    "Lifeguard",
    "Quantum Data Scientist",
    "Systems Analyst",
    "Cloud Data Engineer",
    "React Developer",
    "Occupational Therapist",
    "iOS App Developer",
    "Machinist",
    "Healthcare AI Deployment Engineer",
    "Product Safety Engineer",
    "Postsecondary Teacher",
    "Travel Agent",
    "Blockchain Cryptocurrency Trading Platform Developer",
    "AI/ML Engineer",
    "Network Security Engineer",
    "Blockchain Security Analyst",
    "Camera Operator",
    "Technical Writer",
    "Blockchain Tokenization Specialist",
    "Renewable Energy Systems Engineer",
    "Labour Relations Specialist",
    "Blockchain Developer",
    "Spacecraft Navigation Engineer",
    "Microbiologist",
    "Blockchain Renewable Energy Analyst",
    "Neurotechnology Researcher",
    "Quantum Machine Learning Operations Specialist",
    "Quantum Quantum Chemist",
    "Satellite Command and Data Handling Engineer",
    "AI-powered Human Augmentation Engineer",
    "Gaming Manager",
    "Laboratory Animal Caretaker",
    "Blockchain Precision Agriculture Solutions Architect",
    "Teller",
    "Natural Language Processing Scientist",
    "Blockchain Aerospace Engineer",
    "AI-Enhanced Drone Software Developer",
    "Freight Forwarder",
    "Pr Manager",
    "Proofreader",
    "Talent Director",
    "Satellite Propulsion Systems Engineer",
    "Bioelectronic Medicine Engineer",
    "Healthcare Data Scientist",
    "VR Content Developer",
    "Satellite Systems Security Analyst",
    "AI-Optimized Cyber-Physical Systems Engineer",
    "Satellite Ground Systems Engineer",
    "Virtual Reality Developer",
    "Electronics Engineering Technician",
    "Healthcare Robotics Engineer",
    "Quantum Quantum Physicist",
    "Floral Designer",
    "Quantum Computing Hardware Engineer",
    "Satellite Power Systems Engineer",
    "Virtual Reality Software Engineer",
    "Human-Robot Interaction Specialist",
    "Licensing Examiner",
    "Sports Scout",
    "Beautician",
    "AI-powered Gaming Experience Designer",
    "Satellite Thermal Design Engineer",
    "Blockchain Data Governance Specialist",
    "Frontend Architect",
    "Human Augmentation Engineer",
    "Systems Engineer",
    "Quantum Software Compiler Engineer",
    "Computer Programmer",
    "Artillery & Missile Crew Member",
    "Satellite Attitude Control Engineer",
    "Blockchain Food Safety Analyst",
    "Product manager",
    "iOS App Architect",
    "Biometric Authentication Engineer",
    "Trading",
    "Quantum Machine Learning Research Specialist",
    "VR Simulation Engineer",
    "IT Network Administrator",
    "Bioinformatics Software Engineer",
    "Quantum Ecologist",
    "Mobile App Tester",
    "Network Systems Administrator",
    "Blockchain Smart Contract Development Engineer",
    "Blockchain Quality Assurance Engineer",
    "Wind Energy Engineer",
    "Blockchain Digital Identity Verification Specialist",
    "Geospatial Data Analyst",
    "IT Risk Analyst",
    "AI-Integrated Manufacturing Engineer",
    "Blockchain Human Resources Analyst",
    "AI-driven Mental Health Tech Developer",
    "AI-driven Industrial Robotics Engineer",
    "AI-powered Smart Home Automation Developer",
    "Quantum Computing Software Engineer",
    "Marketing Manager",
    "Telemedicine Software Developer",
    "Legislator",
    "Data Privacy Manager",
    "Database Architect",
    "Armoured Assault Vehicle Crew",
    "Database Developer",
    "System Architect",
    "Customs Inspector",
    "AI-Integrated Cyber-Physical Systems Engineer",
    "Data Warehouse Manager",
    "Chief Executive",
    "Fire Investigator",
    "Blockchain Developer Advocate",
    "Cloud Architect",
    "Lawyer",
    "Acquisitions Manager",
    "VLSI Design Engineer",
    "Healthcare AI Applications Developer",
    "Blockchain Digital Asset Manager",
    "Hr Manager",
    "Career Counsellor",
    "Quantum Quantum Meteorologist",
    "Mobile Game Developer",
    "Musician",
    "Blockchain Decentralized Finance (DeFi) Developer",
    "VR Simulator Engineer",
    "AI-powered Cybersecurity Analyst",
    "Backend Engineer",
    "Art Therapist",
    "DevOps Automation Architect",
    "AI-Enhanced Biomedical Imaging Scientist",
    "AI-powered Sentiment Analysis Developer",
    "Blockchain Smart Contract Developer",
    "IoT Firmware Engineer",
    "Management Consultant",
    "IoT Chip Design Engineer",
    "Quantum Quantum Ecologist",
    "Blockchain Solutions Engineer",
    "Ethical Hacking",
    "Tailor",
    "Nurse",
    "Quantum Software Security Engineer",
    "Data Governance Manager",
    "Gaming Dealer",
    "Epidemiological Data Scientist",
    "Cloud Data Scientist",
    "Satellite Systems Integration Engineer",
    "Genomic Data Analyst",
    "Fashion Designer",
    "AI-Enhanced Cybersecurity Analyst",
    "Quantum Machine Learning Applications Developer",
    "Health Informatics Data Analyst",
    "Quantum Internet Security Engineer",
    "Surveyor",
    "Spa Manager",
    "AI-Optimized Network Engineer",
    "AI Research Engineer",
    "Blockchain Integration Developer",
    "Bailiff",
    "Satellite Command and Control Engineer",
    "Genomic Data Privacy Analyst",
    "AI-powered Virtual Assistant Developer",
    "Graphic Designer",
    "Frontend Engineer",
    "Blockchain Sports Betting Developer",
    "Quantum Network Engineer",
    "IT Analyst",
    "Elementary School Teacher",
    "AI in Industrial Internet of Things (IIoT) Engineer",
    "Satellite Thermal Analysis Engineer",
    "Bartender",
    "Film & Video Editor",
    "Quantum Machine Learning Security Analyst",
    "Quantum Quantum Environmental Engineer",
    "Quantum Quantum Information Scientist",
    "Loan Officer",
    "Autonomous Drone Engineer",
    "AI-Optimized Data Engineer",
    "AI Platform Architect",
    "Satellite Electrical Power Systems Engineer",
    "UX/UI Designer",
    "Machine Assembler",
    "Information Security Analyst",
    "Craft Artist",
    "Veterinary Technologist",
    "VR UX/UI Designer",
    "Dietitian",
    "Systems Administrator",
    "Vue.js Developer",
    "Quantum Quantum Computing Engineer",
    "Correspondence Clerk",
    "AI-powered Video Game Developer",
    "Cloud Administrator",
    "Healthcare AI Systems Integration Engineer",
    "Fine Artist",
    "Conversational AI Research Scientist",
    "Database Systems Manager",
    "Rehabilitation Counsellor",
    "Bioinformatics Algorithm Developer",
    "Water Engineer",
    "Genomic Data Scientist",
    "AI-driven Computational Linguist",
    "AI-driven Customer Service Automation Developer",
    "Construction & Building Inspector",
    "Database Administrator",
    "AI-driven Computer Vision Researcher",
    "Blockchain Decentralized Energy Grid Solutions Architect",
    "Quantum Quantum Optics Scientist",
    "Quantum Information Theory Scientist",
    "Actuary",
    "Quantum Algorithms Developer",
    "Radio Operator",
    "Quantum Biology Researcher",
    "Systems Software Developer",
    "Cybersecurity Incident Responder",
    "Fitness & Wellness Coordinator",
    "Athletic Trainer",
    "Wireless Communication Engineer",
    "Zoologist",
    "Healthcare AI Risk Management Specialist",
    "Neuroinformatics Scientist",
    "Umpire",
    "Blockchain Gaming Developer",
    "Satellite Systems Engineer",
    "Chiropractor",
    "Firmware Engineer",
    "Blockchain Legal Consultant",
    "Maritime Pilot",
    "Blockchain Solutions Developer",
    "AI-powered Image Recognition Engineer",
    "Cybersecurity Analyst",
    "Space Communications Engineer",
    "Quantum Machine Learning Operations Engineer",
    "Quantum Software Verification Engineer",
    "Backend Architect",
    "AI Ops Engineer",
    "Quantum Cloud Security Engineer",
    "Financial Analyst",
    "Industrial Designer",
    "AI-Optimized Hardware Design Engineer",
    "Paralegal",
    "UI/UX Developer",
    "Sustainability Specialist",
    "AI-driven Natural Language Generation Engineer",
    "Food Scientist",
    "Computer Vision Engineer",
    "Edge AI Chip Design Engineer",
    "Athlete",
    "Childcare Worker",
    "Healthcare AI Systems Architect",
    "Biometric Health Monitoring Engineer",
    "Preschool Teacher",
    "AI-Driven Drug Discovery Scientist",
    "Retail Salesperson",
    "Machine Learning Engineer",
    "Environmental Engineer",
    "Blockchain DevOps Engineer",
    "Satellite Propulsion Engineer",
    "Machine Learning Operations (MLOps) Engineer",
    "AI-driven Financial Analyst",
    "AI-driven Drug Discovery Scientist",
    "Cloud-Native AI Engineer",
    "UI/UX Designer",
    "AI-Optimized Embedded Systems Engineer",
    "AI-Optimized Hardware Design Analyst",
    "Voice User Interface (VUI) Designer",
    "Healthcare Robotics Software Engineer",
    "Concierge",
    "Baker",
    "Skincare Specialist",
    "Mechanical Engineer",
    "Artificial Intelligence Professionals",
    "Quantum Machine Learning Security Specialist",
    "Blockchain Non-Fungible Token (NFT) Gaming Developer",
    "AI in Human-Computer Interaction Specialist",
    "Medical Appliance Technician",
    "Network Engineer",
    "AI-Optimized Embedded Systems Analyst",
    "Information Clerk",
    "Criminal Investigator",
    "Roustabout",
    "Network Administrator",
    "Green Marketer",
    "Quantum Neuromorphic Computing Engineer",
    "Satellite Thermal Testing Engineer",
    "Geoscientist",
    "Construction Manager",
    "Airline Pilot",
    "Healthcare AI Systems Engineering Analyst",
    "Quantum Internet Engineer",
    "Speech Synthesis Engineer",
    "Blockchain Smart Logistics Solutions Architect",
    "Interior Designer",
    "Animal Scientist",
    "IT Security Consultant",
    "Physicist",
    "AI-driven Weather Forecasting Scientist",
    "It Project Manager",
    "AI-Optimized Embedded Software Engineer",
    "Desktop Support Technician",
    "Accountant",
    "Quantum Optics Scientist",
    "IT Consultant",
    "Fitness Trainer",
    "Radar & Sonar Operator",
    "Data Engineer",
    "Embedded Software Engineer",
    "Business Intelligence Analyst",
    "Translator",
    "AI-Optimized Database Administrator",
    "Biophotonics Engineer",
    "Health Educator",
    "Quantum Cloud Architect",
    "Quantum Quantum Materials Scientist",
    "Robotic Process Automation (RPA) Developer",
    "Midwife",
    "Data Privacy Analyst",
    "Quantum Circuit Designer",
    "Aircrew Member",
    "Nuclear Engineer",
    "AI-powered Content Creation Developer",
    "Blockchain Aviation Solutions Architect",
    "Software Development Manager",
    "Advertising Account Executive",
    "IT Operations Manager",
    "Satellite Navigation Systems Engineer",
    "Actor",
    "Event Planner",
    "Cloud Security Engineer",
    "Backend Developer",
    "Veterinary Assistant",
    "Healthcare AI Infrastructure Engineer",
    "Intelligence Analyst",
    "QA Engineer",
    "Computer Vision Scientist",
    "Gas Plant Operator",
    "AI-Optimized Network Security Specialist",
    "Surgeon",
    "Coroner",
    "SEO - Software Engine Optimisation",
    "Quantum Cryptography Engineer",
    "AI-Driven Space Exploration Scientist",
    "AI Infrastructure Architect",
    "Sports Book Writer",
    "Air Traffic Controller",
    "IT Security Specialist",
    "Quantum Cloud Computing Engineer",
    "Firefighter",
    "Fundraiser",
    "AI Architect",
    "Mental Health Counsellor",
    "Android App Architect",
    "Satellite Thermal Systems Engineer",
    "Data Scientist",
    "Broadcast News Analyst",
    "Pharmacist",
    "Healthcare AI DevOps Engineer",
    "AI Ethics Consultant",
    "Blockchain Integration Architect",
    "DevOps Specialist",
    "Natural Language Processing Researcher",
    "Archaeologist",
    "AI-Optimized Embedded Systems Specialist",
    "Librarian",
    "Nail Technician",
    "AI-Enhanced Materials Scientist",
    "Forester",
    "Civil Engineer",
    "Plumber",
    "Data Governance Analyst",
    "Biorobotics Engineer",
    "Blockchain Real Estate Solutions Architect",
    "Retail Buyer",
    "Farm Manager",
    "Quantum Atmospheric Scientist",
    "AI Ethics Researcher",
    "Blockchain Climate Solutions Developer",
    "Market Research Analyst",
    "Palaeontologist",
    "IT Project Coordinator",
    "Quantum Environmental Scientist",
    "Biomechanical Engineer",
    "FPGA Design Engineer",
    "AI-powered Chatbot Developer",
    "Full Stack Architect",
    "Security Guard",
    "Bioinformatics Software Developer",
    "VR Content Designer",
    "IT Systems Engineer",
    "Healthcare AI Project Manager",
    "Angular Developer",
    "Satellite Thermal Design Analyst",
    "IT Service Desk Analyst",
    "Quantum Machine Learning Research Engineer",
    "AI-powered Robotic Surgery Engineer",
    "Ethical Hacker",
    "Architect",
    "Infantry",
    "QA Automation Engineer",
    "Autonomous Vehicle Software Engineer",
    "Industrial Engineer",
    "Art Director",
    "Cyber Security Expert",
    "Wind Turbine Service Technician",
    "AI-powered Cloud Security Analyst",
    "Psychiatrist",
    "Choreographer",
    "Embedded AI Systems Engineer",
    "Quantum Quantum Nuclear Physicist",
    "IT Support Engineer",
    "Healthcare AI Research Scientist",
    "AI-driven Remote Sensing Specialist",
    "Blockchain Network Administrator",
    "AI-powered Fraud Detection Specialist",
    "Frontend Developer",
    "Non Farm Animal Caretaker",
    "Quantum Machine Vision Engineer",
    "AI-Optimized Network Security Engineer",
    "Command & Control Specialist",
    "Automotive Service Technician",
    "Quality Assurance Engineer",
    "Financial Manager",
    "Data Analyst",
    "Merchandise Displayer",
    "Healthcare AI Systems Integration Analyst",
    "Data Privacy Officer",
    "Dancer",
    "Quantum Machine Learning Operations Analyst",
    "AI-Optimized Blockchain Engineer",
    "IT Project Manager",
    "Director",
    "AI-Enhanced Robotics Software Engineer",
    "Blockchain Healthcare Interoperability Specialist",
    "Machine Learning Ops Engineer",
    "Quantum Machine Learning Research Analyst",
    "Bioelectrical Engineer",
    "Edge AI Hardware Engineer",
    "AI-powered Human Genome Editing Specialist",
    "Blockchain Education Solutions Architect",
    "Advertising Manager",
    "Full Stack Developer",
    "AI-driven Human Resources Consultant",
    "Satellite Payload Systems Engineer",
    "Space Data Scientist",
    "Veterinary Technician",
    "IT Coordinator",
    "AI-powered Computational Biologist",
    "Data Integration Specialist",
    "Compensation Manager",
    "Big Data Analyst",
    "Quantum Information Systems Architect",
    "Mobile App Developer",
    "Exhibit Designer",
    "IT Trainer",
    "Court Reporter",
    "Satellite Structural Analysis Engineer",
    "Chef",
    "VR Game Developer",
    "Fish & Game Warden",
    "Cloud Data Platform Architect",
    "Healthcare AI Systems Analyst",
    "Geospatial Analyst",
    "Blockchain Healthcare Data Analyst",
    "File Clerk",
    "Quantum Cryptocurrency Developer",
    "Cybersecurity Researcher",
    "Blockchain Anti-Counterfeiting Solutions Architect",
    "AI-driven Autonomous Vehicle Control Engineer",
    "Hairdresser",
    "AI System Engineer",
    "Quantum Machine Learning Security Engineer",
    "Blockchain Smart Legal Contracts Developer",
    "Software Engineer",
    "Healthcare AI Ethics Consultant",
    "Satellite Thermal Control Engineer",
    "Blockchain Tokenized Real Estate Solutions Architect",
    "Special Forces Officer",
    "Astronomer",
    "5G Network Engineer",
    "Auditor",
    "Tour Guide",
    "Digital Twin Architect",
    "VR Interaction Designer",
    "Audiologist",
    "Tax Preparer",
    "Pr Specialist",
    "Blockchain Fashion Tech Developer",
    "AI-powered Robotic Process Automation (RPA) Developer",
    "Linux System Administrator",
    "Data Science Architect",
    "Music Director",
    "Healthcare AI Regulatory Affairs Specialist",
    "Carpenter",
    "Power Plant Operator",
    "Customer Service Representative",
    "Blockchain Regulatory Compliance Consultant",
    "Editor",
    "Robotic Vision Engineer",
    "Sales Manager",
    "AI in Cyber-Physical Systems Engineer",
    "Animal Breeder",
    "Cloud Engineer",
    "AI Model Deployment Engineer",
    "Network Forensic Analyst",
    "Lodging Manager",
    "Augmented Reality Software Developer",
    "Quantum Error Correction Engineer",
    "Computer Network Architect",
    "Conversational AI Solutions Architect",
    "Petroleum Engineer",
    "Hardware Security Engineer",
    "Sports Coach",
    "Real Estate Sales Agent",
    "Blockchain Sustainable Agriculture Solutions Architect",
    "AR/VR Developer",
    "AI-Optimized Hardware Engineer",
    "Special Education Teacher",
    "Photographer",
    "Quantum Quantum Architectural Designer",
    "Veterinarian",
    "Blockchain Smart City Data Analyst",
    "Massage Therapist",
    "Blockchain Technical Writer",
    "Quantum Computing Software Developer",
    "Quantum Materials Scientist",
    "Edge Computing Security Engineer",
    "Healthcare AI Product Manager",
    "Paramedic",
    "Writer",
    "Blockchain Social Impact Developer",
    "Quantum Compiler Engineer",
    "Quantum Quantum String Theorist",
    "Blockchain Aviation Security Analyst",
    "Quantum Quantum Marine Biologist",
    "Edge Computing Systems Architect",
    "AI Chatbot Developer",
    "Healthcare Data Privacy Specialist",
    "Quantum Algorithms Researcher",
    "Promotions Manager",
    "Satellite Thermal Control Systems Engineer",
    "Dressmaker",
    "Quantum Quantum Cognitive Scientist",
    "Augmented Reality Engineer",
    "Blockchain Systems Analyst",
    "AI-powered Financial Fraud Detection Specialist",
    "Geospatial Data Engineer",
    "Community Health Worker",
    "Quantum Cryptography Researcher",
    "Game Developer",
    "Quantum Chemistry Researcher",
    "Data Science Manager",
    "Web Developer",
    "Autonomous Vehicle Control Engineer",
    "Food Science Technician",
    "Web Administrator",
    "Blockchain Integration Specialist",
    "Marriage & Family Therapist",
    "Healthcare AI Systems Development Analyst",
    "Quantum Materials Engineer",
    "Exascale Computing Researcher",
    "Cyber-Physical Systems Engineer",
    "Radio & Tv Announcer",
    "Telemarketer",
    "Iot Solution Architect",
    "AI-powered Personalized Medicine Developer",
    "Space Telemetry Engineer",
    "Cybersecurity Engineer",
    "Patient Representative",
    "Cloud Solutions Engineer",
    "Urban Planner",
    "Mayor",
    "Producer",
    "Space Weather Scientist",
    "Chemical Technician"
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
                        'What do you ',
                        MyApp.secondary,
                        24.0,
                        EdgeInsets.fromLTRB(25, 10, 0, 15),
                        FontWeight.w500,
                        FontStyle.normal),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 15),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 32,
                        fontFamily: 'Aeonik',
                        fontWeight: FontWeight.bold,
                        color: MyApp.secondary,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(' ASPIRE'),
                          FadeAnimatedText(' DREAM'),
                          FadeAnimatedText(' BELIEVE'),
                        ],
                        onTap: () {
                          print("Tap Event");
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: customText(
                        'to be ?',
                        MyApp.secondary,
                        24.0,
                        EdgeInsets.fromLTRB(10, 10, 0, 20),
                        FontWeight.w500,
                        FontStyle.normal),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
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
                    labelText: 'Search your Match',
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
              SizedBox(
                height: 10,
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
                  selectedSkill != ""
                      ? Container(
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
                                selectedSkill,
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 4.0),
                            ],
                          ),
                        )
                      : Container(),
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
                        context.go('/aspirantscard');
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
