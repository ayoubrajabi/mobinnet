import 'package:flutter/material.dart';

import '../../widgets.dart';

class SendSmsButtonInk extends StatelessWidget {
  SendSmsButtonInk({required this.isActive, required this.onEnter});
  final bool? isActive;
  final bool? onEnter;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: isActive! && onEnter!
            ? [
                const BoxShadow(
                  color: Color(0xFFB2DAA9),
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ]
            : [],
        gradient: LinearGradient(
          colors: isActive!
              ? const [Color(0xFF71BF43), Color(0xFF02AD4C)]
              : const [Color(0xFFC7E4BA), Color(0xFFB2DAA9)],
        ),
      ),
      child: SendSmsButton(
        isActive: isActive,
        onEnter: onEnter,
      ),
    );
  }
}
