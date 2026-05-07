import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tabler_icons_plus/tabler_icons_plus.dart';

import '../../utils/enums.dart';
import '../resources/app_colors.dart';
import '../resources/app_fonts.dart';
import '../view_models/auth_view_model.dart';
import '../widgets/booking_request_card.dart';
import '../widgets/bottom sheet/filter_sheet.dart';
import '../widgets/service_request_card.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userType = context.read<AuthViewModel>().userType;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          ListTile(
            title: Text("Service requests", style: AppFonts.black20w400),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(TablerIcons.bell, size: 32.sp, color: AppColors.black),
            ),
          ),
          SizedBox(height: 22.h),
          if (userType != UserType.client)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(ServiceRequest.values.length, (index) {
                  final isSelected = _selectedIndex == index;
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedIndex = index),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.white.withValues(alpha: 0.4)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50.r),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Text(
                          ServiceRequest.values[index].label,
                          style: AppFonts.black14w400,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          else
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.4),

                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(color: Colors.white),
              ),
              child: Text("Booking", style: AppFonts.black14w400),
            ),

          SizedBox(height: 18.h),
          TextField(
            decoration: InputDecoration(
              hintText: "Search for requests",
              hintStyle: AppFonts.grey14w400,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              suffixIcon: Icon(
                TablerIcons.search,
                color: AppColors.black,
                size: 24.sp,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.white.withValues(alpha: 0.5),
                builder: (_) => const FilterSheet(),
              );
            },
            child: Row(
              mainAxisAlignment: .end,
              children: [
                Text("Filter", style: AppFonts.black14w500),
                SizedBox(width: 5.w),
                Icon(TablerIcons.filter, color: AppColors.black, size: 23.sp),
                SizedBox(width: 20.w),
                Text("Sort By", style: AppFonts.black14w500),
                SizedBox(width: 5.w),
                Icon(
                  TablerIcons.sortDescending,
                  color: AppColors.black,
                  size: 23.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,

              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == 9
                        ? MediaQuery.paddingOf(context).bottom + 30.h
                        : 15.h,
                  ),
                  child: userType == UserType.client
                      ? BookingRequestCard(
                          status: index % 2 == 0
                              ? Status.booked
                              : Status.completed,
                        )
                      : ServiceRequestCard(index: _selectedIndex),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
