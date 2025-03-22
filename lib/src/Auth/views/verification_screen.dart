import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/widgets/back_button.dart';
import 'package:doctor_app/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  late final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
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
            context.go('/forgot-password');
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Center(
              child: SizedBox(
                width: 100.w,
                height: 100.h,
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Verify Code",
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "Enter the code we just sent you on your registered Email",
              textAlign: TextAlign.center,
              style: appStyle(14, Kolors.kGray, FontWeight.normal),
            ),
            SizedBox(height: 30.h),
            Pinput(
              controller: _codeController,
              length: 6,
              defaultPinTheme: PinTheme(
                width: 65.w,
                height: 65.h,
                textStyle: appStyle(20, Colors.black, FontWeight.bold),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            CustomButton(
              onTap: () {
                context.push('/reset-password');
              },
              text: "Verify",
              btnWidth: ScreenUtil().screenWidth,
              btnHieght: 53,
              radius: 20,
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                // Handle resend code logic
              },
              child: Text(
                "Didn’t get the Code? Resend",
                style: appStyle(14, Colors.blue, FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
