import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  final _tabsName = ['ورود', 'ثبت نام', 'فراموشی رمز عبور'];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _width = MediaQuery.of(context).size.width;
    final _hieght = MediaQuery.of(context).size.height;
    return Container(
      width: _width * 0.25,
      height: _hieght * 0.45,
      child: DefaultTabController(
        length: 3,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: _theme.cardColor,
            appBar: AppBar(
              title: Text(
                'خوش آمدید',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF045453),
                ),
              ),
              elevation: 0.0,
              backgroundColor: _theme.cardColor,
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 60.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 200.0),
                  child: TabBar(
                    indicatorWeight: 3.0,
                    controller: _tabController,
                    indicator: _theme.tabBarTheme.indicator,
                    labelColor: _theme.tabBarTheme.labelColor,
                    unselectedLabelColor:
                        _theme.tabBarTheme.unselectedLabelColor,
                    labelStyle: _theme.tabBarTheme.labelStyle,
                    unselectedLabelStyle:
                        _theme.tabBarTheme.unselectedLabelStyle,
                    indicatorColor: _theme.tabBarTheme.labelColor,
                    indicatorSize: _theme.tabBarTheme.indicatorSize,
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    labelPadding: EdgeInsets.only(
                      bottom: 10.0,
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
                ),
              ),
            ),
            body: Column(
              children: [
                Divider(
                  color: Colors.grey.shade400,
                  height: 0.5,
                  thickness: 0.5,
                  endIndent: 50.0,
                  indent: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}