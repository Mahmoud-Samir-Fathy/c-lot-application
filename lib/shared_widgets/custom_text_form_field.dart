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
    this.onSubmit, // Added onSubmit parameter
  });

  final TextEditingController? controller;
  final String? hint;
  final bool isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator; // Validator parameter added
  final Function(String)? onSubmit; // onSubmit callback

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
      validator: widget.validator, // Validator passed to the TextFormField
      onFieldSubmitted: widget.onSubmit, // Handle on submit action
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: const Color(0xFF342F3F), // Matches the darker background
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
