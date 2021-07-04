import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';

import '../widgets.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  List<TextEditingController>? _textController;
  bool? _isActive = false;
  bool? _onEnter = false;
  bool? _isPhoneNum = false;
  String? _toolTipMessage = 'الزامی';

  final _textFieldValues = <IconData, String>{
    CupertinoIcons.phone: 'شماره موبایل',
    CupertinoIcons.lock_open: 'کد تصویری',
  };

  @override
  void initState() {
    _textController = List.generate(
      _textFieldValues.length,
      (index) => TextEditingController(),
    );
    super.initState();
  }

  void _activeLoginButton(int code) {
    if (_textController!.first.text.isNotEmpty &&
        _textController!.last.text == code.toString()) {
      setState(() {
        _isActive = true;
      });
    }
    if (_textController!.last.text == '') {
      setState(() {
        _isActive = false;
      });
    }
  }

  void _validatePhoneNumber(String value, int index) {
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

  int? _code = 1000 + Random().nextInt(9999 - 1000);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 30.0, 30.0, 0.0),
      child: Column(
        children: [
          Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFE0E0E0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              children: List<CustomTextField>.generate(
                _textFieldValues.length,
                (index) => CustomTextField(
                  onChange: (string) {
                    _activeLoginButton(_code!);
                    _validatePhoneNumber(string, index);
                  },
                  isPhoneNum: _isPhoneNum,
                  toolTipMessage: _toolTipMessage,
                  textController: _textController,
                  textFieldValues: _textFieldValues,
                  index: index,
                  code: _code!,
                  isActive: _isActive,
                  onPressed: () => setState(() {
                    _code = 1000 + Random().nextInt(9999 - 1000);
                  }),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          MouseRegion(
            onEnter: (enter) {
              if (_isActive!) setState(() => _onEnter = true);
            },
            onExit: (exit) {
              if (_isActive!) setState(() => _onEnter = false);
            },
            child: SendSmsButtonInk(
              isActive: _isActive,
              onEnter: _onEnter,
            ),
          ),
        ],
      ),
    );
  }
}
