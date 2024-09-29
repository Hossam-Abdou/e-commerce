import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/auth/data/data_sources/remote/auth_remote_ds.dart';
import 'package:e_commerce/features/auth/data/models/user_model.dart';
import 'package:e_commerce/features/auth/domain/entities/sign_up_entity.dart';
import 'package:e_commerce/features/auth/domain/repositories/auth_repo.dart';

class AuthRepoImpl implements AuthRepo{
  AuthRemoteDs authRemoteDs;

  AuthRepoImpl(this.authRemoteDs);

  @override
  Future<Either<Failures, bool>> signIn(
      String email, String password) async {
    try {
      bool loggedIn = await authRemoteDs.signIn(email, password);

      if (!loggedIn) {
        return Left(
           InvalidCredtionalFailures("Invalid username Or password"));
      }
      return Right(loggedIn);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserModel>> signUp(SignUpEntity? signUpEntity) {
    throw UnimplementedError();
  }

}