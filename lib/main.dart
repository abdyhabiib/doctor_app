import 'package:doctor_app/common/utils/app_routes.dart';
import 'package:doctor_app/common/utils/environment.dart';
import 'package:doctor_app/common/utils/kstrings.dart';
import 'package:doctor_app/src/Auth/controllers/auth_notifier.dart';
import 'package:doctor_app/src/Auth/controllers/password_notifier.dart';
import 'package:doctor_app/src/entrypoint/controllers/bottom_tab_notifies.dart';
import 'package:doctor_app/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:doctor_app/src/splashscreen/splashscreen_screen.dart';
import 'package:doctor_app/src/wishlist/controllers/wishlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);
  await GetStorage.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => OnboardingNotifier()),
      ChangeNotifierProvider(create: (_) => TabIndexNotifier()),
      ChangeNotifierProvider(create: (_) => PasswordNotifier()),
      ChangeNotifierProvider(create: (_) => AuthNotifier()),
      ChangeNotifierProvider(create: (_) => WishlistNotifier()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppText.kAppName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router,
        );
      },
      child: const SplashScreen(),
    );
  }
}
