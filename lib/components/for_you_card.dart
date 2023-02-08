import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';

class ForYouCard extends StatelessWidget {
  const ForYouCard({
    super.key,
    required this.forYou,
  });

  final ForYou forYou;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Image.asset(
                forYou.url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(forYou.title)
        ],
      ),
    );
  }
}
