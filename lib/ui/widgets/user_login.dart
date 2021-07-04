import 'package:flutter/material.dart';

import 'widgets.dart';

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
    final MediaQueryData? _mediaQuery = MediaQuery.of(context);
    final bool? _isMobile = Responsive.isMobile(context);

    return Stack(
      children: [
        Container(
          margin: _isMobile!
              ? const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0)
              : const EdgeInsets.fromLTRB(0.0, 40.0, 60.0, 20.0),
          decoration: BoxDecoration(
            color: _theme.cardColor,
            borderRadius: _isMobile
                ? BorderRadius.circular(15.0)
                : BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: _mediaQuery!.size.height * 0.2),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                  backgroundColor: _theme.cardColor,
                  appBar: AppBar(
                    title: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text(
                        'خوش آمدید',
                        style: TextStyle(
                          fontSize: _isMobile ? 20.0 : 24.0,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF045453),
                        ),
                      ),
                    ),
                    elevation: 0.0,
                    backgroundColor: _theme.cardColor,
                    bottom: PreferredSize(
                      preferredSize: Size(_mediaQuery.size.width, 40.0),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TabBar(
                            indicatorWeight: 3.0,
                            controller: _tabController,
                            indicator: _theme.tabBarTheme.indicator,
                            indicatorColor: _theme.tabBarTheme.labelColor,
                            indicatorSize: _theme.tabBarTheme.indicatorSize,
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                            labelPadding: EdgeInsets.only(
                              bottom: 3.0,
                              left: 5.0,
                              right: 5.0,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            isScrollable: true,
                            tabs: _tabsName
                                .map(
                                  (tabsName) => Text(
                                    tabsName,
                                    style: _theme.textTheme.headline1!.copyWith(
                                      color: _theme.tabBarTheme.labelColor,
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    flexibleSpace: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 35.0),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: Colors.black12,
                          width: 0.5,
                        ),
                      )),
                    ),
                  ),
                  body: SizedBox(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        LoginWidget(),
                        SignUpWidget(),
                        SignUpWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        LoginScreenLogo(),
      ],
    );
  }
}
