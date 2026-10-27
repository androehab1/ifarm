import 'package:flutter/material.dart';
import 'package:ifarm/core/themes/app_colors.dart';

class TopImageBackground extends StatefulWidget {
  final Widget child;

  const TopImageBackground({super.key, required this.child});

  @override
  State<TopImageBackground> createState() => _TopImageBackgroundState();
}

class _TopImageBackgroundState extends State<TopImageBackground> {
  final ScrollController _scrollController = ScrollController();
  bool _wasKeyboardOpen = false;
  bool _isKeyboardAnimating = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardOpen = keyboardHeight > 0;
    final bottomSafePadding = MediaQuery.of(context).padding.bottom;

    if (isKeyboardOpen && !_wasKeyboardOpen) {
      _wasKeyboardOpen = true;
      _isKeyboardAnimating = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) setState(() { _isKeyboardAnimating = false; });
        });
      });
    } else if (!isKeyboardOpen && _wasKeyboardOpen) {
      _wasKeyboardOpen = false;
      _isKeyboardAnimating = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) setState(() { _isKeyboardAnimating = false; });
        });
      });
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: size.height * 0.45,
              child: Image.asset(
                'assets/images/Background11.jpeg',
                fit: BoxFit.cover,
              ),
            ),

            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: AnimatedBuilder(
                    animation: _scrollController,
                    builder: (context, child) {
                      double offset = 0.0;
                      if (_scrollController.hasClients) {
                        offset = _scrollController.offset.clamp(0.0, 150.0);
                      }
                      
                      double targetScale = isKeyboardOpen ? 1.0 : (1.0 - (offset / 150.0) * 0.35);
                      // التعديل الأول: رفعنا اللوجو لفوق بـ -40 علشان الكارت الأبيض مايغطيش عليه
                      double targetDy = isKeyboardOpen ? -15.0 : -(offset / 150.0) * 10.0;

                      return AnimatedContainer(
                        duration: _isKeyboardAnimating 
                            ? const Duration(milliseconds: 300) 
                            : Duration.zero,
                        curve: Curves.easeOut,
                        transform: Matrix4.identity()
                          ..translate(0.0, targetDy)
                          ..scale(targetScale, targetScale),
                        transformAlignment: Alignment.topCenter,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                          // التعديل التاني: قللنا العرض لـ 150 علشان اللوجو والكلمة يلزقوا في بعض
                          width: isKeyboardOpen ? 130 : 180, 
                          height: isKeyboardOpen ? 45 : 150, 
                          child: Stack(
                            children: [
                              AnimatedAlign(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                alignment: isKeyboardOpen ? Alignment.centerLeft : Alignment.topCenter,
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                  height: isKeyboardOpen ? 40 : 100, 
                                  child: Image.asset('assets/images/ifarm_logo.png'),
                                ),
                              ),
                              
                              AnimatedAlign(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                                alignment: isKeyboardOpen ? const Alignment(1.0, 0.8) : Alignment.bottomCenter,
                                child: AnimatedDefaultTextStyle(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut,
                                  style: TextStyle(
                                    // صغرنا الفونت لـ 30 علشان يكفي العرض الجديد ويبقى متناسق
                                    fontSize: isKeyboardOpen ? 30 : 42,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1.2,
                                  ),
                                  child: const Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'i ',
                                          style: TextStyle(color: Color(0xFF31A938)),
                                        ),
                                        TextSpan(
                                          text: 'farm',
                                          style: TextStyle(color: Color(0xFF006231)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      height: isKeyboardOpen
                          ? size.height * 0.10
                          : size.height * 0.30,
                    ),

                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.inputBorder,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(height: 16),

                          Padding(
                            padding: EdgeInsets.only(
                              left: 24.0,
                              right: 24.0,
                              bottom: isKeyboardOpen
                                  ? keyboardHeight + 16.0
                                  : bottomSafePadding + 16.0,
                            ),
                            child: widget.child,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}