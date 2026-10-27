import 'package:flutter/material.dart';
import 'routes.dart';
// اتأكد إن مسار واسم البروجكت (ifarm) مكتوب صح عندك
import 'package:ifarm/features/auth/presentation/screens/activation_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        // تم استبدال الـ Splash بالشاشة بتاعتنا
        return MaterialPageRoute(
          builder: (_) => const ActivationScreen(),
        );
      
      // هنا هنضيف باقي الشاشات لما نبنيها
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}