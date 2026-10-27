import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUiWrapper extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;

  const SystemUiWrapper({
    super.key,
    required this.child,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // Keep the status bar transparent.
        statusBarColor: Colors.transparent,

        // Use dark icons on a light background.
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,

        // Use a white navigation bar on supported Android versions.
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      ),
      child: ColoredBox(
        color: backgroundColor,
        child: child,
      ),
    );
  }
}