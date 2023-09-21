import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Pages/Aptitude/currentAnalysis.dart';
import 'package:pragati_v1/Pages/Aptitude/general_aptitude.dart';
import 'package:pragati_v1/Pages/Aptitude/mcqTest.dart';
import 'package:pragati_v1/Pages/Aptitude/aptitudeHome.dart';
import 'package:pragati_v1/Pages/CareerGuide/skills.dart';
import 'package:pragati_v1/Pages/Colleges/collegeInfo.dart';
import 'package:pragati_v1/Pages/Colleges/collegeList.dart';
import 'package:pragati_v1/Pages/Colleges/typesOfColleges.dart';
import 'package:pragati_v1/Pages/StreamBased/streamDetails.dart';
import 'package:pragati_v1/Pages/getStarted.dart';
import 'package:pragati_v1/Pages/welcome.dart';
import 'package:pragati_v1/Routes/error_page.dart';
import 'package:pragati_v1/Pages/userInfo.dart';
import 'package:pragati_v1/Pages/home.dart';

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
          getStarted(),
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
              child: mcqTest(topic :state.extra as String ),
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
            child: CurrentAnalysis(),
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
      ],
    ),
  ],
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: ErrorPage(exception: state.error),
  ),
);
