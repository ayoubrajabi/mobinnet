import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.onChange,
      this.onPressed,
      this.textController,
      this.textFieldValues,
      this.isActive,
      this.code,
      this.index});
  final void Function(String)? onChange;
  final Function()? onPressed;
  final List<TextEditingController>? textController;
  final int? index;
  final Map<IconData, String>? textFieldValues;
  final int? code;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return TextField(
      onChanged: onChange,
      controller: textController![index!],
      style: _theme.textTheme.headline1?.copyWith(
        color: _theme.tabBarTheme.labelColor,
      ),
      decoration: InputDecoration(
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
                        CupertinoIcons.refresh,
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
