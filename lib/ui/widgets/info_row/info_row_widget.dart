import 'package:flutter/material.dart';

import '../widgets.dart';

class InfoRowWidget extends StatelessWidget {
  final _infoRowItems = <IconData, List<String>>{
    Icons.home_max_rounded: ['مبین نت', 'صفحه اصلی مبین نت'],
    Icons.shop_2_rounded: ['عوامل مجاز فروش', 'فهرست عوامل مجاز فروش'],
    Icons.map: ['نواحی تحت پوشش', 'مناطق دارای پوشش اینترنت'],
    Icons.price_change: ['طرح ها و تعرفه ها', 'فهرست طرح های اینترنت'],
    Icons.chat_bubble_outline: ['سوالات متداول', 'لیست پرسشهای متداول مبین نت'],
  };
  @override
  Widget build(BuildContext context) {
    final MediaQueryData? _mediaQuery = MediaQuery.of(context);
    return SizedBox(
      width: _mediaQuery!.size.width,
      height: Responsive.infoRowHeight(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 60.0),
        child: Wrap(
          direction: Axis.vertical,
          textDirection: TextDirection.rtl,
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 120.0,
          children: List<InfoRowItem>.generate(
            _infoRowItems.keys.length,
            (infoRowItemsIndex) => InfoRowItem(
              icon: _infoRowItems.keys.elementAt(infoRowItemsIndex),
              lenght: _infoRowItems.values.first.length,
              texts: _infoRowItems.values.elementAt(infoRowItemsIndex),
            ),
          ),
        ),
      ),
    );
  }
}
