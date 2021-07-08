import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.onChange,
    required this.onPressed,
    required this.textController,
    required this.textFieldValues,
    required this.isActive,
    required this.code,
    required this.index,
    required this.isPhoneNum,
    required this.toolTipMessage,
  });
  final void Function(String)? onChange;
  final List<TextEditingController>? textController;
  final void Function()? onPressed;
  final Map<IconData, String>? textFieldValues;
  final bool? isActive, isPhoneNum;
  final String? toolTipMessage;
  final int? index, code;

  BorderRadius? _borderRadius(int? index) {
    if (index == 0)
      return const BorderRadius.only(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(5.0),
      );
    return const BorderRadius.only(
      bottomLeft: Radius.circular(5.0),
      bottomRight: Radius.circular(5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return TextField(
      onChanged: onChange,
      controller: textController![index!],
      style: _theme.textTheme.headline1!.copyWith(
        color: _theme.tabBarTheme.labelColor,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        LengthLimitingTextInputFormatter(index == 0 ? 11 : 4),
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
              : const Icon(
                  Icons.home,
                  color: Colors.transparent,
                ),
        ),
        hintText: textFieldValues!.values.elementAt(index!),
        hintStyle: _theme.textTheme.headline1,
        contentPadding: const EdgeInsets.all(20.0),
        prefixIcon: Icon(
          textFieldValues!.keys.elementAt(index!),
          color: _theme.iconTheme.color,
        ),
        suffixIcon: index == 1
            ? TextFieldCodeBox(
                onPressed: onPressed,
                isActive: isActive,
                code: code,
                index: index,
                textController: textController,
              )
            : const SizedBox(),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: UnderlineInputBorder(
          borderSide: index == 0
              ? BorderSide(color: Colors.black12, width: 0.0)
              : BorderSide(color: Colors.white, width: 0.0),
          borderRadius: _borderRadius(index)!,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 0.0),
          borderRadius: _borderRadius(index)!,
        ),
      ),
    );
  }
}
