import 'package:flutter/material.dart';

class LoginImageCover extends StatefulWidget {
  @override
  _LoginImageCoverState createState() => _LoginImageCoverState();
}

class _LoginImageCoverState extends State<LoginImageCover> {
  PageController? _pageController;
  bool? onEnter = false;
  int? buttonIndex = 0;
  int? currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _width = MediaQuery.of(context).size.width;
    // final _hieght = MediaQuery.of(context).size.height;
    return Material(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15.0),
        bottomLeft: Radius.circular(15.0),
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              width: _width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0),
                ),
              ),
              child: PageView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemBuilder: (context, index) {
                  return Image.asset(
                    'assets/images/cover.jpg',
                    width: _width * 0.5,
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: _width * 0.7,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List<MouseRegion>.generate(
                    2,
                    (index) => MouseRegion(
                      onEnter: (enter) => setState(() {
                        onEnter = true;
                        buttonIndex = index;
                      }),
                      onExit: (exit) => setState(() => onEnter = false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                            ),
                          ],
                          shape: BoxShape.circle,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _pageController?.animateToPage(index,
                                duration: const Duration(milliseconds: 250),
                                curve: Curves.linear);
                            setState(() {
                              currentPageIndex = index;
                            });
                          },
                          child: Icon(
                            index == 0
                                ? Icons.chevron_left_rounded
                                : Icons.chevron_right_rounded,
                            color: Colors.blueGrey.shade800,
                            size: 24.0,
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(12.0),
                            ),
                            elevation: MaterialStateProperty.all(
                              buttonIndex != index || onEnter == false ? 0 : 10,
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(CircleBorder()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: _width * 0.35,
            bottom: 100.0,
            child: SizedBox(
              width: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List<Container>.generate(
                  2,
                  (index) => Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: currentPageIndex == index
                          ? _theme.splashColor
                          : _theme.splashColor.withAlpha(50),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
