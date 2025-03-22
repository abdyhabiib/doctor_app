import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends HookWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final results = fetchDefaultAdddress();
    // final address = results.address;
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 3.w),
            child: ReusableText(
                text: "Location",
                style: appStyle(12, Kolors.kGray, FontWeight.normal)),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              const Icon(
                Ionicons.location,
                size: 14,
                color: Kolors.kPrimary,
              ),
              SizedBox(
                width: 5.h,
              ),
              // SizedBox(
              //   width: ScreenUtil().screenWidth * 0.7,
              //   child: Text(
              //       // address != null
              //       //     ? address.address
              //       //     : "Please Set Your location",
              //       // maxLines: 1,
              //       // style: appStyle(14, Kolors.kDark, FontWeight.w500)
              //       ),
              // )
            ],
          ),
        ],
      ),
      actions: const [
        // NotificationsWidget(),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: GestureDetector(
          onTap: () {
            context.go('/search');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.5,
                        color: Kolors.kGrayLight,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w), // Ensures even spacing inside
                      child: Row(
                        children: [
                          const Icon(
                            Ionicons.search,
                            size: 20,
                            color: Kolors.kPrimaryLight,
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            // Allows text to take available space
                            child: ReusableText(
                              text: "Search",
                              style:
                                  appStyle(14, Kolors.kGray, FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
