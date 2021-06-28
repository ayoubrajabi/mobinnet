import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  List<TextEditingController>? _textController;
  bool? _isActive = false;
  bool? _onEnter = false;

  final _textFieldValues = <IconData, String>{
    CupertinoIcons.phone: 'شماره موبایل',
    CupertinoIcons.lock_open: 'کد تصویری',
  };

  @override
  void initState() {
    _textController = List.generate(
        _textFieldValues.length, (index) => TextEditingController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int _code = 1000 + Random().nextInt(9999 - 1000);

    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 30.0, 30.0, 20.0),
      child: Column(
        children: [
          Container(
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
                    if (_textController![0].text.isNotEmpty &&
                        _textController![1].text == _code.toString()) {
                      setState(() {
                        _isActive = true;
                      });
                    }
                    if (_textController![1].text == '') {
                      setState(() {
                        _isActive = false;
                      });
                    }
                  },
                  textController: _textController,
                  textFieldValues: _textFieldValues,
                  index: index,
                  code: _code,
                  isActive: _isActive,
                  onPressed: () => setState(() {}),
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
