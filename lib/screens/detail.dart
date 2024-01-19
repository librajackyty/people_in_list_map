import 'package:flutter/material.dart';
import 'package:people_in_list_map/models/person.dart';
import '../models/screen_arg.dart';
import '../utils/constants.dart';
import '../widgets/custom_card_itm_person.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title, this.arg});

  final String title;
  final ScreenArg? arg;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Person? person = widget.arg?.person;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showDetail();
    });
    super.initState();
  }

  void goBack() {
    if (context.mounted) {
      Navigator.pop(context);
    }
  }

  void showDetail() {
    Future.delayed(const Duration(seconds: 0)).then((_) {
      if (person != null) {
        PersistentBottomSheetController controller =
            _scaffoldKey.currentState!.showBottomSheet((context) {
          return SizedBox(
              height: 130,
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: safeAreaPaddingAll,
                      right: safeAreaPaddingAll,
                      bottom: safeAreaPaddingAll),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CusCardItmPerson(person!, displayAll: true)
                      ],
                    ),
                  )));
        });
        controller.closed.then((value) => goBack());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(safeAreaPaddingAll),
            child: Center(
              child: Container(),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: FloatingActionButton(
            onPressed: goBack,
            elevation: 20.0,
            tooltip: "Go back",
            child: const Icon(Icons.arrow_back_rounded)));
  }
}
