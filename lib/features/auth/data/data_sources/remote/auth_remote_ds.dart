import 'package:e_commerce/features/auth/data/models/user_model.dart';

import '../../../domain/entities/sign_up_entity.dart';

abstract class AuthRemoteDs{


  Future<bool> signIn(String email, String password);
  Future<UserModel> signUp(SignUpEntity signUpEntity);

}