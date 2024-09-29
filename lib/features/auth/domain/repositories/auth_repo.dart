import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/sign_up_entity.dart';

abstract class AuthRepo{

  Future<Either<Failures,bool>> signIn(String email, String password);
  Future<Either<Failures,UserModel>> signUp(SignUpEntity signUpEntity);
}