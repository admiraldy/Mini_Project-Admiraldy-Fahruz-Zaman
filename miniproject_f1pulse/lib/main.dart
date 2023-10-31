import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniproject_f1pulse/controller/controller.dart';
import 'package:miniproject_f1pulse/pages/authpage/auth_page.dart';
import 'package:miniproject_f1pulse/pages/authpage/login_signup_page.dart';
import 'package:miniproject_f1pulse/pages/driver_details.dart';
import 'package:miniproject_f1pulse/pages/main_page.dart';
import 'package:miniproject_f1pulse/pages/news_page.dart';
import 'package:miniproject_f1pulse/pages/past_race_details_page.dart';
import 'package:miniproject_f1pulse/pages/upcoming_race_detail_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(HomeController());
  Get.put(DriverStandingController());
  Get.put(ConstructorStandingController());
  runApp(const F1PulseApp());
}

class F1PulseApp extends StatelessWidget {
  const F1PulseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const AuthPage()),
        GetPage(name: '/mainPage', page: () => const MainPage()),
        GetPage(
            name: '/upcomingRaceDetails',
            page: () => const UpcomingRaceDetails()),
        GetPage(name: '/newsDetails', page: () => const NewsPage()),
        GetPage(name: '/pastRaceDetails', page: () => const PastRaceDetails()),
        GetPage(name: '/driverDetails', page: () => const DriverDetails()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
