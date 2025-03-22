// ignore_for_file: deprecated_member_use, use_super_parameters

import 'package:flutter/material.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButtonsWidget extends StatelessWidget {
  final VoidCallback onGoogleTap;
  final VoidCallback onFacebookTap;

  const SocialButtonsWidget({
    Key? key,
    required this.onGoogleTap,
    required this.onFacebookTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Google Button
        GestureDetector(
          onTap: onGoogleTap,
          child: Container(
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              border: Border.all(color: Kolors.kGray.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons
                      .account_circle, // You can change this icon to a Google icon or another representation
                  color: Colors.red, // Google brand color
                  size: 24,
                ),
                SizedBox(width: 10.w),
                Text(
                  'Sign in with Google',
                  style: appStyle(14, Kolors.kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        // Facebook Button
        GestureDetector(
          onTap: onFacebookTap,
          child: Container(
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons
                      .facebook, // Facebook's default icon (check Flutter docs for specific usage)
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(width: 10.w),
                Text(
                  'Sign in with Facebook',
                  style: appStyle(14, Kolors.kWhite, FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
