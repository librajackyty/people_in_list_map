import 'package:flutter/material.dart';
import 'package:people_in_list_map/widgets/custom_button_normal.dart';

// import '../utils/assetslink.dart';
import '../utils/constants.dart';
import '../widgets/custom_text_normal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  void goToDetail() {
    if (context.mounted) {
      // Navigator.pushNamedAndRemoveUntil(
      //     context, pageRouteHome, (route) => false);
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
                CusNText("Home Page"),
                CusNButton("Show detail", () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
