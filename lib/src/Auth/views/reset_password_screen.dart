import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/widgets/back_button.dart';
import 'package:doctor_app/common/widgets/custom_button.dart';
import 'package:doctor_app/common/widgets/password_field.dart';
import 'package:doctor_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _confirmPasswordController =
      TextEditingController();

  final FocusNode _passwordNode = FocusNode();
  final FocusNode _confirmPasswordNode = FocusNode();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _passwordNode.dispose();
    _confirmPasswordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: AppBackButton(
          onTap: () => context.pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 20.h),
          Center(
            child: SizedBox(
              width: 130.w,
              height: 130.h,
              child: Image.asset(
                R.ASSETS_IMAGES_LOGO_PNG,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Dabiib",
            textAlign: TextAlign.center,
            style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            "Create new password",
            textAlign: TextAlign.center,
            style: appStyle(18, Colors.black, FontWeight.w600),
          ),
          SizedBox(height: 5.h),
          Text(
            "Your new password must be different from previously used password",
            textAlign: TextAlign.center,
            style: appStyle(12, Kolors.kGray, FontWeight.normal),
          ),
          SizedBox(height: 25.h),
          PasswordField(
            controller: _passwordController,
            focusNode: _passwordNode,
            radius: 8,
            hintText: "Password",
          ),
          SizedBox(height: 20.h),
          PasswordField(
            controller: _confirmPasswordController,
            focusNode: _confirmPasswordNode,
            radius: 8,
            hintText: "Confirm Password",
          ),
          SizedBox(height: 25.h),
          CustomButton(
            onTap: () {
              // Implement password reset logic here
            },
            text: "Reset Password",
            btnWidth: ScreenUtil().screenWidth,
            btnHieght: 53,
            radius: 20,
          ),
        ],
      ),
    );
  }
}
