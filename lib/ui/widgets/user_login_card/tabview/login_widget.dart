import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persian_tools/persian_tools.dart';
import '../../widgets.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  List<TextEditingController>? _textController;

  @override
  void initState() {
    _textController = List<TextEditingController>.generate(
        _textFieldValues.length, (index) => TextEditingController());
    super.initState();
  }

  final _textFieldValues = <IconData, String>{
    CupertinoIcons.person: 'شماره موبایل',
    CupertinoIcons.lock: 'گذرواژه',
  };

  final _buttonInfo = <String>['راهنمای ورود', 'فیلم آموزش ورود'];

  bool? _onEnter = false,
      _isPhoneNum = false,
      _checkBoxValue = false,
      _isActive = false;
  String? _toolTipMessage = 'الزامی';

  void _activeLoginButton(int index) {
    if (_textController![index].text.isNotEmpty &&
        _textController!.first.text.isPhoneNumber) {
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

  void _onChangedTextField(String value, int index) {
    if (_textController!.first.text.isPhoneNumber) {
      setState(() {
        _isPhoneNum = true;
        _toolTipMessage = '';
      });
    } else if (_textController!.first.text.isEmpty) {
      setState(() => _toolTipMessage = 'الزامی');
    } else if (index == 0) {
      setState(() {
        _isActive = false;
        _isPhoneNum = false;
        _toolTipMessage = 'شماره موبایل صحیح نیست';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 10.0, 0.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFE0E0E0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              children: List<LoginTextFields>.generate(
                _textFieldValues.length,
                (index) => LoginTextFields(
                  onChanged: (value) {
                    _onChangedTextField(value, index);
                    _activeLoginButton(index);
                  },
                  index: index,
                  isPhoneNum: _isPhoneNum,
                  toolTipMessage: _toolTipMessage,
                  textFieldValues: _textFieldValues,
                  textEditingController: _textController![index],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Checkbox(
                value: _checkBoxValue!,
                onChanged: (val) => setState(() => _checkBoxValue = val),
              ),
              Text(
                'مرا به خاطر بسپار',
                style: _theme.textTheme.headline1!.copyWith(
                  color: _theme.tabBarTheme.labelColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          LoginButton(
            onEnter: (enter) => setState(() => _onEnter = true),
            onExit: (exite) => setState(() => _onEnter = false),
            onEnterValue: _onEnter!,
            isActive: _isActive,
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
                  style: _theme.textTheme.headline1!.copyWith(
                    color: _theme.tabBarTheme.labelColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
