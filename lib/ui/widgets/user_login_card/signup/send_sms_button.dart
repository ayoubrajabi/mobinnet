import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/material.dart';

class SendSmsButton extends StatelessWidget {
  SendSmsButton({required this.isActive, required this.onEnter});
  final bool? isActive;
  final bool? onEnter;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return MaterialButton(
      onPressed: isActive! == true ? () {} : null,
      child: isActive! && onEnter == true
          ? TranslationAnimatedWidget(
              enabled: onEnter!,
              duration: const Duration(milliseconds: 250),
              values: const [Offset(0, 100), Offset(0, 0)],
              child: Text(
                'ارسال کد تاییدیه',
                style: TextStyle(color: _theme.cardColor),
              ),
            )
          : TranslationAnimatedWidget(
              enabled: isActive! ? true : false,
              duration: const Duration(milliseconds: 250),
              values: isActive!
                  ? [Offset(0, -100), Offset(0, 0)]
                  : [Offset(0, 0), Offset(0, 0)],
              child: const Text(
                'مرحله بعد',
                style: TextStyle(color: Colors.white),
              ),
            ),
    );
  }
}
