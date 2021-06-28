import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields(
      {this.onChanged,
      this.index,
      this.isPhoneNum,
      this.textFieldValues,
      this.toolTipMessage});
  final void Function(String)? onChanged;
  final int? index;
  final String? toolTipMessage;
  final bool? isPhoneNum;
  final Map<IconData, String>? textFieldValues;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return TextFormField(
      style: _theme.textTheme.headline1!.copyWith(
        color: _theme.tabBarTheme.labelColor,
      ),
      obscureText: index == 0 ? false : true,
      onChanged: onChanged,
      inputFormatters: index == 0
          ? [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              LengthLimitingTextInputFormatter(11),
            ]
          : [],
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
