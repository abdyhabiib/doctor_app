// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:doctor_app/common/services/storage.dart';
import 'package:doctor_app/common/widgets/error_modal.dart';
import 'package:doctor_app/src/Auth/controllers/service.dart';
import 'package:doctor_app/src/Auth/models/profile_model.dart';
import 'package:doctor_app/src/entrypoint/controllers/bottom_tab_notifies.dart';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthNotifier with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  bool _isRLoading = false;
  bool get isRLoading => _isRLoading;
  void setRLoading() {
    _isRLoading = !_isRLoading;
    notifyListeners();
  }

  // ✅ LOGIN FUNCTION using ApiService
  Future<void> loginFunc(
      String email, String password, BuildContext ctx) async {
    setLoading(true);
    try {
      final response =
          await ApiService.loginUser(email: email, password: password);

      if (response.containsKey('token')) {
        String accessToken = response['token'];
        print("🔑 Token received: $accessToken");

        // ✅ Store token securely
        Storage().setString('token', accessToken);

        // ✅ Fetch user data
        await getUser(ctx);

        ctx.go('/home'); // Navigate to home
      } else {
        showErrorPopup(
            ctx,
            response['message'] ?? "Login failed. Please try again.",
            null,
            null);
      }
    } catch (e) {
      print("❌ Exception: $e");
      showErrorPopup(ctx, "An error occurred during login", null, null);
    } finally {
      setLoading(false);
    }
  }

  // ✅ REGISTER FUNCTION using ApiService
  Future<void> registrationFunc(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required BuildContext ctx}) async {
    setRLoading();
    try {
      final response = await ApiService.registerUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      if (response['status'] == "success") {
        setRLoading();
        ctx.pop(); // Navigate back after successful registration
      } else {
        showErrorPopup(
            ctx, response['message'] ?? "Registration failed.", null, null);
      }
    } catch (e) {
      showErrorPopup(ctx, "An error occurred during registration", null, null);
    } finally {
      setRLoading();
    }
  }

  // ✅ FETCH USER DATA
  Future<void> getUser(BuildContext ctx) async {
    try {
      String? token = Storage().getString('token');
      if (token == null) {
        showErrorPopup(
            ctx, "Session expired. Please log in again.", null, null);
        return;
      }

      final response = await ApiService.getUserData(token);
      if (response.containsKey('userData')) {
        Storage().setString('userData', jsonEncode(response['userData']));
        ctx.read<TabIndexNotifier>().setIndex(0);

        // ✅ Navigate user based on login state
        GoRouter.of(ctx).go('/home'); // Change to your home screen route
      } else {
        showErrorPopup(
            ctx, "Failed to fetch user data. Please try again.", null, null);
      }
    } catch (e) {
      print("❌ Error fetching user data: $e");
    }
  }

  // ✅ GET STORED USER DATA
  ProfileModel? getUserData() {
    String? data = Storage().getString('userData');
    return data != null ? profileModelFromJson(data) : null;
  }
}
