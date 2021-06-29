import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    void _onChanged(String value, int index) {
      if (value.isPhoneNumber && index == 0) {
        setState(() => _isPhoneNum = true);
      } else if (value.isEmpty && index == 0) {
        setState(() => _toolTipMessage = 'الزامی');
      } else if (index == 0) {
        setState(() {
          _isPhoneNum = false;
          _toolTipMessage = 'شماره موبایل صحیح نیست';
        });
      }
    }

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
                _textFieldValues.length,
                (index) => LoginTextFields(
                  onChanged: (value) => _onChanged(value, index),
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
              _buttonInfo.length,
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
