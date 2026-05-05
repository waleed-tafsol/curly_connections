import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_fonts.dart';

class TextFormFieldWithTitleWidget extends StatelessWidget {
  const TextFormFieldWithTitleWidget({
    super.key,
    required this.title,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.formKey,
    this.validator,
    this.readOnly = false,
    this.maxLines,
  });

  final String title;
  final TextEditingController controller;
  final String? hintText;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  final bool readOnly;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.black14w400,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 7.h),
          TextFormField(
            maxLines: maxLines,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            validator: (value) => validator != null ? validator!(value) : null,
            readOnly: readOnly,
            controller: controller,
            style: AppFonts.black14w400,
            decoration: InputDecoration(
              hintText: hintText ?? "",
              prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
              suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
            ),
          ),
        ],
      ),
    );
  }
}
