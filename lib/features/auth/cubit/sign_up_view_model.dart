import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/core/widget/dialog_utils.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/domain/use_case/signup_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';
@injectable
class SignUpViewModel extends Cubit<SignUpState> {
  SignupUseCase signupUseCase;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SignUpViewModel({required this.signupUseCase}) : super(SignUpInitialState());

  void signup() async {
    if (formKey.currentState!.validate() == true) {
      emit(SignUpLoadingState());
      var result = await signupUseCase.invoke(
          nameController.text,
          emailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text);
      switch (result) {
        case Success<AuthEntity>():
          emit(SignUpSuccessState(signupResponse: result.data));
        case ServerError<AuthEntity>():
          emit(SignUpErrorState(errorMessage: result.message));
        case ConnectivityError<AuthEntity>():
          emit(SignUpErrorState(errorMessage: result.message));
        case GeneralException<AuthEntity>():
          emit(SignUpErrorState(errorMessage: result.exception.toString()));
      }
    }
  }
  void onLoadingState(BuildContext context){
    DialogUtils.showLoadingDialog(context);
  }
  void onErrorState(BuildContext context, String errorMessage){
    DialogUtils.showErrorDialog(context, errorMessage);
  }
  void onSuccessState(BuildContext context){
    DialogUtils.showMessageDialog(
        context, 'Account Created Successfully!',
        posActionName: 'go to Login',
        posAction: () =>
            _onSuccessStateGoToLoginPress(context),
        negActionName: 'Login Now',
        negAction: () =>
            _onSuccessStateLoginNowPress(context));
  }
  void _onSuccessStateGoToLoginPress(BuildContext context){
    DialogUtils.hideDialog(context);
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.signInRoute, (route) => false);
  }
  void _onSuccessStateLoginNowPress(BuildContext context){
    DialogUtils.hideDialog(context);
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.mainRoute, (route) => false);
  }

}
