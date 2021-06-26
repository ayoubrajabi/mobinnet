import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _textFieldValues = <IconData, String>{
    CupertinoIcons.person_alt_circle: 'شماره موبایل',
    CupertinoIcons.lock_circle: 'گذرواژه',
  };

  final List<String> _infoButtons = ['راهنمای ورود', 'فیلم آموزش ورود'];

  bool? onEnter = false;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 20, 20, 20),
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
                  decoration: InputDecoration(
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
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: MouseRegion(
              onEnter: (enter) => setState(() => onEnter = true),
              onExit: (exite) => setState(() => onEnter = false),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('ورود'),
                style: ButtonStyle(
                  elevation:
                      MaterialStateProperty.all(onEnter == false ? 0.0 : 2.0),
                  backgroundColor: MaterialStateProperty.all(
                    _theme.splashColor,
                  ),
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
                  _infoButtons[index],
                  style: _theme.textTheme.headline1
                      ?.copyWith(color: _theme.tabBarTheme.labelColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
