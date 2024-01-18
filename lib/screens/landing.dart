import 'package:flutter/material.dart';
import 'package:people_in_list_map/widgets/custom_button_normal.dart';

// import '../utils/assetslink.dart';
import '../utils/constants.dart';
import '../widgets/custom_text_normal.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key, required this.title});

  final String title;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Future.delayed(const Duration(seconds: 2), goHome);
    // });
    super.initState();
  }

  void goHome() {
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(
          context, pageRouteHome, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(safeAreaPaddingAll),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CusNText("Landing Page"),
                CusNButton("Home", () {
                  
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
