import 'package:flutter/material.dart';
import 'package:ifarm/core/themes/app_theme.dart';
import 'core/di/service_locator.dart';
import 'core/routing/app_router.dart';

void main() async {
  // السطر ده مهم جداً عشان نتأكد إن الفلاتر جاهز قبل ما نعمل أي async operations
  WidgetsFlutterBinding.ensureInitialized();
  
  // تشغيل الـ Dependency Injection
  initServiceLocator(); 

   
  
  runApp(FarmApp(
    appRouter: AppRouter(),
  ));
}

class FarmApp extends StatelessWidget {
  final AppRouter appRouter;

  const FarmApp({
    super.key, 
    required this.appRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farm Management',
      
      // ربط الـ Theme اللي جهزناه
      theme: AppTheme.lightTheme, 
      
      // ربط الـ Routing اللي هيتحكم في التنقل بين الشاشات
      onGenerateRoute: appRouter.generateRoute, 
    );
  }
}