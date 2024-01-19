import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:people_in_list_map/models/person.dart';
import '../models/screen_arg.dart';
import '../utils/constants.dart';
import '../widgets/custom_card_itm_person.dart';
import '../widgets/custom_map.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title, this.arg});

  final String title;
  final ScreenArg? arg;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late final Person _person = widget.arg?.person ??
      Person(
          id: 'people_list',
          name: Name(last: 'N/A', first: ''),
          email: 'N/A',
          picture: '',
          location: Location(latitude: 0, longitude: 0));

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
      if (_person != null) {
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
                        CusCardItmPerson(_person, displayAll: true)
                      ],
                    ),
                  )));
        });
        controller.closed.then((value) => goBack());
      }
    });
  }

  MarkerId getMakerID() {
    return MarkerId(_person.id);
  }

  LatLng getLatLng() {
    double lat = _person.location.latitude ?? 0;
    double lng = _person.location.longitude ?? 0;
    return LatLng(lat, lng);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: CusMap(CameraPosition(target: getLatLng(), zoom: 12), {
          Marker(
            markerId: getMakerID(),
            position: getLatLng(),
          )
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: FloatingActionButton(
            onPressed: goBack,
            elevation: 20.0,
            tooltip: "Go back",
            child: const Icon(Icons.arrow_back_rounded)));
  }
}
