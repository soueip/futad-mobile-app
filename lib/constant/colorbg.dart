import 'package:flutter/material.dart';

class ColorBG extends StatelessWidget {
  final Widget? child;
  final Widget? floatingActionButton;
  final bool showIcon;
  const ColorBG({
    super.key,
    this.child,
    this.showIcon = true,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingActionButton,
      body: Container(
        color: const Color(0xFF040F13),
        child: SafeArea(
          child: Center(child: child),
        ),
      ),
    );
  }
}
