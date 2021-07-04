import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.onChange,
    this.onPressed,
    this.textController,
    this.textFieldValues,
    this.isActive,
    this.code,
    this.index,
    this.isPhoneNum,
    this.toolTipMessage,
  });
  final void Function(String)? onChange;
  final Function()? onPressed;
  final List<TextEditingController>? textController;
  final int? index;
  final Map<IconData, String>? textFieldValues;
  final int? code;
  final bool? isActive;
  final String? toolTipMessage;
  final bool? isPhoneNum;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return TextField(
      onChanged: onChange,
      controller: textController![index!],
      style: _theme.textTheme.headline1!.copyWith(
        color: _theme.tabBarTheme.labelColor,
      ),
      inputFormatters: index == 0
          ? [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              LengthLimitingTextInputFormatter(11),
            ]
          : [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              LengthLimitingTextInputFormatter(4),
            ],
      keyboardType: index == 0 ? TextInputType.numberWithOptions() : null,
      decoration: InputDecoration(
        suffix: Tooltip(
          message: toolTipMessage!,
          child: index == 0
              ? Icon(
                  isPhoneNum! ? null : Icons.info,
                  color: isPhoneNum! ? null : Colors.amber,
                )
              : null,
        ),
        hintText: textFieldValues!.values.elementAt(index!),
        hintStyle: _theme.textTheme.headline1,
        prefixIcon: Icon(
          textFieldValues!.keys.elementAt(index!),
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
                      isActive == false
                          ? code.toString()
                          : textController![index!].text,
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
                        CupertinoIcons.refresh_circled,
                        color: _theme.tabBarTheme.labelColor,
                        size: 18.0,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
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
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
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
    );
  }
}
