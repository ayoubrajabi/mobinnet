import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persian_tools/persian_tools.dart';

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
              children: List<TextFormField>.generate(
                2,
                (index) => TextFormField(
                  style: _theme.textTheme.headline1!.copyWith(
                    color: _theme.tabBarTheme.labelColor,
                  ),
                  obscureText: index == 0 ? false : true,
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
                  inputFormatters: index == 0
                      ? [
                          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                          LengthLimitingTextInputFormatter(11),
                        ]
                      : [],
                  keyboardType:
                      index == 0 ? TextInputType.numberWithOptions() : null,
                  decoration: InputDecoration(
                    suffix: Tooltip(
                      message: _toolTipMessage!,
                      child: index == 0
                          ? Icon(
                              _isPhoneNum! ? null : Icons.info,
                              color: _isPhoneNum! ? null : Colors.amber,
                            )
                          : null,
                    ),
                    hintText: _textFieldValues.values.elementAt(index),
                    hintStyle: _theme.textTheme.headline1,
                    prefixIcon: Icon(
                      _textFieldValues.keys.elementAt(index),
                      color: _theme.iconTheme.color,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                      borderRadius: index == 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            )
                          : const BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                      borderRadius: index == 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            )
                          : const BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Ink(
            width: double.infinity,
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: _onEnter!
                  ? const [
                      BoxShadow(
                        color: Color(0xFFB2DAA9),
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ]
                  : const [],
              gradient: LinearGradient(
                colors: const [
                  Color(0xFF71BF43),
                  Color(0xFF02AD4C),
                ],
              ),
            ),
            child: MouseRegion(
              onEnter: (enter) => setState(() => _onEnter = true),
              onExit: (exite) => setState(() => _onEnter = false),
              child: MaterialButton(
                onPressed: () {},
                child: const Text(
                  'ورود',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
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
