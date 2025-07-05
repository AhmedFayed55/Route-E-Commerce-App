import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/validators.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widgets/main_text_field.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passController,
    required this.rePassController,
    required this.formKey,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passController;
  final TextEditingController rePassController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: AppSize.s18.h,
        children: [
          BuildTextField(
            controller: nameController,
            backgroundColor: ColorManager.white,
            hint: 'enter your full name',
            label: 'Full Name',
            textInputType: TextInputType.name,
            validation: AppValidators.validateFullName,
          ),
          BuildTextField(
            controller: phoneController,
            hint: 'enter your mobile no.',
            backgroundColor: ColorManager.white,
            label: 'Mobile Number',
            validation: AppValidators.validatePhoneNumber,
            textInputType: TextInputType.phone,
          ),
          BuildTextField(
            controller: emailController,
            hint: 'enter your email address',
            backgroundColor: ColorManager.white,
            label: 'E-mail address',
            validation: AppValidators.validateEmail,
            textInputType: TextInputType.emailAddress,
          ),
          BuildTextField(
            controller: passController,
            hint: 'enter your password',
            backgroundColor: ColorManager.white,
            label: 'password',
            validation: AppValidators.validatePassword,
            isObscured: true,
            textInputType: TextInputType.text,
          ),
          BuildTextField(
            controller: rePassController,
            hint: 'enter your rePassword',
            backgroundColor: ColorManager.white,
            label: 'rePassword',
            validation: AppValidators.validatePassword,
            isObscured: true,
            textInputType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
