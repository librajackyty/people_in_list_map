import 'package:flutter/material.dart';

import 'package:page_transition/page_transition.dart';

import 'screens/landing.dart';
import 'utils/constants.dart' as constants;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: constants.pageRouteLanding,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case constants.pageRouteLanding:
            return PageTransition(
                child: const LandingPage(title: 'Landing'),
                type: PageTransitionType.fade);
          // case constants.pageRouteHome:
          //   return PageTransition(
          //       child: HomePage(
          //         title: 'Home',
          //         arg: settings.arguments as ReminderScreenArg?,
          //       ),
          //       type: PageTransitionType.fade);
        }
        return null;
      },
    );
  }
}
