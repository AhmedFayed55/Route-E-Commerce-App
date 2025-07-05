import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/custom_elevated_button.dart';


class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.loginClick});

  final void Function() loginClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CustomElevatedButton(
          isStadiumBorder: false,
          label: 'Login',
          backgroundColor: ColorManager.white,
          textStyle: getBoldStyle(
            color: ColorManager.primary,
            fontSize: AppSize.s18,
          ),
          onTap: loginClick,
        ),
      ),
    );
  }
}
