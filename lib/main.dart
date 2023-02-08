import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_player/components/bottom_navigation.dart';
import 'package:music_player/screens/discover_screen.dart';
import 'package:music_player/screens/onboarding_screen.dart';
import 'package:music_player/screens/profle_screen.dart';
import 'package:music_player/screens/song_screen.dart';

import 'package:music_player/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialRoute: '/onboarding',
          getPages: [
            GetPage(
              name: '/',
              page: () => const BottomNavigationScreen(),
            ),
            GetPage(
              name: '/song',
              page: () => const SongScreen(),
            ),
            GetPage(
              name: '/discovery',
              page: () => const DiscoverScreen(),
            ),
            GetPage(
              name: '/profle',
              page: () => const ProfileScreen(),
            ),
            GetPage(
              name: '/onboarding',
              page: () => const OnboardingScreen(),
            ),
          ],
          debugShowCheckedModeBanner: false,
          theme: theme(),
          home: const BottomNavigationScreen(),
        );
      },
    );
  }
}
