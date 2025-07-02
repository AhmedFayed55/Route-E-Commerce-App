import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes_manager/routes.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: getSemiBoldStyle(
            color: ColorManager.white,
          ).copyWith(fontSize: FontSize.s16.sp),
        ),
        SizedBox(width: AppSize.s8.w),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, Routes.signUpRoute),

          child: Text(
            'Create Account',
            style: getSemiBoldStyle(
              color: ColorManager.white,
            ).copyWith(fontSize: FontSize.s16.sp),
          ),
        ),
      ],
    );
  }
}
