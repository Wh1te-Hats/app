import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Aspirants/roadmap.dart';
import 'package:pragati_v1/Aspirants/typesOfAspirants.dart';
import 'package:pragati_v1/Models/aptitude.dart';
import 'package:pragati_v1/Pages/Aptitude/currentAnalysis.dart';
import 'package:pragati_v1/Pages/Aptitude/general_aptitude.dart';
import 'package:pragati_v1/Pages/Aptitude/mcqTest.dart';
import 'package:pragati_v1/Pages/Aptitude/aptitudeHome.dart';
import 'package:pragati_v1/Pages/CareerGuide/careerInfo.dart';
import 'package:pragati_v1/Pages/CareerGuide/skills.dart';
import 'package:pragati_v1/Pages/Chatbot/chatbot.dart';
import 'package:pragati_v1/Pages/Colleges/collegeInfo.dart';
import 'package:pragati_v1/Pages/Colleges/collegeList.dart';
import 'package:pragati_v1/Pages/Colleges/typesOfColleges.dart';
import 'package:pragati_v1/Pages/Dashboard/dashboard.dart';
import 'package:pragati_v1/Pages/Exams/examDetails.dart';
import 'package:pragati_v1/Pages/Exams/typesOfExam.dart';
import 'package:pragati_v1/Pages/Jobs/jobInfo.dart';
import 'package:pragati_v1/Pages/Jobs/jobList.dart';
import 'package:pragati_v1/Pages/Jobs/jobUserInfo.dart';
import 'package:pragati_v1/Pages/StreamBased/streamDetails.dart';
import 'package:pragati_v1/Pages/signIn.dart';
import 'package:pragati_v1/Pages/welcome.dart';
import 'package:pragati_v1/Routes/error_page.dart';
import 'package:pragati_v1/Pages/userInfo.dart';
import 'package:pragati_v1/Pages/home.dart';
import 'package:pragati_v1/Widgets/splashScreen.dart';


import '../Pages/CareerGuide/typesOfCareer.dart';
import '../Pages/StreamBased/typesOfStream.dart';

// import 'welcome_page.dart';
int flag = 0;

final GoRouter router = GoRouter(
  navigatorKey: GlobalKey<NavigatorState>(),
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (
        BuildContext context,
        GoRouterState state,
      ) =>
         SplashScreen(),
        // UserInfoPage(),
      routes: <GoRoute>[
        GoRoute(
          path: 'welcome',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: WelcomePage(),
          ),
        ),
         GoRoute(
          path: 'signin',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: SignIn(),
          ),
        ),
        GoRoute(
          path: 'user',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: UserInfoPage(),
          ),
        ),
        GoRoute(
          path: 'home',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              MaterialPage(
            child: HomePage(),
          ),
        ),
        GoRoute(
          path: 'aptitudeHome',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              MaterialPage(
            child: AptitudeHome(),
          ),
        ),
        GoRoute(
          path: 'generalAptitude',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              MaterialPage(
            child: GeneralAptitude(),
          ),
        ),
        GoRoute(
          path: 'test',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(
              child: mcqTest(topic: state.extra as String),
            );
          },
        ),
        GoRoute(
          path: 'currentAnalysis',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: CurrentAnalysis(questions: state.extra as List<Question>),
          ),
        ),
        GoRoute(
          path: 'skills',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              MaterialPage(
            child: SkillsPage(),
          ),
        ),
        GoRoute(
          path: 'typesOfColleges',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: typesOfCollege(),
          ),
        ),
        GoRoute(
            path: 'collegeList',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return MaterialPage(
                child: collegeList(endpointURL: state.extra as String),
              );
            }),
        GoRoute(
          path: 'typesOfStream',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: typesOfStream(),
          ),
        ),
        GoRoute(
          path: 'streamDetails',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: streamDetails(endpointURL: state.extra as String),
          ),
        ),
        GoRoute(
          path: 'typesOfCareer',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: typesOfCareer(skillList: state.extra as List<String>),
          ),
        ),
        GoRoute(
          path: 'collegeInfo',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: CollegeInfoPage(),
          ),
        ),
        GoRoute(
          path: 'careerInfo',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: CareerInfo(),
          ),
        ),
        GoRoute(
          path: 'jobInfo',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: jobInfo(),
          ),
        ),
        GoRoute(
          path: 'jobList',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: jobList(jobUserInfo: state.extra as List<String>),
          ),
        ),
        GoRoute(
          path: 'jobUserInfo',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: jobUserInfo(),
          ),
        ),
        GoRoute(
          path: 'typesOfExams',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: typesOfExam(),
          ),
        ),
        GoRoute(
          path: 'chatbot',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: Chatbot(),
          ),
        ),
        GoRoute(
          path: 'examDetails',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: examDetails(),
          ),
        ),
        GoRoute(
          path: 'typesOfAspirants',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: typesOfAspirants(),
          ),
        ),
        GoRoute(
          path: 'roadmap',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: RoadMap(selectedSkill: state.extra as String),
          ),
        ),
        GoRoute(
          path: 'dashboard',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: DashBoard(),
          ),
        ),
      ],
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: ErrorPage(exception: state.error),
  ),
);
