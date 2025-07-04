import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../widgets/dont_have_account.dart';
import '../widgets/login_button.dart';
import '../widgets/sign_in_fields.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSize.s40.h),
              Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
              SizedBox(height: AppSize.s40.h),
              Text(
                'Welcome Back To Route',
                style: getBoldStyle(
                  color: ColorManager.white,
                ).copyWith(fontSize: FontSize.s24.sp),
              ),
              Text(
                'Please sign in with your mail',
                style: getLightStyle(
                  color: ColorManager.white,
                ).copyWith(fontSize: FontSize.s16.sp),
              ),
              SizedBox(height: AppSize.s50.h),
              SignInFields(
                emailController: emailController,
                passController: passController,
              ),
              SizedBox(height: AppSize.s8.h),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forget password?',
                      style: getMediumStyle(
                        color: ColorManager.white,
                      ).copyWith(fontSize: FontSize.s18.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSize.s60.h),
              LoginButton(),
              SizedBox(height: 30.h),
              DontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
