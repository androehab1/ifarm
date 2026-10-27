import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract final class AppSystemUI {
  static const SystemUiOverlayStyle defaultStyle =
      SystemUiOverlayStyle(

        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,

        // Make the navigation bar white with a black gesture indicator.
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
      );
}