import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  AuthRepo authRepo;

  SignupUseCase({required this.authRepo});

  Future<Result<AuthEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) async {
    return await authRepo.signup(name, email, password, rePassword, phone);
  }
}
