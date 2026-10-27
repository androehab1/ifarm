import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifarm/core/themes/app_colors.dart';
import 'package:ifarm/core/themes/system_ui.dart';

import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/top_image_background.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUI.defaultStyle,

      // Reuse the same background, logo, and keyboard animation.
      child: TopImageBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Headings
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              'Sign in to continue to your i farm account',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),

            // 2. Email field
            const CustomTextField(
              label: 'Email*',
              hint: 'Enter your email address',
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 16),

            // 3. Password field
            const CustomTextField(
              label: 'Password*',
              hint: 'Enter your password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 8),

            // 4. Forgot password link
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Add navigation to ForgotPasswordScreen later.
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),

            // 5. Sign-in button
            CustomPrimaryButton(
              text: 'Sign In',
              onPressed: () {
                // Connect to the authentication logic later.
              },
            ),
            const SizedBox(height: 24),

            // 6. Return to account activation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Activate Account',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 7. Security message
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.gpp_good_outlined,
                  color: AppColors.primary,
                  size: 18,
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Secure access for authorized members only',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}