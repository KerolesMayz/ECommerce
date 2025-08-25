import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/core/widget/dialog_utils.dart';
import 'package:ecommerce_app/features/auth/cubit/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpViewModel signUpViewModel = getIt<SignUpViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpViewModel, SignUpState>(
      bloc: signUpViewModel,
      listener: (context, state) {
        switch (state) {
          case SignUpInitialState():
            break;
          case SignUpLoadingState():
            DialogUtils.showLoadingDialog(context);
          case SignUpErrorState():
            DialogUtils.hideDialog(context);
            DialogUtils.showErrorDialog(context, state.errorMessage);
          case SignUpSuccessState():
            DialogUtils.hideDialog(context);
            DialogUtils.showMessageDialog(
                context, 'Account Created Successfully!',
                posActionName: 'go to Login',
                posAction: () =>
                    signUpViewModel.onSuccessGoToLoginPress(context),
                negActionName: 'Login Now',
                negAction: () =>
                    signUpViewModel.onSuccessLoginNowPress(context));
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Form(
                key: signUpViewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    BuildTextField(
                      controller: signUpViewModel.nameController,
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: signUpViewModel.phoneController,
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: signUpViewModel.emailController,
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: signUpViewModel.passwordController,
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      controller: signUpViewModel.rePasswordController,
                      hint: 're enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: (val) =>
                          AppValidators.validateConfirmPassword(
                              val, signUpViewModel.passwordController.text),
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          // borderRadius: AppSize.s8,
                          label: 'Sign Up',
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s20),
                          onTap: signUpViewModel.signup,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
