import 'package:flutter/material.dart';

class ImagePageView extends StatelessWidget {
  ImagePageView({
    required this.pageController,
    required this.onPageChanged,
  });

  final PageController? pageController;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    final double? _width = MediaQuery.of(context).size.width;

    return Positioned(
      child: Container(
        margin: const EdgeInsets.fromLTRB(60.0, 40.0, 0.0, 20.0),
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
          controller: pageController!,
          onPageChanged: onPageChanged!,
          itemBuilder: (context, index) {
            return Image.asset(
              'assets/images/cover.jpg',
              width: _width! * 0.5,
            );
          },
        ),
      ),
    );
  }
}
