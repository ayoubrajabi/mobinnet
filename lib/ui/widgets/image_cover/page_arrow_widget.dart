import 'package:flutter/material.dart';

class PageArrow extends StatelessWidget {
  PageArrow({
    required this.onEnter,
    required this.onExit,
    required this.onPressed,
    required this.buttonIndex,
    required this.onEnterValue,
    this.index,
  });
  final void Function(PointerEvent)? onEnter;
  final void Function(PointerEvent)? onExit;
  final void Function()? onPressed;
  final bool? onEnterValue;
  final int? buttonIndex;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
            ),
          ],
          shape: BoxShape.circle,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Icon(
            index == 0
                ? Icons.chevron_left_rounded
                : Icons.chevron_right_rounded,
            color: const Color(0xFF37474F),
            size: 24.0,
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(12.0),
            ),
            elevation: MaterialStateProperty.all(
              buttonIndex != index || onEnterValue == false ? 0 : 10,
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(CircleBorder()),
          ),
        ),
      ),
    );
  }
}
