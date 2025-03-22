import 'package:doctor_app/common/services/storage.dart';
import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/utils/kstrings.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/widgets/reusable_text.dart';
import 'package:doctor_app/src/Auth/views/login_screen.dart';
import 'package:flutter/material.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({super.key});

  Future<String?> _getAccessToken() async {
    return await Storage().getString('auth_token');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getAccessToken(),
      builder: (context, snapshot) {
        // While the token is loading, show a loader
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // If no token exists, redirect to LoginPage
        if (snapshot.data == null) {
          return const LoginPage();
        }

        // Token is available, display the wishlist
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            centerTitle: true, // Center the title
            title: ReusableText(
                text: AppText.kWishlist,
                style: appStyle(16, Kolors.kPrimary, FontWeight.bold)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            // child: const WishListWidget(),
          ),
        );
      },
    );
  }
}
