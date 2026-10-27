import 'package:flutter/material.dart';
import 'package:ifarm/core/themes/app_colors.dart';

class BottomImageBackground extends StatelessWidget {
  final Widget child;

  const BottomImageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // تجنب إن الكيبورد يضغط الخلفية لما يفتح
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // 1. الصورة واخدة الشاشة كلها من ورا
          Positioned.fill(
            child: Image.asset(
              'assets/images/background3.jpg', 
              fit: BoxFit.cover, // علشان الصورة تمط وتغطي الشاشة بالكامل
            ),
          ),
          
          // 2. المحتوى اللي فوق الخلفية
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 16),
                // الهيدر: زرار الرجوع + اللوجو
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.inputBorder),
                        color: Colors.white,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/images/ifarm_logo.png',
                          height: 70,
                        ),
                      ),
                    ),
                    const SizedBox(width: 64), // مسافة وهمية لضبط اللوجو في النص
                  ],
                ),
                
                // الـ Form اللي هيتغير حسب الشاشة
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: child, // ده الجزء المتغير
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}