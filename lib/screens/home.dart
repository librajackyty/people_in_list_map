import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:people_in_list_map/models/person.dart';
import 'package:people_in_list_map/services/personlist_service.dart';
import 'package:people_in_list_map/widgets/custom_button_normal.dart';
import 'package:people_in_list_map/widgets/custom_map.dart';
import 'package:transparent_image/transparent_image.dart';

// import '../utils/assetslink.dart';
import '../models/screen_arg.dart';
import '../utils/constants.dart';
import '../widgets/custom_card_container.dart';
import '../widgets/custom_card_itm_person.dart';
import '../widgets/custom_scroll_bar.dart';
import '../widgets/custom_text_normal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person>? peoplelist;

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void goToDetail(Person people) {
    if (context.mounted) {
      Navigator.pushNamed(context, pageRouteDetail,
          arguments: ScreenArg(people));
    }
  }

  Future<List<Person>?> loadPersonList() async {
    final peopleListService = PersonListService();
    peoplelist = await peopleListService.getPersonList();
    debugPrint("HomePage::loadPersonList list fetched");
    return peoplelist;
  }

  Widget loadingWidget() {
    return const Center(
      key: ValueKey(0),
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget peopleListWidget(AsyncSnapshot<List<Person>?> snapshot) {
    List<Person>? pl = snapshot.data;
    return Center(
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
                            goToDetail(person);
                          },
                          child: CusCardItmPerson(person)));
                }
                return Container();
              })),
    );
  }

  Widget peopleMapWidget(AsyncSnapshot<List<Person>?> snapshot) {
    List<Person>? pl = snapshot.data;
    CameraPosition initialCameraPosition =
        const CameraPosition(target: LatLng(0, 0), zoom: 12);
    Set<Marker> markers = {};
    if (pl != null && pl.isNotEmpty) {
      debugPrint("List pl loading map");
      for (Person e in pl) {
        if (e.location.latitude != null && e.location.longitude != null) {
          initialCameraPosition = CameraPosition(
              target:
                  LatLng(e.location.latitude ?? 0, e.location.longitude ?? 0),
              zoom: 12);
        }
        markers.add(Marker(
            markerId: MarkerId(e.id),
            position:
                LatLng(e.location.latitude ?? 0, e.location.longitude ?? 0),
            infoWindow: InfoWindow(title: e.name.full())));
      }
      debugPrint("List pl loading map markers :: ${markers.toString()}");
    }
    return CusMap(initialCameraPosition, markers);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadPersonList(),
        builder: (BuildContext context, AsyncSnapshot<List<Person>?> snapshot) {
          Widget child;
          Widget mapChild;
          if (snapshot.connectionState == ConnectionState.waiting) {
            debugPrint("HomePage::FutureBuilder ConnectionState.waiting");
            child = loadingWidget();
            mapChild = child;
          } else if (snapshot.connectionState == ConnectionState.done) {
            debugPrint("HomePage::FutureBuilder ConnectionState.done");
            child = peopleListWidget(snapshot);
            mapChild = peopleMapWidget(snapshot);
          } else {
            debugPrint("HomePage::FutureBuilder ${snapshot.connectionState}");
            child = Center(
              key: const ValueKey(2),
              child: CusNText('Error Occurred'),
            );
            mapChild = child;
          }
          return Scaffold(
              key: const ValueKey(1),
              body: _selectedIndex == 1
                  ? mapChild
                  : SafeArea(
                      child: Padding(
                          padding: const EdgeInsets.all(safeAreaPaddingAll),
                          child: Center(
                              child: AnimatedSwitcher(
                            duration: const Duration(seconds: 1),
                            child: child,
                          )))),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.list),
                    label: 'List View',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map),
                    label: 'Map View',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ));
        });
  }
}
