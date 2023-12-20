import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/courseList.dart';
import 'package:pragati_v1/Pages/Aptitude/chapters.dart';
import 'package:pragati_v1/Pages/Aptitude/courseBased.dart';
import 'package:pragati_v1/Pages/Aptitude/mcq2test.dart';
import 'package:pragati_v1/Pages/Aspirants/aspirantDetails.dart';
import 'package:pragati_v1/Pages/Aspirants/aspirantsCard.dart';
import 'package:pragati_v1/Pages/Aspirants/introPage.dart';
import 'package:pragati_v1/Pages/Aspirants/roadmap.dart';
import 'package:pragati_v1/Pages/Aspirants/typesOfAspirants.dart';
import 'package:pragati_v1/Models/aptitude.dart';
import 'package:pragati_v1/Models/career.dart';
import 'package:pragati_v1/Models/college.dart';
import 'package:pragati_v1/Pages/Aptitude/currentAnalysis.dart';
import 'package:pragati_v1/Pages/Aptitude/general_aptitude.dart';
import 'package:pragati_v1/Pages/Aptitude/mcqTest.dart';
import 'package:pragati_v1/Pages/Aptitude/aptitudeHome.dart';
import 'package:pragati_v1/Pages/CareerGuide/careerInfo.dart';
import 'package:pragati_v1/Pages/CareerGuide/ratings.dart';
import 'package:pragati_v1/Pages/CareerGuide/skills.dart';
import 'package:pragati_v1/Pages/Chatbot/chatbot.dart';
import 'package:pragati_v1/Pages/Colleges/collegeInfo.dart';
import 'package:pragati_v1/Pages/Colleges/collegeList.dart';
import 'package:pragati_v1/Pages/Colleges/typesOfColleges.dart';
import 'package:pragati_v1/Pages/Community/community_channel.dart';
import 'package:pragati_v1/Pages/Community/community_chat.dart';
import 'package:pragati_v1/Pages/Dashboard/dashboard.dart';
import 'package:pragati_v1/Pages/Exams/engExams.dart';
import 'package:pragati_v1/Pages/Exams/examDetails.dart';
import 'package:pragati_v1/Pages/Exams/govtExams.dart';
import 'package:pragati_v1/Pages/Exams/schoolExams.dart';
import 'package:pragati_v1/Pages/Exams/typesOfExam.dart';
import 'package:pragati_v1/Pages/Jobs/jobInfo.dart';
import 'package:pragati_v1/Pages/Jobs/jobList.dart';
import 'package:pragati_v1/Pages/Jobs/jobUserInfo.dart';
import 'package:pragati_v1/Pages/Premium/premium.dart';
import 'package:pragati_v1/Pages/Sliders/slider1.dart';
import 'package:pragati_v1/Pages/Sliders/slider2.dart';
import 'package:pragati_v1/Pages/Sliders/slider3.dart';
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
            child: typesOfCareer(list: state.extra as List<dynamic>),
          ),
        ),
        GoRoute(
          path: 'collegeInfo',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: CollegeInfoPage(collegeInfo: state.extra as college),
          ),
        ),
        GoRoute(
          path: 'careerInfo',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: CareerInfo(info: state.extra as CareerModel),
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
          path: 'aspirantsDetails',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: AspirantsDetails(index: state.extra as int),
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
            child: examDetails(route: state.extra as String ),
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
         GoRoute(
          path: 'courseBased',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: CourseBased(courseList: []),
          ),
        ),
         GoRoute(
          path: 'chapters',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: Chapters(list : state.extra as CourseList),
          ),
        ),
        GoRoute(
          path: 'premium',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: PremiumPage(),
          ),
        ),
         GoRoute(
          path: 'govtexams',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: GovtExams(),
          ),
        ),
         GoRoute(
          path: 'schoolexams',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: SchoolExams(),
          ),
        ),
         GoRoute(
          path: 'engexams',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: EngExams(),
          ),
        ),
        GoRoute(
          path: 'intropage',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: IntroPage(),
          ),
        ),
                GoRoute(
          path: 'aspirantsCard',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: AspirantsCard(),
          ),
        ),
          GoRoute(
          path: 'communityChat',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: CommunityChat(title: state.extra as String),
          ),
        ),
          GoRoute(
          path: 'communityChannel',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: Community(),
          ),
        ),
         GoRoute(
          path: 'slider1',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: Slider1(),
          ),
        ),
         GoRoute(
          path: 'slider2',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: Slider2(),
          ),
        ),
         GoRoute(
          path: 'slider3',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: Slider3(),
          ),
        ),
         GoRoute(
          path: 'test2',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: mcqTest2(postList: state.extra as List<dynamic>),
          ),
        ),
         GoRoute(
          path: 'ratings',
          pageBuilder: (
            BuildContext context,
            GoRouterState state,
          ) =>
              MaterialPage(
            child: Ratings(selectedList: state.extra as List<String>),
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
