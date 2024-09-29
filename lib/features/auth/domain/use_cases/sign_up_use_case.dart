import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/sign_up_entity.dart';
import 'package:e_commerce/features/auth/domain/repositories/auth_repo.dart';

 class SignUpUseCase{
  AuthRepo repo;

  SignUpUseCase(this.repo);

  Future<Either<Failures,UserModel>> call(SignUpEntity signUpEntity)=>repo.signUp(signUpEntity);
}