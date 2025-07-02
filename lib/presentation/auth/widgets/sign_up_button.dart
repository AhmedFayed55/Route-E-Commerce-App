import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppSize.s60.h,
        width: MediaQuery.of(context).size.width * .9,
        child: CustomElevatedButton(
          // borderRadius: AppSize.s8,
          label: 'Sign Up',
          backgroundColor: ColorManager.white,
          textStyle: getBoldStyle(
            color: ColorManager.primary,
            fontSize: AppSize.s20,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
