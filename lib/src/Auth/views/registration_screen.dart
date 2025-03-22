// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously

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
import '../../../common/utils/kcolors.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordNode = FocusNode();
  final storage = const FlutterSecureStorage();
  bool isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  Future<void> register() async {
    setState(() => isLoading = true);
    final response = await ApiService.registerUser(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    setState(() => isLoading = false);

    if (response['success'] == true) {
      await storage.write(key: 'auth_token', value: response['token']);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Registration successful!")),
      );
      context.push('/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(response['msg'] ?? 'Registration failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const AppBackButton(),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: 130.w,
                height: 130.h,
                child:
                    Image.asset(R.ASSETS_IMAGES_LOGO_PNG, fit: BoxFit.contain),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text("Create Account",
              textAlign: TextAlign.center,
              style: appStyle(24, Kolors.kPrimary, FontWeight.bold)),
          SizedBox(height: 10.h),
          Text("We are here to help you!",
              textAlign: TextAlign.center,
              style: appStyle(12, Kolors.kGray, FontWeight.normal)),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                EmailTextField(
                  radius: 8,
                  height: 75,
                  hintText: "First Name",
                  controller: _firstNameController,
                  prefixIcon: const Icon(CupertinoIcons.profile_circled,
                      size: 20, color: Kolors.kGray),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 25.h),
                EmailTextField(
                  radius: 8,
                  height: 75,
                  hintText: "Last Name",
                  controller: _lastNameController,
                  prefixIcon: const Icon(CupertinoIcons.profile_circled,
                      size: 20, color: Kolors.kGray),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 25.h),
                EmailTextField(
                  radius: 8,
                  height: 75,
                  hintText: "Your Email",
                  controller: _emailController,
                  prefixIcon: const Icon(CupertinoIcons.mail,
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
                SizedBox(height: 20.h),
                isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Kolors.kPrimary,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Kolors.kWhite),
                        ),
                      )
                    : CustomButton(
                        onTap: register,
                        text: "Create Account",
                        btnWidth: ScreenUtil().screenWidth,
                        btnHieght: 53,
                        radius: 20,
                      ),
                SizedBox(height: 55.h),
                const OrDividerWidget(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 180.h,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 110.0),
            child: GestureDetector(
              onTap: () => context.push('/login'),
              child: Text('Do you have an account ? Sign In',
                  style: appStyle(12, Colors.blue, FontWeight.normal)),
            ),
          ),
        ),
      ),
    );
  }
}
