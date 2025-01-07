import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.controller,
    this.hint,
    this.isPassword = false,
    this.onChanged,
    this.validator,
    this.onSubmit,
    this.mustHave50Characters = false, // New parameter to enforce character count
  });

  final TextEditingController? controller;
  final String? hint;
  final bool isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String)? onSubmit;
  final bool mustHave50Characters; // Optional parameter to enforce character count

  @override
  _CustomTextFormFieldWidgetState createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  bool isObscured = false;

  @override
  void initState() {
    super.initState();
    isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isObscured,
      onChanged: widget.onChanged,
      validator: (value) {
        // Use provided validator if available
        if (widget.validator != null) {
          return widget.validator!(value);
        }

        // Additional validation for 50 characters
        if (widget.mustHave50Characters && value != null) {
          if (value.trim().length < 50) {
            return 'Please enter at least 50 characters.';
          }
        }

        return null;
      },
      onFieldSubmitted: widget.onSubmit,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: const Color(0xFF342F3F),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            isObscured ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[500],
          ),
          onPressed: () {
            setState(() {
              isObscured = !isObscured;
            });
          },
        )
            : null,
      ),
    );
  }
}
