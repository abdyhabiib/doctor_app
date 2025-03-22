import 'package:doctor_app/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(110),
          child: CustomAppBar(),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          children: [
            // SizedBox(
            //   height: 20.h,
            // ),
            // const HomeSlider(),
            // SizedBox(
            //   height: 15.h,
            // ),
            // const HomeHeader(),
            // SizedBox(
            //   height: 10.h,
            // ),
            // const HomeCategoriesList(),
            // SizedBox(
            //   height: 15.h,
            // ),
            // HomeTabs(tabController: _tabController),
            // SizedBox(
            //   height: 15.h,
            // ),
            // ExploreProducts(),
            // SizedBox(
            //   height: 100.h,
            // ),
          ],
        ));
  }
}
