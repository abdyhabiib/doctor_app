import 'package:doctor_app/common/services/storage.dart';
import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/utils/kstrings.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/widgets/custom_button.dart';
import 'package:doctor_app/common/widgets/reusable_text.dart';
import 'package:doctor_app/src/Auth/controllers/auth_notifier.dart';
import 'package:doctor_app/src/Auth/models/profile_model.dart';
import 'package:doctor_app/src/Auth/views/login_screen.dart';
import 'package:doctor_app/src/entrypoint/controllers/bottom_tab_notifies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    if (accessToken == null) {
      return const LoginPage();
    }
    return Scaffold(
      body: Consumer<AuthNotifier>(builder: (context, authNotifier, child) {
        ProfileModel? user = authNotifier.getUserData();
        return ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                CircleAvatar(
                    radius: 35,
                    backgroundColor: Kolors.kOffWhite,
                    backgroundImage: NetworkImage(AppText.kProfilePic)),
                SizedBox(
                  height: 15.h,
                ),
                ReusableText(
                    text: user!.email,
                    style: appStyle(11, Kolors.kGray, FontWeight.normal)),
                SizedBox(
                  height: 7.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                      color: Kolors.kOffWhite,
                      borderRadius: BorderRadius.circular(10)),
                  child: ReusableText(
                      text: user.username,
                      style: appStyle(14, Kolors.kDark, FontWeight.w600)),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              color: Kolors.kOffWhite,
              child: Column(
                children: [
                  // PorfileTileWidget(
                  //   title: 'My Orders ',
                  //   leading: Octicons.checklist,
                  //   onTap: () {
                  //     context.push('/orders');
                  //   },
                  // ),
                  // PorfileTileWidget(
                  //   title: 'shipping address ',
                  //   leading: MaterialIcons.location_pin,
                  //   onTap: () {
                  //     context.push('/addresses');
                  //   },
                  // ),
                  // PorfileTileWidget(
                  //   title: 'Privacy Policy ',
                  //   leading: MaterialIcons.policy,
                  //   onTap: () {
                  //     context.push('/policy');
                  //   },
                  // ),
                  // PorfileTileWidget(
                  //   title: 'Help Center  ',
                  //   leading: AntDesign.customerservice,
                  //   onTap: () => showHelpCenterBottomSheet(context),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: CustomButton(
                text: "Logout",
                btnColor: Kolors.kRed,
                btnHieght: 35,
                btnWidth: ScreenUtil().screenWidth,
                onTap: () {
                  Storage().removeKey('accessToken');
                  context.read<TabIndexNotifier>().setIndex(0);
                  context.go('/home');
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
