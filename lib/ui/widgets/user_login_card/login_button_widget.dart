import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton(
      {required this.onEnter,
      required this.onExit,
      required this.onEnterValue});
  final void Function(PointerEvent)? onEnter;
  final void Function(PointerEvent)? onExit;
  final bool? onEnterValue;
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: onEnterValue!
            ? const [
                BoxShadow(
                  color: Color(0xFFB2DAA9),
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ]
            : const [],
        gradient: LinearGradient(
          colors: const [
            Color(0xFF71BF43),
            Color(0xFF02AD4C),
          ],
        ),
      ),
      child: MouseRegion(
        onEnter: onEnter,
        onExit: onExit,
        child: MaterialButton(
          onPressed: () {},
          child: const Text(
            'ورود',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
