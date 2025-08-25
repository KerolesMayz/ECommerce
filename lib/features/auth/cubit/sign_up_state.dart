part of 'sign_up_view_model.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitialState extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpErrorState extends SignUpState {
  final String errorMessage;

  SignUpErrorState({required this.errorMessage});
}

final class SignUpSuccessState extends SignUpState {
  final AuthResponseEntity signupResponse;

  SignUpSuccessState({required this.signupResponse});
}

