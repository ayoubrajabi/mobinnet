import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persian_tools/persian_tools.dart';

import '../widgets.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _textFieldValues = <IconData, String>{
    CupertinoIcons.person_alt_circle: 'شماره موبایل',
    CupertinoIcons.lock_circle: 'گذرواژه',
  };

  final List<String> _buttonInfo = ['راهنمای ورود', 'فیلم آموزش ورود'];

  bool? _onEnter = false;
  bool? _isPhoneNum = false;
  String? _toolTipMessage = 'الزامی';

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 30.0, 30.0, 0.0),
      child: Column(
        children: [
          Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              children: List<LoginTextFields>.generate(
                2,
                (index) => LoginTextFields(
                  onChanged: index == 0
                      ? (string) {
                          if (string.isPhoneNumber) {
                            setState(() {
                              _isPhoneNum = true;
                            });
                          } else if (string.isEmpty) {
                            setState(() {
                              _toolTipMessage = 'الزامی';
                            });
                          } else {
                            setState(() {
                              _isPhoneNum = false;
                              _toolTipMessage = 'شماره موبایل صحیح نیست';
                            });
                          }
                        }
                      : (string) {},
                  index: index,
                  isPhoneNum: _isPhoneNum,
                  toolTipMessage: _toolTipMessage,
                  textFieldValues: _textFieldValues,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          LoginButton(
            onEnter: (enter) => setState(() => _onEnter = true),
            onExit: (exite) => setState(() => _onEnter = false),
            onEnterValue: _onEnter,
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<TextButton>.generate(
              2,
              (index) => TextButton(
                onPressed: () {},
                child: Text(
                  _buttonInfo[index],
                  style: _theme.textTheme.headline1!
                      .copyWith(color: _theme.tabBarTheme.labelColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
