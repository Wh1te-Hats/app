import 'package:flutter/material.dart';
import 'package:pragati_v1/Routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// Map<int, Color> color1 =
// {
// 50:Color.fromRGBO(10,30,46, .1),
// 100:Color.fromRGBO(10,30,46, .2),
// 200:Color.fromRGBO(10,30,46, .3),
// 300:Color.fromRGBO(10,30,46, .4),
// 400:Color.fromRGBO(10,30,46, .5),
// 500:Color.fromRGBO(10,30,46, .6),
// 600:Color.fromRGBO(10,30,46, .7),
// 700:Color.fromRGBO(10,30,46, .8),
// 800:Color.fromRGBO(10,30,46, .9),
// 900:Color.fromRGBO(10,30,46, 1),
// };

  final MaterialColor primarySwatch = MaterialColor(0x7E0A1E2E, {
    50: Color.fromRGBO(10, 30, 46, .1),
    100: Color.fromRGBO(10, 30, 46, .2),
    200: Color.fromRGBO(10, 30, 46, .3),
    300: Color.fromRGBO(10, 30, 46, .4),
    400: Color.fromRGBO(10, 30, 46, .5),
    500: Color.fromRGBO(10, 30, 46, .6),
    600: Color.fromRGBO(10, 30, 46, .7),
    700: Color.fromRGBO(10, 30, 46, .8),
    800: Color.fromRGBO(10, 30, 46, .9),
    900: Color.fromRGBO(10, 30, 46, 1),
  });
  // const MyApp({Key? key}) : super(key: key);

  static const String title = 'Pragati';
  static const Color primaryColor = Color.fromRGBO(10, 30, 46, 1.0);
  static const Color secondary = Color.fromRGBO(87, 199, 96, 1.0);

  MyApp({super.key});

  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

// static const Color backgroundColor =buildMaterialColor();
  // This widget is the root
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: MyApp.title,
      theme: ThemeData(
        unselectedWidgetColor: Colors.white,
        primarySwatch: primarySwatch,
        hintColor: MyApp.secondary,
        fontFamily: 'Aeonik',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Aeonik',
                fontSize: 18,
              ),
              button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Aeonik',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {


//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text(MyApp.title),),
//         body:Container(
//           child:HomePage(),
//         ),
//     );
//   }
// }
