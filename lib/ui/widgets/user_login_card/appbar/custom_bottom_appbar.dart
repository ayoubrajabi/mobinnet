import 'package:flutter/material.dart';

class CustomButtomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  CustomButtomAppBar({
    @required this.tabController,
    @required this.mediaQuery,
  });

  final TabController? tabController;
  final MediaQueryData? mediaQuery;

  final List<String> _tabsName = ['ورود', 'ثبت نام', 'فراموشی رمز عبور'];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
              indicatorWeight: 3.0,
              controller: tabController,
              indicator: _theme.tabBarTheme.indicator,
              indicatorColor: _theme.tabBarTheme.labelColor,
              indicatorSize: _theme.tabBarTheme.indicatorSize,
              labelColor: _theme.tabBarTheme.labelColor,
              unselectedLabelColor: _theme.tabBarTheme.unselectedLabelColor,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              labelPadding: const EdgeInsets.only(
                bottom: 3.0,
                left: 5.0,
                right: 5.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              isScrollable: true,
              tabs: _tabsName
                  .map(
                    (tabsName) => Text(tabsName),
                  )
                  .toList(),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 5.0,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                    width: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(mediaQuery!.size.width, 40.0);
}
