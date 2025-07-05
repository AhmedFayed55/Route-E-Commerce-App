import 'package:ecommerce_app/config/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../core/di/di.dart';
import '../../../../core/helpers/dialogue_utils.dart';
import '../manager/Auth_cubit.dart';
import '../manager/auth_states.dart';
import '../widgets/sign_up_button.dart';
import '../widgets/sign_up_fields.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passController;
  late TextEditingController rePassController;
  AuthCubit viewModel = getIt<AuthCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passController = TextEditingController();
    rePassController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passController.dispose();
    rePassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocListener<AuthCubit, AuthStates>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            DialogueUtils.showLoading(
              context: context,
              message: "Loading.........",
            );
          } else if (state is RegisterErrorState) {
            DialogueUtils.hideLoading(context);
            DialogueUtils.showMessage(
              context: context,
              message: state.error.errorMessage,
              posActionName: "OK",
              title: "Error",
            );
          } else if (state is RegisterSuccessState) {
            DialogueUtils.hideLoading(context);
            DialogueUtils.showMessage(
              context: context,
              message: "Register Successfully",
              posActionName: "OK",
              title: "Success",
              posAction: () {
                Navigator.pushReplacementNamed(context, Routes.signInRoute);
              },
            );
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Column(
                spacing: AppSize.s18.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSize.s40.h),
                  Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(height: AppSize.s40.h),
                  SignUpFields(
                    nameController: nameController,
                    phoneController: phoneController,
                    emailController: emailController,
                    passController: passController,
                    rePassController: rePassController,
                    formKey: viewModel.formKey,
                  ),
                  SizedBox(height: AppSize.s50.h),
                  SignUpButton(
                    signUpClick: () => viewModel.register(
                      nameController.text,
                      emailController.text,
                      passController.text,
                      rePassController.text,
                      phoneController.text,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
