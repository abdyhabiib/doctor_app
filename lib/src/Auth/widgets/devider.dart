// ignore_for_file: use_super_parameters, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Kolors.kGray.withOpacity(0.5),
            thickness: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            "OR",
            style: appStyle(14, Kolors.kGray, FontWeight.normal),
          ),
        ),
        Expanded(
          child: Divider(
            color: Kolors.kGray.withOpacity(0.5),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
