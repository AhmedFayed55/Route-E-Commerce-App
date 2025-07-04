import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/validators.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/main_text_field.dart';

class SignInFields extends StatelessWidget {
  const SignInFields({
    super.key,
    required this.emailController,
    required this.passController,
  });

  final TextEditingController emailController;
  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSize.s28.h,
      children: [
        BuildTextField(
          controller: emailController,
          backgroundColor: ColorManager.white,
          hint: 'enter your Email',
          label: 'Email',
          textInputType: TextInputType.emailAddress,
          validation: AppValidators.validateEmail,
        ),
        BuildTextField(
          controller: passController,
          hint: 'enter your password',
          backgroundColor: ColorManager.white,
          label: 'Password',
          validation: AppValidators.validatePassword,
          isObscured: true,
          textInputType: TextInputType.text,
        ),
      ],
    );
  }
}
