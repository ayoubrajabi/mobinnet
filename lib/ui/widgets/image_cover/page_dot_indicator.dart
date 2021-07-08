import 'package:flutter/material.dart';

class PageDotIndicator extends StatelessWidget {
  PageDotIndicator({required this.currentPageIndex});
  final int? currentPageIndex;

  @override
  Widget build(BuildContext context) {
    final ThemeData? _theme = Theme.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: SizedBox(
          width: 50,
          height: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Container>.generate(
              2,
              (index) => Container(
                width: 10.0,
                height: 10.0,
                decoration: BoxDecoration(
                  color: currentPageIndex! == index
                      ? _theme!.splashColor
                      : _theme!.splashColor.withAlpha(50),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
