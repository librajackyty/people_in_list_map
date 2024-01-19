import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:people_in_list_map/models/people.dart';
import 'package:people_in_list_map/services/peoplelist_service.dart';
import 'package:people_in_list_map/widgets/custom_button_normal.dart';
import 'package:transparent_image/transparent_image.dart';

// import '../utils/assetslink.dart';
import '../utils/constants.dart';
import '../widgets/custom_card_container.dart';
import '../widgets/custom_scroll_bar.dart';
import '../widgets/custom_text_normal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<People>? peoplelist;

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

  Future<List<People>?> loadPeopleList() async {
    final peopleListService = PeopleListService();
    peoplelist = await peopleListService.getPeopleList();
    debugPrint("HomePage::loadPeopleList list fetched");
    return peoplelist;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadPeopleList(),
        builder: (BuildContext context, AsyncSnapshot<List<People>?> snapshot) {
          Widget child;
          if (snapshot.connectionState == ConnectionState.waiting) {
            debugPrint("HomePage::FutureBuilder ConnectionState.waiting");
            child = const Center(
              key: ValueKey(0),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            debugPrint("HomePage::FutureBuilder ConnectionState.done");
            List<People>? pl = snapshot.data;
            child = Center(
              key: const ValueKey(1),
              child: CusScrollbar(
                  child: ListView.builder(
                      itemCount: pl?.length,
                      itemBuilder: (_, index) {
                        if (pl != null && pl.isNotEmpty) {
                          var person = pl[index];
                          return CusCardContainer(
                              child: InkWell(
                                  borderRadius:
                                      BorderRadius.circular(cardsBorderRadius),
                                  onTap: () {
                                    debugPrint("Card Clicked");
                                  },
                                  child: Container(
                                      padding:
                                          const EdgeInsets.all(elementMPadding),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                cardsBorderRadius),
                                            topRight: Radius.circular(
                                                cardsBorderRadius)),
                                      ),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                              child: CachedNetworkImage(
                                                  width: circleImgBorderWH,
                                                  height: circleImgBorderWH,
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) =>
                                                      const Icon(Icons
                                                          .account_circle_outlined),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(
                                                          Icons.account_circle),
                                                  imageUrl: person.picture)),
                                          const SizedBox(
                                              width: elementMPadding),
                                          CusNText(person.name.full())
                                        ],
                                      ))));
                        }
                        return Container();
                      })),
            );
          } else {
            debugPrint("HomePage::FutureBuilder ${snapshot.connectionState}");
            child = Center(
              key: const ValueKey(2),
              child: CusNText('Error Occurred'),
            );
          }
          return Scaffold(
              key: const ValueKey(1),
              body: SafeArea(
                  child: Padding(
                      padding: const EdgeInsets.all(safeAreaPaddingAll),
                      child: Center(
                          child: AnimatedSwitcher(
                        duration: const Duration(seconds: 1),
                        child: child,
                      )))),
              bottomNavigationBar: BottomAppBar(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        child: TextButton(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CusNText(
                            "List View",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      onPressed: () => {},
                    )),
                    Expanded(
                        child: TextButton(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CusNText(
                            "Map View",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                      onPressed: () => {},
                    ))
                  ],
                ),
              ));
        });
  }
}
