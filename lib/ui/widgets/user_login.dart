import 'package:flutter/material.dart';

import './widgets.dart';

class UserLogin extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
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
                ? const BorderRadius.all(Radius.circular(15.0))
                : const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 200.0, bottom: 10.0, right: 30.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                backgroundColor: _theme.cardColor,
                appBar: AppBar(
                  title: Text(
                    'خوش آمدید ؛',
                    style: TextStyle(
                      fontSize: _isMobile ? 20.0 : 24.0,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF045453),
                    ),
                  ),
                  elevation: 0.0,
                  backgroundColor: _theme.cardColor,
                  bottom: CustomButtomAppBar(
                    mediaQuery: _mediaQuery,
                    tabController: _tabController,
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
        MobinnetLogo(),
      ],
    );
  }
}
