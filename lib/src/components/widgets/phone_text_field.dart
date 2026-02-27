import 'package:flutter/material.dart';
import 'package:flutter_getx_structure/src/utils/color_utils.dart';
import 'package:flutter_getx_structure/src/utils/dimensions.dart';
import 'package:flutter_getx_structure/src/utils/text_styles.dart';

class PhoneTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextStyle? prefixStyle;
  final String? helperText;
  final String? prefixText;
  final TextStyle? hintStyle;

  const PhoneTextField({
    super.key,
    this.controller,
    this.hintText = "Enter your mobile number",
    this.labelText,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.textInputAction,
    this.textAlign = TextAlign.start,
    this.style,
    this.helperText,
    this.hintStyle,
    this.prefixText,
    this.prefixStyle,
  });

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  String? _errorText;
  bool _isDirty = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      textInputAction: widget.textInputAction,
      textAlign: widget.textAlign,
      style: widget.style,
      onTap: widget.onTap,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        // Mark as dirty on first change
        if (!_isDirty) {
          setState(() {
            _isDirty = true;
          });
        }
        // Validate on each change if field is dirty
        if (_isDirty && widget.validator != null) {
          setState(() {
            _errorText = widget.validator!(value);
          });
        }
      },
      onFieldSubmitted: widget.onFieldSubmitted,
      // Use our own validation logic instead of Flutter's built-in validator
      validator: (value) {
        if (widget.validator != null) {
          final error = widget.validator!(value);
          // Update the error text state
          if (_errorText != error) {
            setState(() {
              _errorText = error;
            });
          }
          return error;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        errorText: _errorText,
        counterText: '',
        prefixText: widget.prefixText,
        prefixStyle: widget.style ??
            AppTextStyles.interRegular
                .copyWith(fontSize: 14, color: Colors.black),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintStyle: widget.hintStyle ??
            AppTextStyles.interRegular
                .copyWith(color: AppColors.textGrey, fontSize: 14),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusOverLarge),
            borderSide: BorderSide(color: AppColors.greyBoarder, width: 1)),
        fillColor: AppColors.whiteColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusOverLarge),
            borderSide: BorderSide(color: AppColors.greyBoarder, width: 1)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.secondary, width: 1),
          borderRadius: BorderRadius.circular(Dimensions.radiusOverLarge),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(Dimensions.radiusOverLarge),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1),
          borderRadius: BorderRadius.circular(Dimensions.radiusOverLarge),
        ),
      ),
    );
  }
}
