import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:music_player/constants.dart';

import '../components/components.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            'assets/images/Onboarding.png',
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black,
                  Colors.black54,
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 300,
            right: 0,
            left: 0,
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Millions of Music',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Be the first to discover, play \nand share your favorite tracks \nfrom emerging artists',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: kSecondaryColor),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: IconButton(
              color: kAccentColor,
              iconSize: 80,
              onPressed: () {
                Get.to((const BottomNavigationScreen()));
              },
              icon: const Icon(Icons.play_circle),
            ),
          )
        ],
      ),
    );
  }
}
