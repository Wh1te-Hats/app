import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static List<String> menuTitles = [
    'Dashboard',
    'Courses',
    'Community',
    'Premium',
    'Logout'
  ];

  static List<String> icons = [
    'assets/images/dashboard.png',
    'assets/images/pen-2.png',
    'assets/images/community-2.png',
    'assets/images/premium.png',
    'assets/images/logout-2.png'
  ];

  static const _initialDelayTime = Duration(milliseconds: 50);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 50);
  static const _buttonDelayTime = Duration(milliseconds: 150);
  static const _buttonTime = Duration(milliseconds: 500);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * menuTitles.length) +
      _buttonDelayTime +
      _buttonTime;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];
  late Interval _buttonInterval;

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: (menuTitles.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyApp.primaryColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildFlutterLogo(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildFlutterLogo() {
    return const Positioned(
      right: -100,
      bottom: -30,
      child: Opacity(
        opacity: 0.2,
        child: FlutterLogo(
          size: 400,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        ..._buildListItems(),
        const Spacer(),
        _buildHelpButton(),
      ],
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < menuTitles.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(MyApp.primaryColor),
                  // shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //   // RoundedRectangleBorder(
                  //   //     borderRadius: BorderRadius.circular(00),
                  //   //     side: BorderSide(color: MyApp.secondary)),
                  // ),
                ),
                onPressed: () async {
                  if (i == 0) {
                    GoRouter.of(context).go('/dashboard');
                  } else if (i == 1) {
                    GoRouter.of(context).go('/skills');
                  } else if (i == 2) {
                    GoRouter.of(context).go('/communityChannel');
                  } else if (i == 3) {
                    GoRouter.of(context).go('/premium');
                  } else {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.remove('user_id');
                    await prefs.remove('grade');
                    await prefs.remove('name');

                    print('user_id removed from SharedPreferences');
                    GoRouter.of(context).go('/signin');
                  }
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Image.asset(
                          icons[i],
                          fit: BoxFit.cover,
                        ),
                      ),
                      customText(
                          menuTitles[i],
                          Colors.white,
                          24.0,
                          EdgeInsets.fromLTRB(10, 5, 0, 5),
                          FontWeight.w400,
                          FontStyle.normal),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 02,
                color: MyApp.secondary,
              ),
            ],
          ),
        ),
      );
    }
    return listItems;
  }

  Widget _buildHelpButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(80, 10, 10, 25),
      height: MediaQuery.of(context).size.height * 0.075,
      width: MediaQuery.of(context).size.width * 0.55,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.elasticOut.transform(
                _buttonInterval.transform(_staggeredController.value));
            final opacity = animationPercent.clamp(0.0, 1.0);
            final scale = (animationPercent * 0.5) + 0.5;

            return Opacity(
              opacity: opacity,
              child: Transform.scale(
                scale: scale,
                child: child,
              ),
            );
          },
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(MyApp.secondary),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              )),
            ),
            onPressed: () {
              context.go('/chatbot');
            },
            child: const Text(
              'Help ? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
