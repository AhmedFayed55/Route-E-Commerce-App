import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/local_ds/prefs_helper.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/dialogue_utils.dart';
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
  AuthCubit viewModel = getIt<AuthCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController(text: "anaa71137@gmail.com");
    passController = TextEditingController(text: "123456@Aa");
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
    return BlocListener<AuthCubit, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogueUtils.showMessage(
              context: context, message: "Loading.......");
        } else if (state is LoginErrorState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(
              context: context,
              message: state.error.errorMessage,
              title: "Error",
              posActionName: "OK");
        } else if (state is LoginSuccessState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(
              context: context,
              message: "Login Successfully",
              title: "Success",
              posActionName: "OK",
              posAction: () {
                // todo : Save token for auto login
                PrefHelper.saveData(
                    key: AppConstants.token, value: state.response.token);
                // todo : Save email
                PrefHelper.saveData(
                    key: AppConstants.email, value: state.response.user!.email);
                // todo : Save name
                PrefHelper.saveData(
                    key: AppConstants.name, value: state.response.user!.name);
                //todo: navigate to home screen
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.mainRoute, (route) => false);
              });
        }
      },
      child: Scaffold(
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
                  passController: passController, formKey: viewModel.formKey,
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
                LoginButton(loginClick: () =>
                    viewModel.login(emailController.text, passController.text)),
                SizedBox(height: 30.h),
                const DontHaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
