import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifarm/core/themes/app_colors.dart';
import 'package:ifarm/core/themes/system_ui.dart';
import 'package:ifarm/features/auth/presentation/screens/welcome_back_screen.dart';
import '../../../../core/widgets/custom_primary_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/top_image_background.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppSystemUI.defaultStyle,

      child: TopImageBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Headings
            const Text(
              'Active your Account .',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "You've been invited to i farm",
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 24),

            // 2. Username field
            const CustomTextField(
              label: 'Username*',
              hint: 'androehab1',
              prefixIcon: Icons.person,
              suffixIcon: Icon(
                Icons.edit_outlined,
                color: AppColors.textSecondary,
                size: 20,
              ),
            ),
            const SizedBox(height: 2),
            Align(
              alignment: Alignment.centerRight,
              child: const Text(
                'Suggested by admin.. You can change it.',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.textSuccess,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 4),

            // 3. Email field
            const CustomTextField(
              label: 'Email*',
              hint: 'Enter your email address',
              prefixIcon: Icons.email,
            ),
            const SizedBox(height: 16),

            // 4. Password field
            const CustomTextField(
              label: 'Password*',
              hint: 'Enter your password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 16),

            // 5. Confirm password field
            const CustomTextField(
              label: 'Confirm Password *',
              hint: 'Enter your password',
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
            const SizedBox(height: 32),

            // 6. Activation button
            CustomPrimaryButton(
              text: 'Active Now',
              onPressed: () {
                // Connect to Bloc later.
              },
            ),
            const SizedBox(height: 24),

            // 7. Sign-in link
            // 7. Sign-in navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already Activated ? ',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeBackScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign in',
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

            // 8. Security message
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.gpp_good_outlined,
                  color: AppColors.primary,
                  size: 18,
                ),
                SizedBox(width: 8),
                Text(
                  'Secure access for authorized members only',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
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
