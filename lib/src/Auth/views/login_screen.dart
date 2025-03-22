// ignore_for_file: use_build_context_synchronously

import 'package:doctor_app/common/utils/kcolors.dart';
import 'package:doctor_app/common/widgets/app_style.dart';
import 'package:doctor_app/common/widgets/back_button.dart';
import 'package:doctor_app/common/widgets/custom_button.dart';
import 'package:doctor_app/common/widgets/email_textfield.dart';
import 'package:doctor_app/common/widgets/password_field.dart';
import 'package:doctor_app/const/resource.dart';
import 'package:doctor_app/src/Auth/controllers/service.dart';
import 'package:doctor_app/src/Auth/widgets/devider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordNode = FocusNode();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isLoading = false;

  Future<void> login() async {
    setState(() => isLoading = true);
    final response = await ApiService.loginUser(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    setState(() => isLoading = false);

    if (response['success'] == true) {
      await storage.write(key: 'auth_token', value: response['token']);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login successful!")),
      );
      // Navigate to home screen after successful login
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['msg'] ?? 'Login failed')),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: AppBackButton(onTap: () => context.go('/home')),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(height: 20.h),
          Center(
            child: SizedBox(
              width: 130.w,
              height: 130.h,
              child: Image.asset(R.ASSETS_IMAGES_LOGO_PNG, fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 20.h),
          Text("Hi, Welcome Back!",
              textAlign: TextAlign.center,
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold)),
          SizedBox(height: 10.h),
          Text("Hope you are doing well",
              textAlign: TextAlign.center,
              style: appStyle(12, Kolors.kGray, FontWeight.normal)),
          SizedBox(height: 25.h),
          EmailTextField(
            radius: 8,
            height: 75,
            hintText: "Username or email",
            controller: _emailController,
            prefixIcon: const Icon(CupertinoIcons.profile_circled,
                size: 20, color: Kolors.kGray),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 25.h),
          PasswordField(
            controller: _passwordController,
            focusNode: _passwordNode,
            radius: 8,
            height: 75,
            hintText: 'Password',
          ),
          SizedBox(height: 10.h),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => context.push('/forgot-password'),
              child: Text('Forgot password?',
                  style: appStyle(12, Colors.blue, FontWeight.normal)),
            ),
          ),
          SizedBox(height: 20.h),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Kolors.kPrimary))
              : CustomButton(
                  onTap: login,
                  text: "L O G I N",
                  btnWidth: ScreenUtil().screenWidth,
                  btnHieght: 53,
                  radius: 20,
                ),
          SizedBox(height: 60.h),
          const OrDividerWidget(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 200.h,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 110.0),
            child: GestureDetector(
              onTap: () => context.push('/register'),
              child: Text('Do not have an account? Register a new one',
                  style: appStyle(12, Colors.blue, FontWeight.normal)),
            ),
          ),
        ),
      ),
    );
  }
}
