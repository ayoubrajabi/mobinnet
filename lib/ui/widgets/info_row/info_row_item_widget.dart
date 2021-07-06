import 'package:flutter/material.dart';

import '../widgets.dart';

class InfoRowItem extends StatelessWidget {
  InfoRowItem({
    @required this.icon,
    @required this.lenght,
    @required this.texts,
  });

  final IconData? icon;
  final int? lenght;
  final List<String>? texts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          InfoRowIcon(
            iconData: icon,
          ),
          const SizedBox(
            width: 10.0,
          ),
          InfoRowTexts(
            length: lenght,
            text: texts,
          ),
        ],
      ),
    );
  }
}
