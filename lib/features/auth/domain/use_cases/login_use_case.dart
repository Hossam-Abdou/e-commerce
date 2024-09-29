import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/auth/domain/repositories/auth_repo.dart';

 class LoginUseCase{
  AuthRepo repo;

  LoginUseCase(this.repo);

  Future<Either<Failures,bool>> call(String email, String password)=>repo.signIn(email, password);
}