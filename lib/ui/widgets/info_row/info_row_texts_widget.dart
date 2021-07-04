import 'package:flutter/material.dart';

class InfoRowTexts extends StatelessWidget {
  const InfoRowTexts({
    @required this.length,
    @required this.text,
  });
  final int? length;
  final List<String>? text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<FittedBox>.generate(
        length!,
        (index) => FittedBox(
          child: Text(
            text![index],
            style: TextStyle(
              color: index == 0 ? const Color(0xFF045453) : Colors.grey,
              fontSize: index == 0 ? 13.0 : 10.0,
            ),
          ),
        ),
      ),
    );
  }
}
