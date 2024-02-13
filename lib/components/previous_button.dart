import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../theme/app_theme.dart';

Widget previousButton({Function? onTap, required BuildContext context}) {
  return GestureDetector(
    onTap: () {
      onTap?.call() ?? Navigator.of(context).pop();
    },
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Icon(
            Icons.arrow_back_ios_rounded,
            size: 12,
          ),
          const Gap(5),
          Text(
            "Previous",
            style: AppTheme.textStyle(
              color: AppTheme.primaryColor,
              fontSize: 12,
              fontWeight_: AppTheme.semiBold,
            ),
          ),
        ],
      ),
    ),
  );
}
