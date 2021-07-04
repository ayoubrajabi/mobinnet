import 'package:flutter/material.dart';

import '../widgets.dart';

class InfoRowWidget extends StatelessWidget {
  final _infoRowItems = <IconData, List<String>>{
    Icons.ac_unit: ['مبین نت', 'صفحه اصلی مبین نت'],
    Icons.shop_2_rounded: ['عوامل مجاز فروش', 'فهرست عوامل مجاز فروش'],
    Icons.map: ['نواحی تحت پوشش', 'مناطق دارای پوشش اینترنت'],
    Icons.price_change: ['طرح ها و تعرفه ها', 'فهرست طرح های اینترنت'],
    Icons.chat_bubble_outline: ['سوالات متداول', 'لیست پرسشهای متداول مبین نت'],
  };

  @override
  Widget build(BuildContext context) {
    final MediaQueryData? _mediaQuery = MediaQuery.of(context);
    final bool? _isTablet = Responsive.isTablet(context);
    final bool? _isMobile = Responsive.isMobile(context);

    return SizedBox(
      width: _mediaQuery!.size.width,
      height: _isTablet!
          ? _mediaQuery.size.height * 0.2
          : _isMobile!
              ? _mediaQuery.size.height * 0.52
              : _mediaQuery.size.height * 0.08,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 60.0),
        child: GridView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: _isTablet
                ? 250.0
                : _isMobile!
                    ? 200.0
                    : 250.0,
            crossAxisCount: _isTablet
                ? 2
                : _isMobile!
                    ? 5
                    : 1,
            childAspectRatio: 0.18,
          ),
          children: List<SizedBox>.generate(
            _infoRowItems.keys.length,
            (infoRowItemsIndex) => SizedBox(
              height: 50.0,
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  InfoRowIcon(
                    iconData: _infoRowItems.keys.elementAt(infoRowItemsIndex),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  InfoRowTexts(
                    length: _infoRowItems.values.first.length,
                    text: _infoRowItems.values.elementAt(infoRowItemsIndex),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
