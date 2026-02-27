import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_structure/src/utils/color_utils.dart';
import 'package:flutter_getx_structure/src/utils/validators.dart';

class AuthCard extends StatefulWidget {
  final Function(String email, String password) onSignIn;
  final VoidCallback onForgotPassword;
  final VoidCallback onGoogleSignIn;
  final VoidCallback onGuestSignIn;
  final VoidCallback onSignUp;
  final VoidCallback onAppleSignIn;

  const AuthCard({
    super.key,
    required this.onSignIn,
    required this.onForgotPassword,
    required this.onGoogleSignIn,
    required this.onGuestSignIn,
    required this.onSignUp,
    required this.onAppleSignIn,
  });

  @override
  State<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignInPressed() {
    if (_formKey.currentState!.validate()) {
      widget.onSignIn(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome Back!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1D1D1F),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose your Login Method',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            CustomTextField(
              controller: _emailController,
              label: 'Email Address',
              hintText: 'your@email.com',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              validator: Validators.validateEmail,
            ),
            const SizedBox(height: 15),
            CustomTextField(
              controller: _passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icons.lock_outline,
              isPassword: true,
              isPasswordVisible: _isPasswordVisible,
              onVisibilityToggle: () {
                setState(() => _isPasswordVisible = !_isPasswordVisible);
              },
              validator: Validators.validatePassword,
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: widget.onForgotPassword,
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: AppColors.primary, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 15),
            _AuthButton(
              label: 'Sign In',
              onTap: _onSignInPressed,
              isPrimary: true,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ",
                    style: TextStyle(color: Colors.grey)),
                InkWell(
                  onTap: widget.onSignUp,
                  child: const Text(
                    ' Sign Up',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 35),
            // const DividerWithText(text: 'or continue with'),
            // const SizedBox(height: 40),
            // _AuthButton(
            //   label: 'Continue with Google',
            //   onTap: widget.onGoogleSignIn,
            //   leadingIcon: const GoogleIcon(),
            // ),
            // const SizedBox(height: 20),
            // if (Platform.isIOS)
            //   _AuthButton(
            //     label: 'Continue with Apple',
            //     onTap: () {},
            //     bgColor: AppColors.primary,
            //     isPrimary: true,
            //     leadingIcon: const Icon(
            //       FontAwesomeIcons.apple,
            //       color: Colors.white,
            //       size: 25,
            //     ),
            //   )
            // else // જો Android હોય તો
            //   _AuthButton(
            //     leadingIcon: const Icon(
            //       Icons.person_outline,
            //       color: Colors.white,
            //       size: 25,
            //     ),
            //     label: 'Continue as Guest',
            //     onTap: widget.onGuestSignIn,
            //     bgColor: AppColors.primary,
            //     isPrimary: true,
            //   ),
            if (!Platform.isIOS)
              Column(
                children: [
                  const SizedBox(height: 35),
                  const DividerWithText(text: 'or continue with'),
                  const SizedBox(height: 40),
                  _AuthButton(
                    label: 'Continue with Google',
                    onTap: widget.onGoogleSignIn,
                    leadingIcon: const GoogleIcon(),
                  ),
                  const SizedBox(height: 20),
                  _AuthButton(
                    leadingIcon: const Icon(
                      Icons.person_outline,
                      color: Colors.white,
                      size: 25,
                    ),
                    label: 'Continue as Guest',
                    onTap: widget.onGuestSignIn,
                    bgColor: AppColors.primary,
                    isPrimary: true,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final IconData prefixIcon;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onVisibilityToggle;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextCapitalization? textCapitalization;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    required this.prefixIcon,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onVisibilityToggle,
    this.validator,
    this.textCapitalization,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF363636)),
        ),
        const SizedBox(height: 8),
        TextFormField(
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          cursorColor: AppColors.primary,
          obscureText: isPassword && !isPasswordVisible,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon, color: Colors.grey),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: onVisibilityToggle,
                  )
                : null,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              // એરર આવે ત્યારે
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              // એરર હોય અને ફોકસમાં હોય ત્યારે
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;
  final Color bgColor;
  final Widget? leadingIcon;

  const _AuthButton({
    required this.label,
    required this.onTap,
    this.isPrimary = false,
    this.bgColor = Colors.white,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary
            ? (bgColor == Colors.white ? AppColors.primary : bgColor)
            : Colors.white,
        foregroundColor: isPrimary ? Colors.white : Colors.black87,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        side: isPrimary
            ? BorderSide.none
            : BorderSide(color: Colors.grey.shade300),
        elevation: isPrimary ? 3 : 0,
        shadowColor: isPrimary ? AppColors.primary.withOpacity(0.3) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leadingIcon != null) ...[
            leadingIcon!,
            const SizedBox(width: 12),
          ],
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

/// Google Icon Widget
class GoogleIcon extends StatelessWidget {
  final double size;

  const GoogleIcon({super.key, this.size = 25});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://www.google.com/favicon.ico',
      width: size,
      height: size,
      placeholder: (context, url) => const SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2.0),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class DividerWithText extends StatelessWidget {
  final String text;
  final Color dividerColor;
  final Color textColor;
  final double fontSize;

  const DividerWithText({
    super.key,
    this.text = 'or continue with',
    this.dividerColor = const Color(0xFFE5E5EA),
    this.textColor = const Color(0xFF8E8E93),
    this.fontSize = 13,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: dividerColor)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              color: textColor,
            ),
          ),
        ),
        Expanded(child: Divider(color: dividerColor)),
      ],
    );
  }
}

class TermsSection extends StatelessWidget {
  final String termsText;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  const TermsSection({
    super.key,
    this.termsText =
        'By continuing, you agree to our Terms of Service and Privacy Policy',
    this.textStyle,
    this.padding = const EdgeInsets.only(bottom: 24),
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              termsText,
              textAlign: TextAlign.center,
              style: textStyle ??
                  TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    height: 1.4,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
