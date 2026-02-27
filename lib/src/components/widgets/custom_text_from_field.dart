// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_getx_structure/src/utils/color_utils.dart';
// import 'package:flutter_getx_structure/src/utils/text_styles.dart';
//
// class CustomTextFormField extends StatefulWidget {
//   final TextEditingController controller;
//   final FocusNode? focusNode;
//   final String? hintText;
//   final String? labelText;
//   final TextInputType keyboardType;
//   final bool obscureText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final String? Function(String?)? validator;
//   final void Function(String)? onChanged;
//   final void Function(String)? onSubmitted;
//   final void Function()? onTap;
//   final bool readOnly;
//   final int? maxLines;
//   final int? minLines;
//   final int? maxLength;
//   final bool isCircular;
//   final TextAlign textAlign;
//   final EdgeInsetsGeometry? contentPadding;
//   final bool filled;
//   final Color? fillColor;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool autofocus;
//   final double fontSize;
//   final bool enabled;
//   final Color? hintColor;
//   final double? hintFontSize;
//   final TextInputAction? textInputAction;
//
//   const CustomTextFormField({
//     super.key,
//     required this.controller,
//     this.focusNode,
//     this.hintText,
//     this.labelText,
//     this.keyboardType = TextInputType.text,
//     this.obscureText = false,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.validator,
//     this.onChanged,
//     this.onSubmitted,
//     this.onTap,
//     this.readOnly = false,
//     this.maxLines = 1,
//     this.minLines,
//     this.maxLength,
//     this.isCircular = false,
//     this.textAlign = TextAlign.start,
//     this.contentPadding,
//     this.filled = true,
//     this.fillColor = AppColors.whiteColor,
//     this.inputFormatters,
//     this.autofocus = false,
//     this.fontSize = 16,
//     this.enabled = true,
//     this.hintColor,
//     this.hintFontSize,
//     this.textInputAction,
//   });
//
//   @override
//   State<CustomTextFormField> createState() => _CustomTextFormFieldState();
// }
//
// class _CustomTextFormFieldState extends State<CustomTextFormField> {
//   late FocusNode _focusNode;
//   bool _hasFocus = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode = widget.focusNode ?? FocusNode();
//     _focusNode.addListener(_handleFocusChange);
//   }
//
//   void _handleFocusChange() {
//     setState(() {
//       _hasFocus = _focusNode.hasFocus;
//     });
//   }
//
//   @override
//   void dispose() {
//     if (widget.focusNode == null) {
//       _focusNode.removeListener(_handleFocusChange);
//       _focusNode.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final BorderRadius borderRadius = widget.isCircular
//         ? BorderRadius.circular(50)
//         : BorderRadius.circular(8);
//
//     return TextFormField(
//       controller: widget.controller,
//       focusNode: _focusNode,
//       style: AppTextStyles.interRegular.copyWith(
//         color: AppColors.textBlackPrimary,
//         fontSize: widget.fontSize,
//       ),
//       obscureText: widget.obscureText,
//       keyboardType: widget.keyboardType,
//       textInputAction: widget.textInputAction,
//       textAlign: widget.textAlign,
//       readOnly: widget.readOnly,
//       maxLines: widget.maxLines,
//       minLines: widget.minLines,
//       maxLength: widget.maxLength,
//       autofocus: widget.autofocus,
//       enabled: widget.enabled,
//       decoration: InputDecoration(
//         counterText: "",
//         hintText: widget.hintText,
//         labelText: widget.labelText,
//         hintStyle: AppTextStyles.interRegular.copyWith(
//           color: widget.hintColor ?? AppColors.grey,
//           fontSize: widget.hintFontSize ?? widget.fontSize,
//         ),
//         labelStyle: AppTextStyles.interRegular.copyWith(
//           color: _hasFocus ? AppColors.secondary : AppColors.grey,
//           fontSize: widget.fontSize,
//         ),
//         suffixIcon: widget.suffixIcon,
//         prefixIcon: widget.prefixIcon,
//         filled: widget.filled,
//         fillColor: widget.fillColor,
//         contentPadding: widget.contentPadding ??
//             EdgeInsets.symmetric(
//                 horizontal: 16, vertical: widget.isCircular ? 12 : 16),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: borderRadius,
//           borderSide: BorderSide(
//             color: _hasFocus ? AppColors.secondary : AppColors.grey,
//             width: _hasFocus ? 2 : 1.5,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: borderRadius,
//           borderSide: const BorderSide(
//             color: AppColors.secondary,
//             width: 2,
//           ),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: borderRadius,
//           borderSide: const BorderSide(
//             color: Colors.red,
//             width: 1,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: borderRadius,
//           borderSide: const BorderSide(
//             color: Colors.red,
//             width: 2,
//           ),
//         ),
//       ),
//       validator: widget.validator,
//       onChanged: widget.onChanged,
//       onFieldSubmitted: widget.onSubmitted,
//       onTap: widget.onTap,
//       inputFormatters: widget.inputFormatters,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_getx_structure/src/utils/color_utils.dart';

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
