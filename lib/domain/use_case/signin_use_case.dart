import 'package:ecommerce_app/domain/entity/auth_entity.dart';
import 'package:ecommerce_app/domain/entity/result_entity.dart';
import 'package:ecommerce_app/domain/repository/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInUseCase {
  AuthRepo authRepo;

  SignInUseCase({required this.authRepo});

  Future<Result<AuthEntity>> invoke(String password, String email) async {
    return await authRepo.signIn(password, email);
  }
}
