import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/utils/kstrings.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/widgets/custom_button.dart';
import 'package:doctor_app/common/widgets/reusable_text.dart';
import 'package:doctor_app/const/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Kolors.kWhite,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(
              height: 65.h,
            ),
            Image.asset(R.ASSETS_IMAGES_GETSTARTED_PNG),
            SizedBox(
              height: 15.h,
            ),
            Text(
              AppText.kWelcomeHeader,
              textAlign: TextAlign.center,
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: ScreenUtil().screenWidth - 100,
              child: Text(
                AppText.kWelcomeMessage,
                textAlign: TextAlign.center,
                style: appStyle(12, Kolors.kGray, FontWeight.normal),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              text: AppText.kGetStarted,
              btnHieght: 35,
              radius: 20,
              btnWidth: ScreenUtil().screenWidth - 100,
              onTap: () {
                ///Todo; uncomment the below line
                // Storage().setBool('firstOpen', true);
                context.go('/home');
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableText(
                  text: "Already Have and account?",
                  style: appStyle(12, Kolors.kDark, FontWeight.normal),
                ),
                TextButton(
                    onPressed: () {
                      //Navigate to the sign in screen
                      context.go('/login');
                    },
                    child: const Text(
                      "sign In",
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
