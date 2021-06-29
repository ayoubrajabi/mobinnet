import 'package:flutter/material.dart';

import 'widgets.dart';

class InfoRow extends StatelessWidget {
  final _infoRowItems = <IconData, List<String>>{
    Icons.ac_unit: ['مبین نت', 'صفحه اصلی مبین نت'],
    Icons.shop_2_rounded: ['عوامل مجاز فروش', 'فهرست عوامل مجاز فروش'],
    Icons.map: ['نواحی تحت پوشش', 'مناطق دارای پوشش اینترنت'],
    Icons.price_change: ['طرح ها و تعرفه ها', 'فهرست طرح های اینترنت'],
    Icons.chat_bubble_outline: ['سوالات متداول', 'لیست پرسشهای متداول مبین نت'],
  };

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _isTablet = Responsive.isTablet(context);
    final _isMobile = Responsive.isMobile(context);

    return SizedBox(
      width: _width,
      height: _isTablet
          ? _height * 0.2
          : _isMobile
              ? _height * 0.3
              : _height * 0.065,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 30.0),
        child: GridView(
          reverse: true,
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: _isTablet
                ? 280.0
                : _isMobile
                    ? 150.0
                    : 320.0,
            crossAxisCount: _isTablet
                ? 2
                : _isMobile
                    ? 3
                    : 1,
            childAspectRatio: 0.18,
          ),
          children: List<Container>.generate(
            _infoRowItems.keys.length,
            (infoRowItemsIndex) => Container(
              height: _isMobile ? 35.0 : 50.0,
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        _infoRowItems.keys.elementAt(infoRowItemsIndex),
                        size: _isMobile ? 13.0 : 24.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List<FittedBox>.generate(
                      _infoRowItems.values.elementAt(0).length,
                      (index) => FittedBox(
                        child: Text(
                          _infoRowItems.values
                              .elementAt(infoRowItemsIndex)[index],
                          style: TextStyle(
                            color: index == 0
                                ? const Color(0xFF045453)
                                : Colors.grey,
                            fontSize: index == 0
                                ? _isMobile
                                    ? 11.0
                                    : 13.0
                                : _isMobile
                                    ? 8.0
                                    : 10.0,
                          ),
                        ),
                      ),
                    ),
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
