import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({
    @required this.onChanged,
    @required this.index,
    @required this.isPhoneNum,
    @required this.textFieldValues,
    @required this.toolTipMessage,
    @required this.textEditingController,
  });
  final void Function(String)? onChanged;
  final int? index;
  final String? toolTipMessage;
  final bool? isPhoneNum;
  final Map<IconData, String>? textFieldValues;
  final TextEditingController? textEditingController;

  BorderRadius? _borderRadius(int? index) {
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(5.0),
        topRight: Radius.circular(5.0),
      );
    }
    return const BorderRadius.only(
      bottomLeft: Radius.circular(5.0),
      bottomRight: Radius.circular(5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return SizedBox(
      child: TextFormField(
        controller: textEditingController,
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
            : const [],
        keyboardType: index == 0 ? TextInputType.numberWithOptions() : null,
        decoration: InputDecoration(
          suffix: Tooltip(
            message: index == 0 ? toolTipMessage! : '',
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
          filled: true,
          fillColor: const Color(0xFFFFFFFF),
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
      ),
    );
  }
}
