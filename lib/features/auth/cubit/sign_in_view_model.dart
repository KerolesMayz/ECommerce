import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/widget/dialog_utils.dart';
import 'package:ecommerce_app/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/use_case/signin_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';
@injectable
class SignInViewModel extends Cubit<SignInState> {
  SignInUseCase signInUseCase;
  TextEditingController passwordController = TextEditingController(text: 'Ab12345@');
  TextEditingController emailController = TextEditingController(text: 'kero@kero.com');
  var formKey = GlobalKey<FormState>();

  SignInViewModel({required this.signInUseCase}) : super(SignInInitial());
  void signIn() async {
    if(formKey.currentState!.validate() == true){
      emit(SignInLoadingState());
      var result = await signInUseCase.invoke(passwordController.text, emailController.text);
      switch(result){
        case Success<AuthEntity>():
          emit(SignInSuccessState(signInResponse: result.data));
        case ServerError<AuthEntity>():
          emit(SignInErrorState(errorMessage: result.message));
        case ConnectivityError<AuthEntity>():
          emit(SignInErrorState(errorMessage: result.message));
        case GeneralException<AuthEntity>():
          emit(SignInErrorState(errorMessage: result.exception.toString()));
      }
    }
  }

  void onLoadingState(BuildContext context){
    DialogUtils.showLoadingDialog(context);
  }
  void onErrorState(BuildContext context, String errorMessage){
    DialogUtils.showErrorDialog(context, errorMessage);
  }
}
