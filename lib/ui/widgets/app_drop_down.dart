import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';

class AppDropdown<T> extends StatelessWidget {
  final T? value;
  final String hint;
  final double? vPadding;
  final List<T> items;
  final Widget Function(T) builder;
  final ValueSetter<T?>? onChanged;
  final String? Function(T?)? validator;
  final Color? fillColor;
  final double? width;
  final TextEditingController? searchController;
  final bool Function(DropdownItem<T>, String)? searchMatchFn;
  final IconData? prefixIcon;

  const AppDropdown({
    super.key,
    this.value,
    required this.hint,
    required this.items,
    required this.builder,
    this.onChanged,
    this.validator,
    this.fillColor,
    this.vPadding,
    this.width,
    this.searchController,
    this.searchMatchFn,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: width ?? double.infinity,
          child: DropdownButtonFormField2<T>(
            style: AppFonts.black14w400,
            decoration: InputDecoration(
              prefixIcon: prefixIcon != null
                  ? SizedBox(width: 24.w, child: Icon(prefixIcon))
                  : null,
              hintText: hint,
              hintStyle: AppFonts.black14w400,
              filled: true,
              fillColor: fillColor ?? Colors.white.withValues(alpha: 0.6),
              border: border,
              enabledBorder: border,
              focusedBorder: border,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12.r),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12.r),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 11.sp),
            ),
            hint: Text(hint, style: AppFonts.grey12w400),
            items: items
                .map(
                  (item) => DropdownItem<T>(value: item, child: builder(item)),
                )
                .toList(),
            onChanged: onChanged,
            validator: validator,
            buttonStyleData: FormFieldButtonStyleData(
              padding: EdgeInsets.only(right: 10.w),
            ),
            iconStyleData: IconStyleData(
              icon: const Icon(
                CupertinoIcons.chevron_down,
                color: AppColors.black,
              ),
              iconSize: 16.sp,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 300.h,
              width: constraints.maxWidth,
              direction: DropdownDirection.left,
              offset: const Offset(0, -10),
              padding: EdgeInsets.zero,
              useRootNavigator: true,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
            ),
            dropdownSearchData: searchController != null
                ? DropdownSearchData(
                    searchController: searchController,
                    searchBarWidgetHeight: 50.h,
                    searchBarWidget: Container(
                      height: 50.h,
                      padding: EdgeInsets.only(
                        top: 8.h,
                        bottom: 4.h,
                        right: 8.w,
                        left: 8.w,
                      ),
                      child: TextFormField(
                        expands: true,
                        maxLines: null,
                        controller: searchController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 8.h,
                          ),
                          hintText: 'Search...',
                          hintStyle: AppFonts.grey12w400,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: searchMatchFn,
                  )
                : null,
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                searchController?.clear();
              }
            },
            barrierBlocksInteraction: true,
          ),
        );
      },
    );
  }

  OutlineInputBorder get border {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.white),
      borderRadius: BorderRadius.circular(12.r),
    );
  }
}
