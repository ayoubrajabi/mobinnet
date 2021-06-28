import 'dart:math';

import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController? _textEditingController;
  TextEditingController? _textEditingController2;
  bool? _isActive = false;
  bool? _onEnter = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _textFieldValues = <IconData, String>{
      CupertinoIcons.phone: 'شماره موبایل',
      CupertinoIcons.lock_open: 'کد تصویری',
    };

    final _theme = Theme.of(context);

    int _code = 1000 + Random().nextInt(9999 - 1000);

    return Padding(
      padding: const EdgeInsets.fromLTRB(60, 30, 30, 20),
      child: Column(
        children: [
          Container(
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
              children: List<TextField>.generate(
                2,
                (index) => TextField(
                  controller: index == 0
                      ? _textEditingController
                      : _textEditingController2,
                  style: _theme.textTheme.headline1?.copyWith(
                    color: _theme.tabBarTheme.labelColor,
                  ),
                  onChanged: (string) {
                    if (_textEditingController?.text != '' &&
                        _textEditingController2?.text == _code.toString()) {
                      setState(() {
                        _isActive = true;
                      });
                    }
                    if (_textEditingController2?.text == '') {
                      _isActive = false;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: _textFieldValues.values.elementAt(index),
                    hintStyle: _theme.textTheme.headline1,
                    prefixIcon: Icon(
                      _textFieldValues.keys.elementAt(index),
                      color: _theme.iconTheme.color,
                    ),
                    suffixIcon: index == 1
                        ? Container(
                            height: 15.0,
                            width: 90.0,
                            margin: const EdgeInsets.symmetric(horizontal: 7.0),
                            decoration: BoxDecoration(
                              color: _theme.cardColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  _isActive == false
                                      ? _code.toString()
                                      : _textEditingController2!.text,
                                  style: TextStyle(
                                    color: _theme.tabBarTheme.labelColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    CupertinoIcons.refresh,
                                    color: _theme.tabBarTheme.labelColor,
                                    size: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                      borderRadius: index == 0
                          ? BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            )
                          : BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              bottomRight: Radius.circular(5.0),
                            ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                      borderRadius: index == 0
                          ? BorderRadius.only(
                              topLeft: Radius.circular(5.0),
                              topRight: Radius.circular(5.0),
                            )
                          : BorderRadius.only(
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
              boxShadow: _isActive! && _onEnter!
                  ? [
                      BoxShadow(
                        color: Color(0xFFB2DAA9),
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ]
                  : [],
              gradient: LinearGradient(
                colors: _isActive!
                    ? [Color(0xFF71BF43), Color(0xFF02AD4C)]
                    : [Color(0xFFC7E4BA), Color(0xFFB2DAA9)],
              ),
            ),
            child: MouseRegion(
              onEnter: (enter) => setState(() => _onEnter = true),
              onExit: (exite) => setState(() => _onEnter = false),
              child: MaterialButton(
                onPressed: _isActive == true ? () {} : null,
                child: _isActive! && _onEnter == true
                    ? TranslationAnimatedWidget(
                        enabled: _onEnter!,
                        duration: const Duration(milliseconds: 250),
                        values: [
                          Offset(0, 100), // disabled value value
                          Offset(0, 0) //enabled value
                        ],
                        child: Text(
                          'ارسال کد تاییدیه',
                          style: TextStyle(color: _theme.cardColor),
                        ),
                      )
                    : TranslationAnimatedWidget(
                        enabled: true,
                        duration: const Duration(milliseconds: 250),
                        values: [
                          Offset(0, -100), // disabled value value
                          Offset(0, 0) //enabled value
                        ],
                        child: Text(
                          'مرحله بعد',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
