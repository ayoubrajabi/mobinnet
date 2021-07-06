import 'package:flutter/material.dart';

import './widgets.dart';

class LoginImageCover extends StatefulWidget {
  @override
  _LoginImageCoverState createState() => _LoginImageCoverState();
}

class _LoginImageCoverState extends State<LoginImageCover> {
  PageController? _pageController;
  bool? onEnter = false;
  int? buttonIndex = 0, currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImagePageView(
          pageController: _pageController,
          onPageChanged: (pageIndex) =>
              setState(() => currentPageIndex = pageIndex),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(left: 70.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List<PageArrow>.generate(
                2,
                (index) => PageArrow(
                  onEnter: (enter) => setState(() {
                    onEnter = true;
                    buttonIndex = index;
                  }),
                  onExit: (exit) => setState(() => onEnter = false),
                  onPressed: () {
                    _pageController?.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear,
                    );
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                  buttonIndex: buttonIndex,
                  onEnterValue: onEnter,
                  index: index,
                ),
              ),
            ),
          ),
        ),
        PageDotIndicator(
          currentPageIndex: currentPageIndex,
        ),
      ],
    );
  }
}
