import 'package:flutter/material.dart';

class InfoRowIcon extends StatelessWidget {
  const InfoRowIcon({@required this.iconData});
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFBDBDBD),
          width: 0.5,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          iconData,
          size: 20.0,
        ),
      ),
    );
  }
}
