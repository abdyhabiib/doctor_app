import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/widgets/back_button.dart';
import 'package:doctor_app/common/widgets/custom_button.dart';
import 'package:doctor_app/common/widgets/email_textfield.dart';
import 'package:doctor_app/const/resource.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgottenPasswordPage extends StatefulWidget {
  const ForgottenPasswordPage({super.key});

  @override
  State<ForgottenPasswordPage> createState() => _ForgottenPasswordPageState();
}

class _ForgottenPasswordPageState extends State<ForgottenPasswordPage> {
  late final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
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
          onTap: () {
            context.go('/login');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            // Logo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: 130.w,
                  height: 130.h,
                  child: Image.asset(
                    R.ASSETS_IMAGES_LOGO_PNG,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Forgot Password",
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "Enter your email to receive a password reset link",
              textAlign: TextAlign.center,
              style: appStyle(14, Kolors.kGray, FontWeight.normal),
            ),
            SizedBox(height: 30.h),
            EmailTextField(
              radius: 8,
              height: 75,
              hintText: "Enter your email",
              controller: _emailController,
              prefixIcon: const Icon(
                CupertinoIcons.mail,
                size: 20,
                color: Kolors.kGray,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 30.h),
            CustomButton(
              onTap: () {
                context.push('/vertification');
              },
              text: "Reset Password",
              btnWidth: ScreenUtil().screenWidth,
              btnHieght: 53,
              radius: 20,
            ),
          ],
        ),
      ),
    );
  }
}
