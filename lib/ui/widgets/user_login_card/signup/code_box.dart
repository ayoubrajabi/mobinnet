import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldCodeBox extends StatelessWidget {
  TextFieldCodeBox({
    required this.onPressed,
    required this.textController,
    required this.isActive,
    required this.code,
    required this.index,
  });

  final List<TextEditingController>? textController;
  final void Function()? onPressed;
  final bool? isActive;
  final int? index, code;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      height: 15.0,
      width: 90.0,
      margin: const EdgeInsets.symmetric(horizontal: 7.0),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF0F5),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            isActive == false ? code.toString() : textController![index!].text,
            style: TextStyle(
              color: _theme.tabBarTheme.labelColor,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Icon(
              CupertinoIcons.refresh_bold,
              color: _theme.tabBarTheme.labelColor,
              size: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
