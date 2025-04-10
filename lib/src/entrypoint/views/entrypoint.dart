// ignore_for_file: must_be_immutable
import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/src/Appointments/views/appointment_screen.dart';
import 'package:doctor_app/src/Profile/Views/profile_screen.dart';
import 'package:doctor_app/src/entrypoint/controllers/bottom_tab_notifies.dart';
import 'package:doctor_app/src/homepage/views/home_screen.dart';
import 'package:doctor_app/src/wishlist/views/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AppEntryPoint extends HookWidget {
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const WishListPage(),
    const AppointmentPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // final rslt = fetchCartCount(context);
    // final data = rslt.count;

    return Consumer<TabIndexNotifier>(
      builder: (context, tabIndexNotifier, child) {
        return Scaffold(
            body: Stack(
          children: [
            pageList[tabIndexNotifier.index],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: Kolors.kOffWhite,
                  ),
                  child: BottomNavigationBar(
                      selectedFontSize: 12,
                      elevation: 0,
                      backgroundColor: Kolors.kOffWhite,
                      showSelectedLabels: true,
                      selectedLabelStyle:
                          appStyle(9, Kolors.kPrimary, FontWeight.w500),
                      showUnselectedLabels: false,
                      currentIndex: tabIndexNotifier.index,
                      selectedItemColor: Kolors.kPrimary,
                      unselectedItemColor: Kolors.kGray,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.black38),
                      onTap: (i) {
                        tabIndexNotifier.setIndex(i);
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: tabIndexNotifier.index == 0
                                ? const Icon(
                                    AntDesign.home,
                                    color: Kolors.kPrimaryLight,
                                    size: 24,
                                  )
                                : const Icon(
                                    AntDesign.home,
                                    size: 24,
                                  ),
                            label: 'Home'),
                        BottomNavigationBarItem(
                            icon: tabIndexNotifier.index == 1
                                ? const Icon(
                                    Ionicons.heart,
                                    color: Kolors.kPrimaryLight,
                                    size: 24,
                                  )
                                : const Icon(
                                    Ionicons.heart_outline,
                                    size: 24,
                                  ),
                            label: 'wishlist'),
                        BottomNavigationBarItem(
                            icon: tabIndexNotifier.index == 2
                                ? Badge(
                                    // label: Text(data.cartCount.toString()),
                                    child: const Icon(
                                      MaterialCommunityIcons.calendar_clock,
                                      color: Kolors.kPrimaryLight,
                                      size: 24,
                                    ),
                                  )
                                : Badge(
                                    // label: Text(data.cartCount.toString()),
                                    child: const Icon(
                                      MaterialCommunityIcons
                                          .calendar_clock_outline,
                                      size: 24,
                                    ),
                                  ),
                            label: 'Appointments'),
                        BottomNavigationBarItem(
                            icon: tabIndexNotifier.index == 3
                                ? const Icon(
                                    EvilIcons.user,
                                    color: Kolors.kPrimaryLight,
                                    size: 34,
                                  )
                                : const Icon(
                                    EvilIcons.user,
                                    size: 34,
                                  ),
                            label: 'Profile'),
                      ])),
            ),
          ],
        ));
      },
    );
  }
}
