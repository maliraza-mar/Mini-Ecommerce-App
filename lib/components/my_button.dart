import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.onTap, required this.child});

  final void Function() onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        child: child,
      ),
    );
  }
}
