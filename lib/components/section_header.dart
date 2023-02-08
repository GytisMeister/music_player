import 'package:flutter/material.dart';

import '../constants.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(
      {super.key, required this.title, this.action = 'See All'});

  final String title;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Row(
          children: [
            Text(
              action,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: kSecondaryColor),
            ),
            const Icon(
              Icons.chevron_right,
              color: kSecondaryColor,
              size: 20,
            )
          ],
        ),
      ],
    );
  }
}
