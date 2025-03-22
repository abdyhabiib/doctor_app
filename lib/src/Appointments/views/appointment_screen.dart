import 'package:doctor_app/common/services/storage.dart';
import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/utils/kstrings.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/widgets/reusable_text.dart';
import 'package:doctor_app/src/Auth/views/login_screen.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatelessWidget {
  const AppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    if (accessToken == null) {
      return const LoginPage();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true, // Center the title
        title: ReusableText(
            text: AppText.kAppointment,
            style: appStyle(16, Kolors.kPrimary, FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
      ),
    );
  }
}
