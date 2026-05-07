// ── 4. guidance_note_bottom_sheet.dart ──

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_fonts.dart';

class GuidanceNoteBottomSheet extends StatefulWidget {
  const GuidanceNoteBottomSheet({super.key});

  @override
  State<GuidanceNoteBottomSheet> createState() =>
      _GuidanceNoteBottomSheetState();
}

class _GuidanceNoteBottomSheetState extends State<GuidanceNoteBottomSheet> {
  final TextEditingController _noteCtrl = TextEditingController();

  @override
  void dispose() {
    _noteCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: .none,
      children: [
        Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.r),
              topRight: Radius.circular(24.r),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      TablerIcons.chevronLeft,
                      size: 24.sp,
                      color: AppColors.black,
                    ),
                    SizedBox(width: 5.w),
                    Text('Back', style: AppFonts.black14w500),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Text('Guidance Note', style: AppFonts.black20w400),
              SizedBox(height: 12.h),

              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: .all(color: AppColors.dividerColor),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text("Type your note", style: AppFonts.black14w500),
                    SizedBox(height: 12.h),
                    TextFormField(
                      controller: _noteCtrl,
                      decoration: InputDecoration(
                        hintText: "e.g estimated time",
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    Divider(height: 0.h, color: AppColors.dividerColor),
                  ],
                ),
              ),
              SizedBox(height: 12.h),

              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    child: ElevatedButton.icon(
                      iconAlignment: .end,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        TablerIcons.circleCheck,
                        size: 24.sp,
                        color: AppColors.white,
                      ),
                      label: const Text('Save'),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.5),
                            blurRadius: 10.r,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Text('Cancel', style: AppFonts.black14w400),
                          SizedBox(width: 4.w),
                          Icon(
                            TablerIcons.trash,
                            size: 24.sp,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: MediaQuery.paddingOf(context).bottom + 20.h),
            ],
          ),
        ),
        Positioned(
          top: -20.h,
          right: 8.w,
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
                border: .all(color: AppColors.dividerColor),
              ),
              alignment: .center,
              child: Center(
                child: Icon(
                  TablerIcons.playstationX,
                  size: 30.sp,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
