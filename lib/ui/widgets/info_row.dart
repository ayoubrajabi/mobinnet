import 'package:flutter/material.dart';

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
    return SizedBox(
      width: _width,
      height: 50.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60.0),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List<Container>.generate(
            _infoRowItems.keys.length,
            (infoRowItemsIndex) => Container(
              height: 50.0,
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
                      2,
                      (index) => FittedBox(
                        child: Text(
                          _infoRowItems.values
                              .elementAt(infoRowItemsIndex)[index],
                          style: TextStyle(
                            color: index == 0 ? Color(0xFF045453) : Colors.grey,
                            fontSize: index == 0 ? 13.0 : 10.0,
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
