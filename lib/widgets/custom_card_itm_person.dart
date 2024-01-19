import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/person.dart';
import '../utils/constants.dart';
import 'custom_text_normal.dart';

class CusCardItmPerson extends StatefulWidget {
  final Person person;
  final bool displayAll;

  CusCardItmPerson(this.person, {Key? key, this.displayAll = false})
      : super(key: key);

  @override
  _CusCardItmPersonState createState() => _CusCardItmPersonState();
}

class _CusCardItmPersonState extends State<CusCardItmPerson> {
  _CusCardItmPersonState();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(elementMPadding),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cardsBorderRadius),
              topRight: Radius.circular(cardsBorderRadius)),
        ),
        child: Row(
          children: [
            ClipOval(
                child: CachedNetworkImage(
                    width: circleImgBorderWH,
                    height: circleImgBorderWH,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Icon(Icons.account_circle_outlined),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.account_circle),
                    imageUrl: widget.person.picture)),
            const SizedBox(width: elementMPadding),
            widget.displayAll
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CusNText(widget.person.name.full()),
                      CusNText(widget.person.email)
                    ],
                  )
                : CusNText(widget.person.name.full())
          ],
        ));
  }
}
